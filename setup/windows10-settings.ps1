##################
# Windows Settings
##################

Write-Host "Windows Settings"
Write-Host "=============================="

# Defender: Windows Filrewall: Enabled
Write-Host "Windowsファイアウォール: ON"
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Explorer: Do not display registered extensions: Disabled
Write-Host "エクスプローラー: ファイル名拡張子: 表示"
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name "HideFileExt" -Value 0

# Explorer: Show hidden files, folders, and drives: Enabled
Write-Host "エクスプローラー: 隠しファイル: 表示"
Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name "Hidden" -Value 1

# Explorer: Recycle Bin: Disabled
Write-Host "デスクトップアイコン: ゴミ箱: 非表示"
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel' -Name '{645FF040-5081-101B-9F08-00AA002F954E}' -Value 1

# These make "Quick Access" behave much closer to the old "Favorites"
# Disable Quick Access: Recent Files
# to reference: https://gist.github.com/NickCraver/7ebf9efbfd0c3eab72e9
Write-Host "クイックアクセス: 最近使用したファイル: OFF"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 0
# Disable Quick Access: Frequent Folders
Write-Host "クイックアクセス: 最近使用したフォルダ: OFF"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 0
# To Restore:
#Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 1
#Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 1

# Pin a folder to quick access
# https://cloud6.net/so/powershell/284167
# https://www.vwnet.jp/Windows/w10/2017020201/Pin2QuickAccess.htm
Write-Host "クイックアクセス: ホームディレクトリをピン留めしました"
$shell = New-Object -ComObject "Shell.Application"
$folder = $shell.Namespace("C:\Users\snyt45")
$verb = $folder.self.Verbs() | ? {$_.Name -match "^クイック アクセスに.+ピン留め"}
if ($verb) {$verb.DoIt()}

# MicrosoftIME: Use previous version: Enabled
# Write-Host "MicrosoftIME: 以前のバージョン: 有効"
# 一度手動で設定を行わないとレジストリに追加されないため初回はエラーが出るためコメントアウト
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Input\TSF\Tsf3Override\'{03b5835f-f03c-411b-9ce2-aa23e1171e36}' -Name NoTsf3Override2 -Value 1

# Restart Explorer (to reflect the settings)
Write-Host "エクスプローラーを再起動します"
Stop-Process -Name Explorer -Force

Write-Host ""
Write-Host "... Setting is complete"
Write-Host ""
