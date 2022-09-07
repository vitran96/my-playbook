# Pop_OS playbook

# Notes

1. Why I cannot update firmware??
2. How to toggle title bar with cmd??
3. What is OSD notification?

# Tool note

- Use `xprop` to get running application class and title

# Manual step

## Pop OS setting:
- Copy monitor layout to gdm
```bash
sudo cp ~/.config/monitors.xml ~gdm/.config/
```
- Performance setting:
  - Plugged: High Performance
  - Battery: Balance
- migrate config?
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
  - Date & Time
    - Format 24-hour

## update

```bash
sudo nala update
sudo nala upgrade

sudo nala install build-essential
```

## PopOS - Keyboard binding

<!-- TODO: can I somehow back this up or change from command line? -->

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
  - Win + N -> show notification
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
- Other:
  - 1Password:
      - Win + \ -> 1password --show
      - Win + Shift + \ -> 1password --lock
      - Win + ] -> 1password --quick-access
      - Win + Ctrl + \ -> 1password --silent
  - Flameshot:
    - Prt Sc -> flameshot gui
    - Ctrl + Shift + Prt Sc -> flameshot screen -c -n 0
  - Default screenshot tool:
    - Alt + Prt Sc -> Record interactively
  - Clipboard indicator (look below)

# My Key Mapping
- Swap caps and escape
```bash
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
```

## PopOS Launcher:
- Shortcut:
  - Ctrl + J/K -> scroll
  - t: -> execute command in terminal
  - : -> execute command in shell
  - = -> calculate an equation

## **Fix Suspend**

It seems that kernel 5.8+ does not work well with PopOS

<!-- TODO: does this work?? -->
```bash
sudo kernelstub -a "mem_sleep_default=deepi"
```

## Ibus-Unikey:

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

## Pop-shell
- Migrate config
```bash
rm $HOME/.config/pop-shell/config.json
ln -s $HOME/.config/pop-shell/config.json $HOME/.dotfiles/pop-shell/config.json
```

## PopOS Shell:

- Remove Window title bar
- Show hint

## Git + GitHub CLI:
- migrate config
```bash
mkdir -p $HOME/.config/gh/
ln -s $HOME/.dotfiles/gh/config.yml $HOME/.config/gh/config.yml
```
- Install git + gh
```bash
sudo nala install git gh
```
- Setup:
```bash
# Config git with gh for authentication and ssh
gh auth login

gh auth setup-git
```

## zsh:
 <!-- example config: https://gitlab.com/dtos/etc/dtos-zsh/-/blob/main/etc/dtos/.zshrc -->
- migrate my configuration
```bash
ln -s $HOME/.dotfiles/linux/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/linux/.p10k.zsh $HOME/.p10k.zsh
```
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

## bashrc

- migrate configuration
```bash
ln - s $HOME/.dotfiles/linux/.bashrc $HOME/.bashrc
```

## alacritty:
- Install alacritty
```bash
sudo apt install alacritty
```
- Migrate config
```bash
ln -s $HOME/.dotfiles/alacritty $HOME/.config/alacritty
```
- set as default terminal

## vscode:
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

## 1Password:
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

## Firefox:
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
  - twitter
  - zalo?
  - figma

## Intellij:
- Install Intellij
```bash
sudo nala install snapd

sudo snap install intellij-idea-community --classic
update-desktop-database
```
- Manual config:
  - Download vscode dark+ theme plugin
  - Download code glance plugin
  - Download JDK
- Setup sync settings: https://github.com/vitran96/IntellijSettings.git
- Other settings:
  - Keymap: vscode copy
  - Tools > Actions on save:
    - Reformat code
    - Optimize import
    - Re-arrange code
    - Run code-clean up

## Timeshift:
<!-- TODO: update timeshift config -->
- Install Timeshift
```bash
sudo apt install timeshift
```
- Config:
  - Type: rsync (ext4)
  - Backup:
    - Weekly - 3 backup
  - Exclude?
  - Include?

## Nala:
- Install nala
```bash
sudo apt install nala

# update source list
sudo nala fetch
```
# Doom-emacs:
- Install Emacs
```bash
sudo apt install emacs
```
- Install Doom-emacs
```bash
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

# autostart
systemctl enable --user emacs
systemctl start --user emacs
```
- Migrate config
```bash
ln -s $HOME/.dotfiles/.doom.d $HOME/.doom.d
```

