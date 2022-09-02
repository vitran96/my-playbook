# Pop_OS playbook

# Notes

1. Why I cannot update firmware??

# Manual step

- Pop OS setting:
  - migrate config?
    - pop-shell ($HOME/.config/pop-shell/config.json)
    - pop-system-updater ($HOME/.config/pop-system-updater/config.ron)
  - No launch dock
  - Keyboard binding??
  - change wallpaper to Gura
  - Install and openSSH server if needed (https://gist.github.com/vitran96/8b67952f05e89cc940b20d24159a9475)
  - close SSH port server after finish
  - Ignore floating:
    - Settings
    - PopOS Store
  - Settings:
    - Privacy:
      - File history: 30 days
      - Auto empty trash
      - Auto empty temporary
    - Sharing:
      - Change PC name
    - Sound:
      - over-amplification
    - Power:
      - Black screen: 10'
      - Auto suspend:
        - Battery: 20'
        - Plugged: 2hrs
      - Power button: suspend
      - Show battery %
    - Mouse & touchpad:
      - Mouse speed ~75%
      - No mouse acceleration
      - Touchpad Natural scroll
    - Keyboard
      - Add Vietnamese-Telex
    - Accessibility
      - Sound Keys
      - Locate Pointer
    - Date & Time
      - Format 24-hour
- Ibus-Unikey:
  - Install ibus-unikey:
  ```bash
  sudo apt install ibus-unikey
  ibus restart

  # if ibus daemon not running
  ibus-daemon &
  ```
  - Turn off spell check
- Fonts: https://github.com/ryanoasis/nerd-fonts
  - Install JetbrainsMono Nerd Font:
  ```bash
  cd $HOME/Downloads

  curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
  | grep "JetBrainsMono.zip" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget -qi -

  unzip "JetBrainsMono.zip" "*.ttf" "*.otf" -d $HOME/.local/share/fonts

  fc-cache $HOME/.local/share/fonts
  ```
- Git:
  - Install git
  - Config git with gh for authentication and ssh
- GitHub CLI:
  - Install gh
  - migrate config? (can be found in $HOME/.config/gh/config.yml)
  - Setup:
  ```bash
  # use SSH
  gh auth login
  gh auth setup-git
  ```
- zsh:
  - example config: https://gitlab.com/dtos/etc/dtos-zsh/-/blob/main/etc/dtos/.zshrc
  - install zsh:
  ```bash
  sudo apt install zsh
  ```
  - install oh my zsh:
  ```bash
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  ```
  - install powerlevel10k
  ```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ```
  - migrate my configuration
  ```bash
  ln -s $HOME/.dotfiles/linux/.zshrc $HOME/.zshrc
  ln -s $HOME/.dotfiles/linux/.p10k.zsh $HOME/.p10k.zsh

  ```
- bashrc
  - migrate configuration
  ```bash
  ln - s $HOME/.dotfiles/linux/.bashrc $HOME/.bashrc
  ```
- alacritty:
  - Install alacritty
  ```bash
  sudo apt install alacritty
  ```
  - Migrate config
  ```bash
  ln -s $HOME/.dotfiles/alacritty $HOME/.config/alacritty
  ```
  - set as default terminal
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
  - Set up hotkey (exist inside $HOME/.config/1Password/settings/settings.json):
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
    - google (main account)
    - leetcode
    - microsoft (main account)
    - stackoverflow
    - messenger
    - grammaryly
    - honey
    - notion
- Intellij:
  - Install Intellij?
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
  - gimp?
  - inkscape?
  - krita?
  - obs
  - steam
  - nix package manager?
  - aptitude?
  - nala?
  - deb-get?
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
