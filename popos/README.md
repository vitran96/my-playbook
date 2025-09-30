# Pop_OS playbook

# Tool note

- Use `xprop` to get running application class and title

# Manual step

## Pop OS setting:
- Copy monitor layout to gdm
```shell
sudo cp ~/.config/monitors.xml ~gdm/.config/
```
- Performance setting:
  - Plugged: High Performance
  - Battery: Balance
- migrate config?
  - pop-system-updater ($HOME/.config/pop-system-updater/config.ron)
- No launch dock
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

```shell
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
<!-- TODO: find a better way to configure key map / key bind -->
- Swap caps and escape
```shell
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape_shifted_capslock']"
```

## PopOS Launcher:
- Shortcut:
  - Ctrl + J/K -> scroll
  - t: -> execute command in terminal
  - : -> execute command in shell
  - = -> calculate an equation

## **Fix Suspend**

It seems that kernel 5.8+ does not work well with PopOS

```shell
sudo kernelstub -a "mem_sleep_default=deepi"
```

## Nala:
- Install nala
```shell
sudo apt install nala

# update source list
sudo nala fetch
```

## Ibus-Unikey:

- Install ibus-unikey:
```shell
sudo apt install ibus-unikey
ibus restart

# if ibus daemon not running
ibus-daemon &
```
- Turn off spell check
- Remove Emoji shortcut in `ibus-setup` > Advance
- Fonts: https://github.com/ryanoasis/nerd-fonts
- Install JetbrainsMono Nerd Font:
```shell
cd $HOME/Downloads

curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
| grep "JetBrainsMono.zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

unzip "JetBrainsMono.zip" "*.ttf" "*.otf" -d $HOME/.local/share/fonts

fc-cache $HOME/.local/share/fonts
```

## PopOS Shell:

- Remove Window title bar
- Show hint

## Git + GitHub CLI:
- migrate config
```shell
mkdir -p $HOME/.config/gh/
ln -s $HOME/.dotfiles/gh/config.yml $HOME/.config/gh/config.yml
```
- Install git + gh
```shell
sudo nala install git gh
```
- Setup:
```shell
# Config git with gh for authentication and ssh
gh auth login

gh auth setup-git
```

# Git LFS

```shell
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
```

## zsh
- install zsh:
```shell
sudo nala install -y zsh
```

## vscode:
- Install vscode (https://code.visualstudio.com/docs/setup/linux)
```shell
# setup key and repo
sudo nala install wget gpg

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

rm -f packages.microsoft.gpg

# install vscode
sudo nala install apt-transport-https
sudo nala update
sudo nala install code
```
- Sync with GitHub

## 1Password:
- Install 1Password (https://support.1password.com/install-linux/#debian-or-ubuntu):
```shell
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
[x] Install Firefox
[x] Sync Firefox
[x] Set never show: "set this as default browser"
[x] Add search engine:
  [x] yt -> youtube
  [x] gh -> github
  [x] gg -> google
  [x] wiki -> wiki
[x] Log in:
  [x] github
  [x] google (main account)
  [x] leetcode
  [x] microsoft (main account)
  [x] stackoverflow
  [x] messenger
  [x] grammaryly
  [x] honey
  [x] notion
  [x] twitter
  [x] zalo
  [x] figma

## Timeshift:
- Install Timeshift
```shell
sudo nala install -y timeshift
```
- Config:
  - Type: rsync (ext4)
  - Backup:
    - Weekly - 3 backup
  - Exclude?
  - Include?

## Neo-vim:
- Install neo-vim
```shell
sudo nala install -y neovim
```
- Install plugin manager
```shell
# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

- Execute VIM command in VIM:
```
:PlugInstall
```

## Nautilus:
- Show hidden file

## Aseprite:
- Build from source
```shell
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
```shell
ln -s $HOME/.dotfiles/linux/desktop/Aseprite.desktop $HOME/.local/share/applications/Aseprite.desktop
```

## Flameshot
- Install:
```shell
sudo nala install -y flameshot
```
- Config
```shell
ln -s $HOME/.dotfiles/flameshot $HOME/.config/flameshot
```

## Gnome Tweak:
- Install
```shell
sudo nala install -y gnome-tweaks
```
- Install Firefox with tweak extension (if not done)
- Install extensions:
  - Color picker: https://extensions.gnome.org/extension/3396/color-picker/
    - Keybind: Win + Shift + C
    - Notification type: OSD
  - Lock keys: https://extensions.gnome.org/extension/36/lock-keys/
  - Bluetooth quick connect: https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/
  - Sound output, input device chooser: https://extensions.gnome.org/extension/906/sound-output-device-chooser/
    - Hide if only 1
    - Do not extend Menu to fit name

