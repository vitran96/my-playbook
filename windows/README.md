# Windows playbook

## Installation

### Ansible Control node 🕹

1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

   1. Upgrade Pip: `pip3 install --upgrade pip`
   2. Install Ansible: `pip3 install ansible`

2. Clone or download this repository to your local drive.
3. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible collections.
4. Add the IP address and credentials of your Windows machine into the `inventory.ini` file
5. Run `ansible-playbook -i inventory.ini main.yml` inside this directory.

### Running a specific set of tagged tasks

You can filter which part of the provisioning process to run by specifying a set of tags using `ansible-playbook` `--tags` flag. The tags available are `choco` , `debloat` , `desktop` , `explorer` , `fonts` , `hostname` , `mouse` , `power` , `sounds` , `start_menu` , `taskbar` , `updates` , `windows_features` , `wsl` .

```sh
ansible-playbook main.yml --tags "choco,wsl"
```

## Overriding Defaults

**NOTE:** You can override any of the defaults configured in `default.config.yml` by creating a `config.yml` file and setting the overrides in that file. For example, you can customize the installed packages and enable/disable specific tasks with something like:

```yaml
configure_hostname: true
custom_hostname: myhostname

install_windows_updates: true
update_categories:
  - Critical Updates
  - Security Updates
  - * # Installs all updates

choco_installed_packages:
  # installs latest version of the Google Chrome while ignoring the package checksum
  - name: googlechrome
    state: latest
    choco_args: --ignorechecksum
  # installs 2.37.1 version of the git
  - name: git
    version: "2.37.1"
  # installs GO, but won't update it
  - golang

install_fonts: true
installed_nerdfonts:
  - Meslo

install_ohmyposh: true
ohmyposh_theme: agnoster

install_windows_features: true
windows_features:
  Microsoft-Hyper-V: true

install_wsl2: true
wsl2_distribution: wsl-archlinux

remove_bloatware: true
bloatware:
  - Microsoft.Messaging
```

## Included Applications / Configuration (Default)

Packages (installed with Chocolatey):

- adobereader
- auto-dark-mode
- awscli
- capture2text
- Firefox
- git
- golang
- jre8
- kubernetes-cli
- microsoft-windows-terminal
- peazip
- powertoys
- python3
- telegram
- terraform
- vlc
- vscode
- zoom

## Author

This project was created by [Alexander Nabokikh](https://www.linkedin.com/in/nabokih/) (initially inspired by [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)).

## License

This software is available under the following licenses:

- **[MIT](https://github.com/AlexNabokikh/windows-playbook/blob/master/LICENSE)**

[badge-gh-actions]: https://github.com/AlexNabokikh/windows-playbook/actions/workflows/release.yaml/badge.svg
[badge-windows-11]: https://img.shields.io/badge/OS-Windows%2011%2021H2-blue
[badge-windows-10]: https://img.shields.io/badge/OS-Windows%2010%2020H2-blue
[badge-license]: https://img.shields.io/badge/License-MIT-informational
