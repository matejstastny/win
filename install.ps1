# ============================
# Windows Bootstrap Script
# ============================

Write-Host "Starting bootstrap..." -ForegroundColor Cyan

# Ensure winget exists
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget not found. Please update Windows." -ForegroundColor Red
    exit 1
}

$packages = @(
    "Git.Git",
    "TranslucentTB.TranslucentTB"
)

foreach ($pkg in $packages) {
    Write-Host "Installing $pkg..."
    winget install --id $pkg -e --silent --accept-source-agreements --accept-package-agreements
}

# ----------------------------
# Wallpaper Section
# ----------------------------

$wallpaperUrl = "https://github.com/matejstastny/matejstastny/blob/main/assets/pfp.jpeg?raw=true"
$wallpaperPath = "$env:USERPROFILE\Pictures\pfp.jpeg"

Write-Host "Downloading profile picture..."
Invoke-WebRequest -Uri $wallpaperUrl -OutFile $wallpaperPath


$wallpaperUrl = "https://github.com/matejstastny/win/blob/main/wallpaper.png?raw=true"
$wallpaperPath = "$env:USERPROFILE\Pictures\wallpaper.png"

Write-Host "Downloading wallpaper..."
Invoke-WebRequest -Uri $wallpaperUrl -OutFile $wallpaperPath

Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

$SPI_SETDESKWALLPAPER = 20
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDCHANGE = 0x02

[Wallpaper]::SystemParametersInfo(
    $SPI_SETDESKWALLPAPER,
    0,
    $wallpaperPath,
    $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE
)

Write-Host "Bootstrap complete." -ForegroundColor Green

