# Fedora

Fedora 44 workstation (GNOME base)

## Installer

1. Choose drive and it auto partitioning the drive
2. Selecting the usual config like timezone, username, etc...

## Setup

```shell
# 1st time upgrade
dnf check-update
sudo dnf upgrade

# install niri
sudo dnf install -y niri

# copy monitor config to GDM lock screen
sudo mkdir -p /var/lib/gdm/.config/
sudo cp $HOME/.config/monitors.xml /var/lib/gdm/.config/
sudo chown -R gdm:gdm /var/lib/gdm/.config

# install neo vim
sudo dnf install -y neovim

# validate fuzzel
fuzzel --help

# validate podman
podman --help

# validate podman compose
podman compose --hel

# install 1password
sudo dnf install https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm

# install gh
sudo dnf install -y gh
gh auth login

# validate git
git --version

# install chezmoi
sudo dnf install -y chezmoi
cd ~/.local/share
gh repo clone vitran96/dotfiles chezmoi
# ... copy chezmoi config to config folder
chezmoi apply


# install steam
sudo dnf install -y steam
mkdir -p ~/.local/share/applications
cp /usr/share/applications/steam.desktop ~/.local/share/applications/steam.desktop
sed -i 's|^Exec=/usr/bin/steam|Exec=/usr/bin/steam -system-composer|g' ~/.local/share/applications/steam.desktop

# set dark mode
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# install swayidle
sudo dnf install -y swayidle

# install helix
sudo dnf install -y helix

# install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install -y code

# install zsh
sudo dnf install -y zsh

# install zed
curl -f https://zed.dev/install.sh | sh

# install nix-shell
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --no-daemon

# change hostname
sudo hostnamectl set-hostname chris-pc-1
hostnamectl

# change shell
chsh -s $(which zsh)

# install wezterm
sudo dnf copr enable wezfurlong/wezterm-nightly
sudo dnf install -y wezterm

# remove default app from niri
sudo dnf remove swaylock alacritty waybar

# install mise
curl https://mise.run | sh

# install Jujutsu CLI
sudo dnf copr enable aldantanneo/jj-vcs\
sudo dnf install -y jj-cli

# flatpak: install gearlever Obsidian, moonlight, Cohesion (community notion client), bruno, dbeaver ce, easyeffect, discord, anki, pika backup
flatpak install -y flathub it.mijorus.gearlever
flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub it.mijorus.gearlever
flatpak install -y flathub io.github.brunofin.Cohesion
flatpak install -y flathub com.moonlight_stream.Moonlight
flatpak install -y flathub com.usebruno.Bruno
flatpak install -y flathub io.dbeaver.DBeaverCommunity
flatpak install -y flathub com.github.wwmm.easyeffects
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub net.ankiweb.Anki
flatpak install -y flathub org.gnome.World.PikaBackup

# install cloudflare-warp
curl -fsSl https://pkg.cloudflareclient.com/cloudflare-warp-ascii.repo | sudo tee /etc/yum.repos.d/cloudflare-warp.repo
sudo dnf update
sudo dnf install -y cloudflare-warp

# install zerotier
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/main/doc/contact%40zerotier.com.gpg' | gpg --import && \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi

# install chromium
sudo dnf install -y chromium

# install deja-dup
# sudo dnf install -y deja-dup

# install timeshift
#sudo dnf install -y timeshift
# install polkit agent
sudo dnf install -y mate-polkit

# install snapper & btrfs-assistant
sudo dnf install -y snapper
sudo dnf install -y btrfs-assistant

# install anydesk
sudo tee /etc/yum.repos.d/AnyDesk-RPM.repo > /dev/null << "EOF"
[anydesk]
name=AnyDesk - stable
baseurl=http://rpm.anydesk.com/$basearch/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY
EOF
sudo dnf install -y anydesk

# install podman-compose
sudo dnf install podman-compose

# install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | sudo bash
sudo cp /etc/yum.repos.d/github_git-lfs.repo ~/github_git-lfs.repo.bak
sudo sed -i '/^sslcacert=/d' /etc/yum.repos.d/github_git-lfs.repo
sudo dnf clean all
sudo dnf makecache

# install jetbrains mono nerd font
sudo dnf copr enable copr.fedorainfracloud.org/jhuang6451/nerd-fonts
sudo dnf install -y jetbrains-mono-nf

# install fzf
sudo dnf install -y fzf

# install zoxide
sudo dnf install -y zoxide

# install dust
sudo dnf install -y du-dust

# install dua
sudo dnf install -y dua-cli

# install fd find
sudo dnf install -y fd-find

# install ripgrep
sudo dnf install -y ripgrep

# install ranger
sudo dnf install -y ranger

# install flameshot
sudo dnf install -y flameshot

# install lsd
sudo dnf install -y lsd

# validate zip unzip
zip --version
unzip --version

# install balena etcher
sudo dnf install -y https://github.com/balena-io/etcher/releases/download/v2.1.6/balena-etcher-2.1.6-1.x86_64.rpm

# install safe-rm
npm i -g safe-rm

# setup NO CoW folder
mkdir -p $HOME/AppImages
sudo chattr +C $HOME/AppImages
sudo chattr +C $HOME/Downloads
mkdir -p $HOME/nocow
sudo chattr +C $HOME/nocow
mkdir -p /mnt/afb13d7e-6933-4f35-bb39-c88937368daa/nocow
sudo chattr +C /mnt/afb13d7e-6933-4f35-bb39-c88937368daa/nocow

# setup vn keyboard
sudo dnf copr enable vuongtuha/fcitx5-bamboo
sudo dnf install -y fcitx5 fcitx5-bamboo fcitx5-configtool fcitx5-gtk fcitx5-qt
```

