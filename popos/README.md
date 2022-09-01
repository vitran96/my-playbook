# Pop_OS playbook

# Manual step

- Pop OS setting:
  - No launch dock
  - Keyboard binding??
  - change wallpaper to Gura
  - Install and openSSH server if needed (https://gist.github.com/vitran96/8b67952f05e89cc940b20d24159a9475)
  - close SSH port server after finish
- Git:
  - Install git
  - Config git with gh for authentication and ssh
- GitHub CLI:
  - Install gh
  - Setup:
```bash
# use SSH
gh auth login
gh auth setup-git
```
- vscode:
  - Install vscode (https://code.visualstudio.com/docs/setup/linux)
```bash
# setup key and repo
sudo apt-get install wget gpg

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

rm -f packages.microsoft.gpg

# install vscode
sudo apt install apt-transport-https
sudo apt update
sudo apt install code
```
  - Sync with GitHub
- Intellij:
  - Install Intellij?
- 1Password:
  - Install 1Password (https://support.1password.com/install-linux/#debian-or-ubuntu):
```bash
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list

sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/

curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol

sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22

curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

sudo apt update
sudo apt install 1password
```
  - Set up hotkey:
    - Win + \ -> gui
    - Win + Shift + \ -> lock
    - Win + ] -> quick access
    - Win + Ctrl + \ -> auto fill?
  - Auto start?
- Firefox:
  - Install Firefox
  - Sync Firefox
  - Add search engine:
    - yt -> youtube
    - gh -> github
    - gg -> google
    - wiki -> wiki
  - Log in:
    - github
    - google
    - leetcode
- Timeshift:
  - Install Timeshift:
  - Config
- Gnome Tweak:
  - Install gnome-tweak
  - Install Firefox with tweak extension -> Can we skip this?
  - Install extensions:
    - Color picker: https://extensions.gnome.org/extension/3396/color-picker/
    - Extension list: https://extensions.gnome.org/extension/3088/extension-list/
    - GS Connect: https://extensions.gnome.org/extension/1319/gsconnect/
    - Lock keys: https://extensions.gnome.org/extension/36/lock-keys/
    - Clipboard indicator: https://extensions.gnome.org/extension/779/clipboard-indicator/
    - Bluetooth quick connect: https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/
    - Sound output, input device chooser: https://extensions.gnome.org/extension/906/sound-output-device-chooser/
- Fonts: https://github.com/ryanoasis/nerd-fonts
  - Install JetbrainsMono Nerd Font
- Easy Effect:
  - Auto start
  - Set profile to Auto Balance (from online)
- Doom-emacs:
  - Install Emacs
  - Install Doom-emacs
  - Migrate config
  - auto start
- Neo-vim:
  - Install neo-vim
  - Install plugin
  - Migrate config
- Aseprite:
  - Build from source??
  - Clean up
- qutebrowser:
  - Install qutebrowser
  - Migrate config
- alacritty:
  - Install alacritty
  - Migrate config
- zsh:
  - example: https://gitlab.com/dtos/etc/dtos-zsh/-/blob/main/etc/dtos/.zshrc
  - oh my zsh?
  - powerlevel10k?
- Cloud storate:
  - Main GG Drive?
  - Main Onedrive?
  - Work Onedrive?
- Flameshot
- Other package:
  - nvm
  - snapd (snap)
  - build-essential
  - pcmanfm?
  - pfetch / neofetch?
  - gradle?
  - maven?
  - kdenlive
  - obs
  - steam
  - nix package manager?
  - aptitude?
  - nala?
  - exa?
  - blender?
  - Some kind of screenshot application!!
  - ansible
  - vagrant
  - virtual box
  - libvrt + virtual manager + qemu
  - podman
  - distrobox?
  - godot
  - zip?
  - diffmerge tool?
  - discord
  - wine? bottle?
  - warp?
  - Logitech Flow?
  - octave? (config https://gist.github.com/vitran96/debe1deeaf2601b0d48fad689f01a3ff)
  - speedtest-cli?
  - lutris?
  - postman?
