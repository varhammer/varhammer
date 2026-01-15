# build-varhammer.ps1 — portable varhammer: Emacs 30.2 + 
# SBCL 2.6.0 + SLIME 2.32
# Fully offline after initial setup — works from USB flash
# drive

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

$RootDir = "varhammer"
$TmpDir = "tmp_download"

if (Test-Path $RootDir) { Remove-Item -Recurse -Force $RootDir }
if (Test-Path $TmpDir) { Remove-Item -Recurse -Force $TmpDir }

New-Item -ItemType Directory -Path $RootDir, $TmpDir | Out-Null

# [1/10] Emacs from local directory (like SBCL)
Write-Host "[1/10] Using local Emacs 30.2 directory..." -ForegroundColor Cyan
$localEmacsDir = "$PSScriptRoot\emacs-source"
if (-not (Test-Path "$localEmacsDir\bin\emacs.exe")) {
    Write-Host "❌ emacs.exe not found in: $localEmacsDir\bin\" -ForegroundColor Red
    exit 1
}
New-Item -ItemType Directory -Path "$RootDir/emacs" | Out-Null
Copy-Item -Path "$localEmacsDir\*" -Destination "$RootDir/emacs" -Recurse -Force

# [2/10] SBCL from local directory
Write-Host "[2/10] Using local SBCL 2.6.0 directory..." -ForegroundColor Cyan
$localSbclDir = "$PSScriptRoot\sbcl-source"
if (-not (Test-Path "$localSbclDir\bin\sbcl.exe")) {
    Write-Host "❌ sbcl.exe not found in: $localSbclDir\bin\" -ForegroundColor Red
    exit 1
}
New-Item -ItemType Directory -Path "$RootDir/sbcl" | Out-Null
Copy-Item -Path "$localSbclDir\*" -Destination "$RootDir/sbcl" -Recurse -Force

# [3/10] SLIME loaded from local source (fallback)
$localSlimeDir = "$PSScriptRoot\slime-source"
if (-not (Test-Path "$localSlimeDir\slime.el")) {
    Write-Host "❌ slime.el not found in: $localSlimeDir\" -ForegroundColor Red
    Write-Host "Please provide SLIME in 'slime-source/' or ensure internet access." -ForegroundColor Red
    exit 1
}
New-Item -ItemType Directory -Path "$RootDir\slime" | Out-Null
Copy-Item -Path "$localSlimeDir\*" -Destination "$RootDir\slime" -Recurse -Force
Write-Host "[3/10] SLIME 2.32 loaded from local source." -ForegroundColor Cyan

# [4/10] Create Emacs config from source file
Write-Host "[4/10] Copying Emacs config..." -ForegroundColor Cyan

$emacsD = "$RootDir/.emacs.d"
New-Item -ItemType Directory -Path $emacsD | Out-Null

$sourceInitEl = "$PSScriptRoot\emacs-config\init.el"
if (-not (Test-Path $sourceInitEl)) {
    Write-Host "❌ Source init.el not found in emacs-config/ folder." -ForegroundColor Red
    exit 1
}

Copy-Item -Path $sourceInitEl -Destination "$emacsD/init.el" -Force

# [5/10] Create run-emacs.bat
Write-Host "[5/10] Creating run-emacs.bat..." -ForegroundColor Cyan

$batContent = @"
@echo off
setlocal
set "ROOT=%~dp0"
set "ROOT=%ROOT:~0,-1%"
set "PATH=%ROOT%\sbcl\bin;%PATH%"
set "HOME=%ROOT%"
set "USER_EMACS_DIRECTORY=%ROOT%\.emacs.d"
"%ROOT%\emacs\bin\emacs.exe" -q --load "%ROOT%\.emacs.d\init.el" %*
"@

Set-Content -Path "$RootDir/run-emacs.bat" -Value $batContent -Encoding OEM

# [6/10] Copy precompiled run-emacs.exe (optional but recommended)
$launcherExe = "$PSScriptRoot\run-emacs.exe"
if (Test-Path $launcherExe) {
    Write-Host "[6/10] Copying run-emacs.exe..." -ForegroundColor Cyan
    Copy-Item -Path $launcherExe -Destination "$RootDir\run-emacs.exe" -Force
} else {
    Write-Host "[6/10] run-emacs.exe not found - skipping." -ForegroundColor Yellow
}

# [7/10] Include preinstalled Quicklisp (offline-ready)
$qlSource = "$PSScriptRoot\quicklisp-source"
if (Test-Path $qlSource) {
    Write-Host "[7/10] Copying preinstalled Quicklisp..." -ForegroundColor Cyan
    Copy-Item -Path "$qlSource" -Destination "$RootDir\quicklisp" -Recurse -Force
}

# [8/10] Copy preinstalled libraries to local-projects
$localProjectsSource = "$PSScriptRoot\local-projects-source"
if (Test-Path $localProjectsSource) {
    Write-Host "[8/10] Copying preinstalled libraries to local-projects..." -ForegroundColor Cyan
    New-Item -ItemType Directory -Path "$RootDir\quicklisp\local-projects" -Force | Out-Null
    Copy-Item -Path "$localProjectsSource\*" -Destination "$RootDir\quicklisp\local-projects\" -Recurse -Force
}

# [9/10] Copy .sbclrc for SBCL startup
$sbclrcSource = "$PSScriptRoot\sbcl-config\.sbclrc"
if (Test-Path $sbclrcSource) {
    Write-Host "[9/10] Copying .sbclrc..." -ForegroundColor Cyan
    Copy-Item -Path $sbclrcSource -Destination "$RootDir\.sbclrc" -Force
} else {
    Write-Host "[9/10] .sbclrc not found in sbcl-config/ - skipping." -ForegroundColor Yellow
}

# [10/10] Copy root metadata files (LICENSE, README, THIRD-PARTY-LICENSES)
$rootMetaDir = "$PSScriptRoot\root-metadata"
if (Test-Path $rootMetaDir) {
    Write-Host "[10/10] Copying root metadata files..." -ForegroundColor Cyan
    Copy-Item -Path "$rootMetaDir\*" -Destination "$RootDir\" -Force
} else {
    Write-Host "[10/10] root-metadata/ not found - skipping." -ForegroundColor Yellow
}

# Cleanup
Remove-Item -Recurse -Force $TmpDir

# Final ZIP
Write-Host "Creating varhammer-portable.zip..." -ForegroundColor Green
Compress-Archive -Path $RootDir -DestinationPath "varhammer-portable.zip" -Force

Write-Host "[SUCCESS] Portable environment ready with Quicklisp." -ForegroundColor Green
Write-Host "[INFO] Extract to USB and run 'run-emacs.exe'." -ForegroundColor Yellow