## Neo-vim:
- Install neo-vim
```bash
sudo apt install neovim
```
- Install plugin manager
```bash
# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
- Migrate config
```bash
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim
```
- Execute VIM command in VIM:
```
:PlugInstall
```

## Nautilus:
- Show hidden file

## nvm
- Install nvm:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

## Aseprite:
- Build from source
```bash
# Dependacies
# Replace nala with apt if don't have nala
sudo nala install -y g++ clang libc++-dev libc++abi-dev cmake ninja-build libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev

cd $HOME
mkdir apps

mkdir app-repos
cd app-repos

# Clone dependancies
# depot_tools and skia
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
git clone -b aseprite-m102 https://github.com/aseprite/skia.git

export PATH="${PWD}/depot_tools:${PATH}"

export CC=clang
export CXX=clang++

# Build skia
cd skia
SKIA_DIR=$(pwd)
SKIA_BUILD_DIR=$SKIA_DIR/build
python tools/git-sync-deps
gn gen $SKIA_BUILD_DIR --args='is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_sfntly=false skia_use_freetype=true skia_use_harfbuzz=true skia_pdf_subset_harfbuzz=true skia_use_system_freetype2=false skia_use_system_harfbuzz=false cc="clang" cxx="clang++" extra_cflags_cc=["-stdlib=libc++"] extra_ldflags=["-stdlib=libc++"]'
ninja -C $SKIA_BUILD_DIR skia modules

# Clone aseprite
git clone --recursive https://github.com/aseprite/aseprite.git
cd aseprite

# Build aseprite
mkdir build
cd build
cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
  -DCMAKE_EXE_LINKER_FLAGS="-stdlib=libc++" \
  -DLAF_BACKEND=skia \
  -DSKIA_DIR=$SKIA_DIR \
  -DSKIA_LIBRARY_DIR=$SKIA_BUILD_DIR \
  -DSKIA_LIBRARY=$SKIA_BUILD_DIR/libskia.a \
  -DCMAKE_INSTALL_PREFIX=$HOME/apps/aseprite \
  -G Ninja \
  ..
ninja aseprite
ninja install
```
- .desktop file
```bash
ln -s $HOME/.dotfiles/linux/desktop/Aseprite.desktop $HOME/.local/share/applications/Aseprite.desktop
```

## Flameshot
- Install:
```bash
sudo nala install flameshot
```
- Config
```bash
ln -s $HOME/.dotfiles/flameshot $HOME/.config/flameshot
```

## godot

Godot does not play well with PopOS-Tiling
When work with Godot:
- Turn off Tiling
- Turn on Title bar

Installation:
<!-- TODO: consider build from source (https://docs.godotengine.org/en/latest/development/compiling/compiling_for_linuxbsd.html) -->
- Install
```bash
sudo nala install godot3
```
- Migrate config
```bash
# TODO: maybe request or implement feature or make plugin to do setting sync
# let's just copy for now
rm $HOME/.config/godot/editor_settings-3.tres
cp $HOME/.dotfiles/Godot/editor_settings-3.tres $HOME/.config/godot/editor_settings-3.tres
```

## Gnome Tweak:
- Install
```bash
sudo nala install gnome-tweaks
```
- Install Firefox with tweak extension (if not done)
- Install extensions:
  - Color picker: https://extensions.gnome.org/extension/3396/color-picker/
    - Keybind: Win + Shift + C
    - Notification type: OSD
  - GS Connect: https://extensions.gnome.org/extension/1319/gsconnect/
    - Set to move to Panel
    - Install Firefox GSConnect extension
    - Install KDE Connect on Phone
    - Configure KDE Connect on Phone:
      - Give permission for plugins
  - Lock keys: https://extensions.gnome.org/extension/36/lock-keys/
  - Clipboard indicator: https://extensions.gnome.org/extension/779/clipboard-indicator/
    - Move to top after select
    - No keybind
    - No cofirmation on clear
    - Size: 5
  - Bluetooth quick connect: https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/
  - Sound output, input device chooser: https://extensions.gnome.org/extension/906/sound-output-device-chooser/
    - Hide if only 1
    - Do not extend Menu to fit name

## steam
- Install steam
```bash
sudo nala install steam
```
- Login

## obs
- Install
```bash
sudo nala install obs-studio
```

## discord

- Install
```bash
sudo nala install discord
```
- Login

## kdenlive

- Install
```bash
sudo nala install kdenlive
```

## python
<!-- python3 is installed by default -->
- Install
```bash
sudo nala install python3 python-is-python3
```

## Compression tool
<!-- zip, unzip is installed by default -->
```bash
sudo nala install zip unzip
```

## Flatpak
<!-- flatpak and flathub setup is done by default -->

## qutebrowser:
- Install qutebrowser
```bash
sudo nala install qutebrowser
```
- Migrate config
```bash
ln -s $HOME/.dotfiles/qutebrowser $HOME/.config/qutebrowser
```

## Easy Effect:
- Install
```bash
flatpak install flathub com.github.wwmm.easyeffects
```
- Config
  - Autostart
  - Do not shutdown on closing
- Set profile to Auto Balance:
  - Set up LoudnessEqualizer
  ```bash
  cp $HOME/.dotfiles/easyeffect/LoudnessEqualizer.json $HOME/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/
  ```
  - Open EasyEffect
  - Output > Preset > Load LoudnessEqualizer.json
  - Pipewire > Preset Autoloading > Set audio output for preset

<!-- TODO: check out cadence? and carla? -->

## Container tool
<!-- TODO: find away to pull docker.io/... without remembering docker.io -->
- Install
```bash
sudo nala install podman
```

## Virtualize tool:
- Install
```bash
sudo nala install cpu-checker
sudo nala install vagrant virtualbox