## steam
- Install steam
```shell
sudo nala install -y steam
```
- Login

## obs
- Install
```shell
sudo nala install -y obs-studio
```

## Discord

- Install
```shell
flatpak flathub install com.discordapp.Discord
```
- Login

## Compression tool
<!-- zip, unzip is installed by default -->
```shell
sudo nala install zip unzip
```

## Easy Effect:
- Install
```shell
flatpak flathub install com.github.wwmm.easyeffects
```
- Config
  - Autostart
  - Do not shutdown on closing
- Set profile to Auto Balance:
  - Set up LoudnessEqualizer
  ```shell
  cp $HOME/.dotfiles/easyeffect/LoudnessEqualizer.json $HOME/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/
  ```
  - Open EasyEffect
  - Output > Preset > Load LoudnessEqualizer.json
  - Pipewire > Preset Autoloading > Set audio output for preset

## Podman

```shell
# Podman
sudo nala install -y podman podman-docker

sudo nala install -y pipx

pipx install podman-compose
```

Default podman run in rootless might not be able to create any custom network: https://github.com/containers/podman/discussions/23776

## Fingerprint scan [TODO]
<!-- I cannot find a way to do this. Fail to setup for DELL Inspiron 5000 -->


## Nix Single-user mode
https://nixos.org/download/
```shell
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
```

## Jetbrain's Toolbox

1. Download from Jetbrain site
2. Untar
3. Start the App
4. Create folder at `$HOME/.local/share/JetBrains/Toolbox/scripts`

## 1password cli

```shell
sudo nala install -y 1password-cli

op --help
```

## Deb-get
https://github.com/wimpysworld/deb-get

```shell
sudo apt install curl lsb-release wget
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
```

## MISE en place

```shell
curl https://mise.run | sh
```

## Love2D

https://love2d.org/wiki/Getting_Started

```shell
sudo add-apt-repository ppa:bartbes/love-stable
sudo nala update
sudo nala install -y love
```

## Chrome
```shell
flatpak install flathub com.google.Chrome
```

## Obsidian
```shell
snap install obsidian --classic
```

## Wez-term
New default terminal
https://wezterm.org/install/linux.html#__tabbed_1_3

```shell
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg

sudo apt update
sudo apt install wezterm
```

## DBeaver
```shell
snap install dbeaver-ce
```

## Gearlevel
```shell
flatpak install flathub it.mijorus.gearlever
```

## Cursor
1. Download app-image https://cursor.com/downloads
2. Setup with gearlevel

## Balena Etcher
Download app-image
https://etcher.balena.io/#download-etcher

## Chezmoi
https://www.chezmoi.io/install/#__tabbed_5_5

```shell
snap install chezmoi --classic

git remote add origin git@github.com:vitran96/dotfiles.git
git fetch origin
git switch main
```

## Tiled
```shell
sudo nala install -y tiled
```

## Zimfw
Auto download by my zshrc

## Direnv
```shell
sudo nala install -y direnv
```

## bat
```shell
sudo nala install -y bat
```

## zoxide
https://github.com/ajeetdsouza/zoxide
```shell
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

## Safe rm
```shell
sudo nala install -y safe-rm
```

## lsd
```shell
deb-get install lsd
```

## ripgrep
```shell
deb-get install ripgrep
```

## ack
```shell
sudo nala install -y ack
```

## btop
```shell
sudo nala install -y btop
```

## htop
```shell
sudo nala install -y htop
```

## fzf Fuzzy Finder
```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## ranger
```shell
sudo nala install -y ranger
```

## fd
`find` alternative
```shell
sudo nala install -y fd-find
fdfind --help
```

## tree
```shell
sudo nala install -y tree
```

## du-dust
`du` alternative
https://github.com/bootandy/dust
```shell
deb-get install du-dust
```

## dua-cli
```shell
curl -LSfs https://raw.githubusercontent.com/Byron/dua-cli/master/ci/install.sh | \
    sh -s -- --git Byron/dua-cli --target x86_64-unknown-linux-musl --crate dua --tag v2.29.0
```

## Deja Du

```shell
sudo nala install -y deja-dup
```

## Notion (unoffical)
```shell
flatpak install flathub io.github.brunofin.Cohesion
```

## Bruno REST client
```shell
sudo nala install -y bruno
```

## Jujutsu
```shell
mise use jujutsu@0.33.0
```