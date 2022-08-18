# Windows playbook

## Installation

### Ansible Control node 🕹

1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

   1. Upgrade Pip: `pip3 install --upgrade pip`
   2. Install Ansible: `pip3 install ansible`

2. Clone or download this repository to your local drive.
3. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible collections.
4. Add the IP address and credentials of your Windows machine into the [inventory](./default.inventory.ini) file
5. Run `ansible-playbook -i inventory.ini main.yml` inside this directory.

### Running a specific set of tagged tasks

```sh
ansible-playbook -i inventory.ini main.yml --tags "choco,wsl"
```

## Others

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/AlexNabokikh/windows-playbook/master/setup.ps1"
$file = "$env:temp\setup.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -Verbose
```

- `winget` must be install from MSStore: AppInstaller
- Office 365 can only be installed from MSStore?
- What about `wsl`?
- Uninstall these apps: Disnay+, Adobe Express, Prime Video, Tiktok, Instagram, Paint?, ClipChamp, OneNote
- nvm not on path - unknown bug
- winget execution failed - ???
- cannot install postgres with params
- missing steam, epicgame, battlenet, origin, ubisoft
- missing godot, kdenlive, gimp, inkscape, blender, obs
- missing aseprite
- missing awscli (download online and install, should done silently)
- crete dotfile repo (like win terminal setting, powershell profile, usefull app profile, powertoy profile, 1password profile, firefox profile?, edge profile?, etc) and backup. On set up new machine, use dotfile repo to setup
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
  - turn on microphone if exist
  - turn on developer mode
  - turn off xbox gamebar XBox button (maybe also windows hoykey)
  - turn on receive update on MS products
  - turn on notify restart required on Win Update complete
  - turn on save Restartable app and turn them back on on sign in (is this bad??)
  - set windows terminal as default console
- Other set up to do:
  - 1Password
  - FireFox sync
  - FireFox login to Google
  - IntelliJ sync??
## Author

This project was inspired by [Alexander Nabokikh](https://www.linkedin.com/in/nabokih/)
