# Windows playbook

## Installation

### Ansible Control node 🕹

1. [Install Ansible >=2.10](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

   1. Upgrade Pip: `pip3 install --upgrade pip`
   2. Install Ansible: `pip3 install ansible`

2. Clone or download this repository to your local drive.
3. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible collections.
4. Add the IP address and credentials of your Windows machine into the [inventory](./default.inventory.ini) file
5. Run command below inside this directory.

```sh
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i inventory.ini main.yml
```

### Running a specific set of tagged tasks

```sh
ansible-playbook -i inventory.ini main.yml --tags "choco,wsl"
```

## Others

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/vitran96/my-playbook/master/helper/setup.ps1"
$file = "$env:temp\setup.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -Verbose
```

## Manual setup

- Set up to do:
  - 1Password
  - FireFox sync
  - FireFox login to Google
  - IntelliJ sync??
  - setup github authentication

# Note

- Cannot use choco module to install postgres, may be WinRM connection will work

```sh
cinst -y postgresql13 --params /Password:admin
```

## TODO

- Create setup alacritty task
  - alacritty config is at: %APPDATA%\alacritty\alacritty.yml
- Create powershell task:
  - change oh-my-posh task to powershell task
  - Install PS module:
    - Window Update: `Install-Module PSWindowsUpdate`
    - PSReadLine: `Install-Module PSReadLine -Force -Scope CurrentUser`
- How to install Office 365 from cmd?
- `winget` must be install from MSStore: AppInstaller. Is it possible to udpate App Installer with Ansible???
- Uninstall these apps:
  - Disn0ey+
  - Adobe Express
  - Prime Video
  - Tiktok
  - Instagram
  - Paint?
  - ClipChamp
  - OneNote
  - Microsoft.Microsoft3DViewer
  - Microsoft.MicrosoftOfficeHub
  - Microsoft.MicrosoftSolitaireCollection
  - Microsoft.MixedReality.Portal
  - Microsoft.MSPaint
  - Microsoft.Office.OneNote
  - Microsoft.OneConnect
  - Microsoft.Print3D
  - Microsoft.SkypeApp
  - Microsoft.Wallet
  - Microsoft.Xbox
  - Microsoft.XboxApp
- cannot install postgres with param
- can i set these setting from command line or ansible? :
  - set Dark mode
  - turn on storage sense. set up storage sense:
    - run every week
    - bin: 30 days
    - download: 60 days
    - on drive sync: 60 days
  - turn on share clipboard
  - turn on clipboard history
  - set default browser to FireFox
  - set dim screen time and lock time for on battery and plugged
  - turn off microphone if exist
  - turn on developer mode
  - turn off xbox gamebar XBox button (maybe also the hoykey)
  - turn on receive update on MS products
  - turn on notify restart required on Win Update complete
  - turn on save Restartable app and turn them back on on sign in (is this bad??)
  - pin to start:
    - virtual box
    - docker
    - vscode
    - intellij
    - visual studio
    - visual studio installer
    - messenger
    - telegram
    - zalo
    - spotify
    - skype (optional)
    - discord
    - terminal
    - alacritty (optional)
    - aseprite
  - unpin:
    - calendar
    - notepad
    - store
  - set windows defender:
    - not notify recent activity
    - turn on reputation-based protection
  - set windows terminal as default console
  - Text service and Input language: remove switch input and swit layout hotkey
  - modify explorer context menu:
    - alacritty:
      - fix error "%V" -> "%V in Computer\HKEY_CLASSES_ROOT\Directory\Background\shell\Open Alacritty here\command
      - add context menu for drive: Computer\HKEY_CLASSES_ROOT\Drive\shell\Open Alacritty Here\command
      - add context menu for directory: Computer\HKEY_CLASSES_ROOT\Directory\shell\Alacritty\command
    - sharex: remove context menu in Computer\HKEY_CLASSES_ROOT\Directory\shell\ShareX
    - vlc: remove context menu in:
      - Computer\HKEY_CLASSES_ROOT\Directory\shell\PlayInVlc??
      - Computer\HKEY_CLASSES_ROOT\Directory\shell\AddToPlaylistVLC

## Author

This project was inspired by [Alexander Nabokikh](https://www.linkedin.com/in/nabokih/)