# qemu libvrd
sudo nala install qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients bridge-utils

# Start libvirtd service
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd

# Confirm libvirtd is run
sudo systemctl status libvirtd

# Set right
sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER
```
- Setup bridge (optinal)
```bash
# network:
#   ethernets:
#     enp0s3:
#       dhcp4: false
#       dhcp6: false
#   # add configuration for bridge interface
#   bridges:
#     br0:
#       interfaces: [enp0s3]
#       dhcp4: false
#       addresses: [192.168.1.162/24]
#       macaddress: 08:00:27:4b:1d:45
#       routes:
#         - to: default
#           via: 192.168.1.1
#           metric: 100
#       nameservers:
#         addresses: [4.2.2.2]
#       parameters:
#         stp: false
#       dhcp6: false
#   version: 2
sudo vi /etc/netplan/01-netcfg.yaml

sudo netplan apply

ip add show

```

## Fingerprint scan
<!-- TODO: -->


## Cloud storate?:
- Main GG Drive?
- Main Onedrive?
- Work Onedrive?

## Other package:

- Dev tool:
  - Python tool:
    - pip3?
  - Java tool?:
    - jdk
    - jabba (java version manager)
    - gradle
    - maven
  - postman?
  - htop? htim?
  - diffmerge tool?
  - octave? (config https://gist.github.com/vitran96/debe1deeaf2601b0d48fad689f01a3ff)
  - entr(run)?
  - bat?
- Design tool:
  - gimp?
  - inkscape?
  - krita?
  - blender?
  - lmms?
- Virtualize tool:
  - ansible?
  - wine? bottle?
- Container tool
  - podmon-toolbox?
  - docker?
  - k8s? k3s?
  - distrobox?
- Gaming:
  - steamcmd?
  - lutris?
  - moonlight?
  - parsec?
  - rainway?
- Console Emulator:
  - GBA: ?
- Filesystem:
  - pcmanfm?
  - ranger? vifm?
  - exa?
- Cloud service tool:
  - heroku-cli?
  - aws-cli-v2?
- Package manager:
  - something to handle AppImage?
  - nix package manager? devbox?
  - deb-get?
- VPN:
  - warp?
  - 1password-cli 2?
  - Logitech Flow?
- IDE / Text editor to check:
  - LunarVim?
  - Doom-nvim?
  - Spacevim?
- Others:
  - pfetch / neofetch?
  - speedtest-cli?
