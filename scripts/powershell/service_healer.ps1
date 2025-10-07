param(
  [Parameter(Mandatory = $true)][string]$ServiceName,
  [int]$IntervalSec = 30,
  [int]$MaxRestarts = 3,
  [int]$MaxDurationSec = 120
)

# --- Resolve repo root and log path safely ---
function Get-RepoRoot {
  try {
    return [IO.Directory]::GetParent(
             [IO.Directory]::GetParent($PSScriptRoot)
           ).FullName
  } catch {
    return $PSScriptRoot
  }
}

$repoRoot = Get-RepoRoot
$logDir   = Join-Path $repoRoot 'logs'
$null     = New-Item -ItemType Directory -Force -Path $logDir -ErrorAction SilentlyContinue
$LogPath  = Join-Path $logDir 'service_healer.log'

# Validate path; if invalid, fall back to TEMP
try { $null = [IO.Path]::GetFullPath($LogPath) } catch {
  $LogPath = Join-Path $env:TEMP 'service_healer.log'
}

# Start transcript with fallback to TEMP if the first attempt fails
try {
  Start-Transcript -Path $LogPath -Append -ErrorAction Stop
} catch {
  $LogPath = Join-Path $env:TEMP 'service_healer.log'
  Start-Transcript -Path $LogPath -Append -ErrorAction SilentlyContinue
}


# --- helpers ---
function Test-IsAdmin {
  $id = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $p  = New-Object System.Security.Principal.WindowsPrincipal($id)
  return $p.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Ensure log folder
$logDir = Split-Path -Path $LogPath -Parent
New-Item -ItemType Directory -Force -Path $logDir | Out-Null

# Only touch Windows Event Log if running elevated (avoids SecurityException)
$UseEventLog = Test-IsAdmin
if ($UseEventLog -and -not [System.Diagnostics.EventLog]::SourceExists("ServiceHealer")) {
  try { New-EventLog -LogName Application -Source "ServiceHealer" -ErrorAction Stop } catch { $UseEventLog = $false }
}

Start-Transcript -Path $LogPath -Append -ErrorAction SilentlyContinue

$start = Get-Date
$restarts = 0

while ($true) {
  # auto-stop timer
  if ((Get-Date) - $start -gt (New-TimeSpan -Seconds $MaxDurationSec)) {
    Write-Host "Reached MaxDurationSec=$MaxDurationSec. Exiting."
    break
  }
  $svc = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
  if (-not $svc) {
    Write-Host "Service '$ServiceName' not found. Exiting."
    break
  }

  if ($svc.Status -ne 'Running') {
    Write-Host "[$(Get-Date -Format u)] $ServiceName is $($svc.Status). Attempting restart..."
    try {
      Restart-Service -Name $ServiceName -ErrorAction Stop
      $restarts++
      if ($UseEventLog) {
      Write-EventLog -LogName Application -Source "ServiceHealer" -EventId 1000 `
        -EntryType Information -Message "Restarted $ServiceName"
      }
      } catch {
      Write-EventLog -LogName Application -Source "ServiceHealer" -EventId 1001 `
        -EntryType Error -Message $_.Exception.Message
    }
    if ($restarts -ge $MaxRestarts) {
      Write-Host "Max restarts ($MaxRestarts) reached. Exiting."
      break
    }
  }

  $cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
  $mem = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
  Write-Host ("{0:u} CPU:{1,5:N1}%  FreeMem:{2,6}MB  {3}={4}" -f (Get-Date), $cpu, [int]$mem, $ServiceName, $svc.Status)

  Start-Sleep -Seconds $IntervalSec
}

Stop-Transcript | Out-Null
