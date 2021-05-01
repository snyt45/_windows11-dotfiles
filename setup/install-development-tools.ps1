###########################
# Install Development Tools
###########################

Write-Host "Install Development Tools"
Write-Host "=============================="

try {
  # Scoopのインストール確認
  get-command scoop -ErrorAction Stop
} 
catch [Exception] {
  # Scoopのインストール
  Write-Host "Install Scoop"
  Set-ExecutionPolicy RemoteSigned -scope CurrentUser
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

# Git
Write-Host "Install Git"
scoop install git

# Add bucket
scoop bucket add extras
scoop bucket add nonportable
scoop bucket add nerd-fonts

# Google Chrome
Write-Host "Install Google Chrome"
scoop install googlechrome

# Firefox
Write-Host "Install Firefox"
scoop install firefox

# Slack
Write-Host "Install Slack"
scoop install slack

# Discord
Write-Host "Install Discord"
scoop install discord

# ZOOM
Write-Host "Install ZOOM"
scoop install zoom

# Dropbox
Write-Host "Install Dropbox"
scoop install dropbox-np

# Obsidian
Write-Host "Install Obsidian"
scoop install obsidian

# PowerToys
Write-Host "Install PowerToys"
scoop install powertoys-np

# FiraCode(フォント)
Write-Host "Install FiraCode"
scoop install FiraCode

# Windows Terminal
Write-Host "Install Windows Terminal"
scoop install windows-terminal 

# PowerShell Core
Write-Host "Install PowerShell Core"
scoop install pwsh

# Visual Studio Code
Write-Host "Install Visual Studio Code"
scoop install vscode

# PuTTY
Write-Host "Install PuTTY"
scoop install PuTTY

# Tera Term
Write-Host "Install Tera Term"
scoop install teraterm 

Write-Host ""
Write-Host "... Install is complete"
Write-Host ""

sleep 30
