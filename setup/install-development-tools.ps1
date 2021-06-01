Write-Host "Install Development Tools"
Write-Host "=============================="

try {
  # Scoopのインストール確認
  get-command scoop -ErrorAction Stop
} 
catch [Exception] {
  # Scoopのインストール
  Write-Host "Install Scoop"
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

# Git
Write-Host "Install Git"
scoop install git

# Add bucket
scoop bucket add extras
scoop bucket add nonportable
scoop bucket add nerd-fonts
scoop bucket add iyokan-jp https://github.com/tetradice/scoop-iyokan-jp

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

# Dropbox
Write-Host "Install Dropbox"
scoop install dropbox-np

# Obsidian
Write-Host "Install Obsidian"
scoop install obsidian

# PowerToys
Write-Host "Install PowerToys"
scoop install powertoys-np

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

# Mery
Write-Host "Install Merry"
scoop install mery

# Tablacus Explorer
Write-Host "Install Tablacus Explorer"
scoop install tablacus-explorer

# DeepL
Write-Host "Install DeepL"
scoop install deepL

# f.lux
Write-Host "Install f.lux"
scoop install flux

# MySQL Workbench
Write-Host "Install MySQL Workbench"
scoop install mysql-workbench

Write-Host ""
Write-Host "... Install is complete"
Write-Host ""

# 処理完了後、メッセージボックスを表示
$wsobj = new-object -comobject wscript.shell
$result = $wsobj.popup("セットアップが完了しました。PCを再起動してください。")