## Setup 2nd drive

```shell
# wipe out verything and set auto decrypt and mount
sudo -E gnome-disk

# change permission
chown $USER:$USER /mnt/<disk>
```

## Manual config

1. Steam & Steam library path
2. Snapper & Btrfs-assistant config
3. Pika backup config
4. Firefox sync
5. 1password login
6. Cloudflare-warp
7. Anydesk login
8. Discord
9. Obs-studio
10. Cohesion (notion)
11. Easy Effect
12. Anki
13. Zerotier
14. Moonlight

## Config logind

```toml filename="/usr/lib/systemd/logind.conf"
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it under the
#  terms of the GNU Lesser General Public License as published by the Free
#  Software Foundation; either version 2.1 of the License, or (at your option)
#  any later version.
#
# Entries in this file show the compile time defaults. Local configuration
# should be created by either modifying this file (or a copy of it placed in
# /etc/ if the original file is shipped in /usr/), or by creating "drop-ins" in
# the /etc/systemd/logind.conf.d/ directory. The latter is generally
# recommended. Defaults can be restored by simply deleting the main
# configuration file and all drop-ins located in /etc/.
#
# Use 'systemd-analyze cat-config systemd/logind.conf' to display the full config.
#
# See logind.conf(5) for details.

[Login]
#NAutoVTs=6
#ReserveVT=6
#KillUserProcesses=no
#KillOnlyUsers=
#KillExcludeUsers=root
#InhibitDelayMaxSec=5
#UserStopDelaySec=10
#SleepOperation=suspend-then-hibernate suspend
HandlePowerKey=suspend
HandlePowerKeyLongPress=poweroff
#HandleRebootKey=reboot
#HandleRebootKeyLongPress=poweroff
#HandleSuspendKey=suspend
#HandleSuspendKeyLongPress=hibernate
#HandleHibernateKey=hibernate
#HandleHibernateKeyLongPress=ignore
HandleLidSwitch=suspend
HandleLidSwitchExternalPower=suspend
#HandleLidSwitchDocked=ignore
#HandleSecureAttentionKey=secure-attention-key
#PowerKeyIgnoreInhibited=no
#SuspendKeyIgnoreInhibited=no
#HibernateKeyIgnoreInhibited=no
#LidSwitchIgnoreInhibited=yes
#RebootKeyIgnoreInhibited=no
#HoldoffTimeoutSec=30s
IdleAction=suspend
IdleActionSec=10min
#RuntimeDirectorySize=10%
#RuntimeDirectoryInodesMax=
#RemoveIPC=yes
#InhibitorsMax=8192
#SessionsMax=8192
#StopIdleSessionSec=infinity
#DesignatedMaintenanceTime=
#WallMessages=yes
```

## Setup LUKS auto decrypt

Require TPM2
This will trust the hardware and auto decrypt the disk without manually type in passphrase

<!-- TODO: -->
