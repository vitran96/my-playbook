# Pop_OS playbook

# Notes

1. Why I cannot update firmware??

# Manual step

- Pop OS setting:
  - migrate config?
    - pop-shell ($HOME/.config/pop-shell/config.json)
    - pop-system-updater ($HOME/.config/pop-system-updater/config.ron)
  - No launch dock
  - change wallpaper to Gura
  - Install and openSSH server if needed (https://gist.github.com/vitran96/8b67952f05e89cc940b20d24159a9475)
  - close SSH port server after finish
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
- Keyboard binding (can I somehow back this up or change from command line?):
  - Normal mode
    - Win == Win + / -> Launcher
    - Win + E -> File Explorer
    - Win + T -> Terminal
    - Win + B -> Browser
    - Win + Esc -> lock screen
    - Win + O -> change window orientation (when tiling)
    - Win + S -> toggle Stacking Mode for window
    - Win + Shift + H/L or Left/Right -> move window between Monitor
    - Win + Shift + J/K or Down/Up -> move window between workspace
    - Win + Shift + Home/End -> move window to 1st or last workspace
    - Win + Ctrl + J/K or Down/Up -> change workspace
    - Win + Ctrl + Home/End -> change workspace to 1st or last
    - Win + Ctrl + H/L or Left/Right -> snap window to left or right or unsnap
    - Win + Q == Alt + F4 -> close window
    - Win + Y -> toggle grid or float mode
    - Win + G -> float current window
    - Win + A -> application launcher
    - Win + Arrows -> change focus window
    - Win + Space <> Win + Shift + Space -> change language
    - Win + V -> show notification
    - Win + N -> focus active notification
    - Win + M -> maximize or back to before
    - Win + Tab == Alt + Tab -> switch application
    - Alt + Esc -> switch window directly
    - Win + Esc -> switch window of an app directly
    - Win + `/= -> switch window of an app
    - Ctrl + Alt + Tab -> switch system control??
    - Ctrl + Alt + Esc -> switch system control directly??
    - Alt + F2 -> run command prompt
    - Win + D -> show workspaces
    - Alt + Space -> active window menu
    - Alt + F7 -> move window
    - Alt + F8 -> resize window
    - Win + Enter/Return -> Adjustment Mode
  - Adjustment Mode:
    - Enter/Return -> apply change
    - Esc -> cancel change
    - H/J/K/L or Left/Down/Up/Right -> move window position
    - Shift + H/J/K/L or Left/Down/Up/Right -> resize window
    - Ctrl + H/J/K/L or Left/Down/Up/Right -> swap window
  - Reserved by other application:
    - 1Password (look below)
- PopOS Launcher:
  - Shortcut:
    - Ctrl + J/K -> scroll
    - t: -> execute command in terminal
    - : -> execute command in shell
    - = -> calculate an equation
- Ibus-Unikey:
  - Install ibus-unikey:
  ```bash
  sudo apt install ibus-unikey
  ibus restart

  # if ibus daemon not running
  ibus-daemon &
  ```
  - Turn off spell check
  - Remove Emoji shortcut in `ibus-setup` > Advance
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
- PopOS Titling
  - Ignore floating:
    - Settings
    - PopOS Store
    - Timeshift
- PopOS Shell:
  - Remove Window title bar
  - Show hint
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
  - Set never show: "set this as default browser"
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
    - twitter?
    - figma
- Intellij:
  - Install Intellij
  ```bash
  sudo snap install intellij-idea-community --classic
  update-desktop-database
  ```
  - Manual config:
    - Download vscode dark+ theme plugin
    - Download code glance plugin
    - Download JDK
  - Setup sync settings: https://github.com/vitran96/IntellijSettings.git
- Timeshift:
  - Install Timeshift
  ```bash
  sudo apt install timeshift
  ```
  - Config:
    - Type: rsync (ext4)
    - Backup:
      - Weekly - 3 backup
    - Exclude?
    - Include - **Ignore this**
- Nala:
  - Install nala
  ```bash
  sudo apt install nala

  # update source list
  sudo nala fetch
  ```
- Doom-emacs:
  - Install Emacs
  ```bash
  sudo apt install emacs
  ```
  - Install Doom-emacs
  ```bash
  git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
  ~/.emacs.d/bin/doom install
  ```
  - Migrate config
  ```bash
  ln -s $HOME/.dotfiles/.doom.d $HOME/.doom.d
  ```
  - auto start server
- Neo-vim:
  - Install neo-vim
  ```bash
  sudo apt install neovim
  ```
  - Install plugin manager
  ```bash
  # Install vim-plug
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  #
  ```
  - Migrate config
  ```bash
  ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim
  ```
  - Execute VIM command in VIM:
  ```
  :PlugInstall
  ```
- Nautilus:
  - Show hidden file
- Gnome Tweak:
  - Install gnome-tweak
  - Install Firefox with tweak extension (if not done)
  - Install extensions:
    - Color picker: https://extensions.gnome.org/extension/3396/color-picker/
    - Extension list: https://extensions.gnome.org/extension/3088/extension-list/
    - GS Connect: https://extensions.gnome.org/extension/1319/gsconnect/
    - Lock keys: https://extensions.gnome.org/extension/36/lock-keys/
    - Clipboard indicator: https://extensions.gnome.org/extension/779/clipboard-indicator/
    - Bluetooth quick connect: https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/
    - Sound output, input device chooser: https://extensions.gnome.org/extension/906/sound-output-device-chooser/
- Flameshot
- Easy Effect:
  - Auto start
  - Set profile to Auto Balance (from online)
- Aseprite:
  - Build from source??
  - Clean up
- qutebrowser:
  - Install qutebrowser
  - Migrate config
- Cloud storate?:
  - Main GG Drive?
  - Main Onedrive?
  - Work Onedrive?
- Other package:
  - build-essential
  - godot
  - snapd (snap)
  - Python tool:
    - python3
    - pip3?
  - Stream tool:
    - obs
    - kdenlive
  - Design tool:
    - gimp?
    - inkscape?
    - krita?
    - blender?
  - nvm
  - Java tool?:
    - jdk
    - jabba (java version manager)
    - gradle
    - maven
  - Virtual Machine tool:
    - vagrant
    - virtual box
    - libvrt + virtual manager + qemu
  - Compression tool
    - zip
    - unzip
  - Container tool
    - podman
    - docker?
    - k8s? k3s?
  - steam
  - discord
  - heroku-cli?
  - distrobox?
  - aws-cli-v2?
  - pcmanfm?
  - pfetch / neofetch?
  - nix package manager?
  - deb-get?
  - exa?
  - ansible?
  - diffmerge tool?
  - wine? bottle?
  - warp?
  - Logitech Flow?
  - octave? (config https://gist.github.com/vitran96/debe1deeaf2601b0d48fad689f01a3ff)
  - speedtest-cli?
  - lutris?
  - postman?
