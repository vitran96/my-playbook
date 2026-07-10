# Fedora

Used Fedora workstation (GNOME base)

## Installer

1. Choose drive and it auto partitioning the drive
2. Selecting the usual config like timezone, username, etc...

## Setup

```shell
# 1st time upgrade
dnf check-update
sudo dnf upgrade

# install niri
sudo dnf install niri

# copy monitor config to GDM lock screen
sudo cp $HOME/.config/monitors.xml /var/lib/gdm/.config/

# install neo vim
sudo dnf install neovim

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
sudo dnf install helix

# install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install -y code

# install zsh
sudo dnf install zsh

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
sudo dnf install wezterm

# remove default app from niri
sudo dnf remove swaylock alacritty waybar

# install mise
curl https://mise.run | sh

# install Jujutsu CLI
sudo dnf copr enable aldantanneo/jj-vcs\
sudo dnf install jj-cli

# flatpak: install gearlever Obsidian, moonlight, Cohesion (community notion client), bruno, dbeaver ce, easyeffect
flatpak install flathub it.mijorus.gearlever
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub it.mijorus.gearlever
flatpak install flathub io.github.brunofin.Cohesion
flatpak install flathub com.moonlight_stream.Moonlight
flatpak install flathub com.usebruno.Bruno
flatpak install flathub io.dbeaver.DBeaverCommunity
flatpak install flathub com.github.wwmm.easyeffects

# install cloudflare-warp
curl -fsSl https://pkg.cloudflareclient.com/cloudflare-warp-ascii.repo | sudo tee /etc/yum.repos.d/cloudflare-warp.repo
sudo dnf update
sudo dnf install cloudflare-warp

# install zerotier
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/main/doc/contact%40zerotier.com.gpg' | gpg --import && \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi

# install chromium
sudo dnf install chromium

# install deja-dup
sudo dnf install deja-dup

# install timeshift
sudo dnf install timeshift

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

# setup additional drive (assume it is LUKs encrypted so we are wiping it out 1st)
sudo wipefs -a -f /dev/{your drive}
sudo dd if=/dev/zero of=/dev/{your drive} bs=1M count=10 conv=fsync
sync


# setup NO CoW folder
```
