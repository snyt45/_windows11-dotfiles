# windows10-dotfiles
### Setup
1. 管理者権限でPowerShellを起動し実行。
```
$ Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/snyt45/windows10-dotfiles/master/setup/init.ps1'))
```

2. manually_settings.txtを参考に手動でセットアップを進める。

3. Git bashで実行。
```
$ git clone https://github.com/snyt45/windows10-dotfiles .dotfiles
$ cd ~/.dotfiles/bin
$ sh install.sh git
```
