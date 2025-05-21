# NixOS setup

## Steps

### Init
- [x] Enble nix-flake
- [x] Enable nix home-manager: https://nix-community.github.io/home-manager/#sec-install-nixos-module
- [x] Setup GPG for signing commit with `gpg --full-generate-key` or `gpg --default-new-key-algo rsa4096 --gen-key`. Then `gpg --list-secret-keys --keyid-format=long` and use `**/<key id>` key id to generate ? with `gpg --armor --export <key id> > ~/.gnupg/<key id>.asc` and import with `gh gpg add -t <title> ~/.gnupg/<key id>.asc`.

### System packages
- [x] zsh
- [x] neovim
- [x] git
- [x] wget
- [x] podman & podman docker alias
- [x] Vietnamese keyboard (telex): use fcitx5 with fcitx5-unikey
- [x] Steam
- [x] Logitech device manager: https://github.com/pwr-Solaar/Solaar

### User packages
- [x] VS Code
- [x] Love2D
- [x] emacs 
- [ ] spacemacs: https://ironshark.org/posts/2024-06-rethinkrefactorrebuild-3/
- [x] vim-plug
- [x] github cli
- [x] dbeaver
- [x] 1password
- [x] 1password-cli (op)
- [x] cloudflare-warp
- [x] wez-term
- [x] zim
- [x] direnv
- [x] flameshot

## Setup
- [x] 1password login
- [x] Firefox login
- [x] Google login
- [x] github login
- [x] github-cli login
- [x] git verified commit
- [x] vscode login
- [x] Set default EDITOR
- [x] Jetbrains Monospace Nerd font
- [x] dotfile setup with nix
- [ ] Set keybind: https://discourse.nixos.org/t/nixos-options-to-configure-gnome-keyboard-shortcuts/7275/15
  - [x] terminal (MANUAL)
  - [x] explorer (MANUAL)
  - [ ] browser
  - [ ] change workspace
  - [ ] move app to a workspace
- [x] Backup Nix config

## Optional install

- [ ] qemu
- [ ] kvm
- [ ] vagrant
- [ ] virtualbox
- [ ] gnome config
- [ ] obs-studio
  
## Commands

### System-wide installation

```shell
# whenever make change to /etc/nixos/configuration.nx
# --use-remote-sudo for switch stage

# run below
nixos-rebuild switch --use-remote-sudo

# or run this to avoid bad config
nixos-rebuild test --use-remote-sudo

# or run below to switch on reboot
nixos-rebuild boot --use-remote-sudo

# or set a a different profile name on boot
nixos-rebuild switch -p <profile name> --use-remote-sudo

# or interact with the config
nixos-rebuild repl

# or just build
nixos-rebuild build
```

### User-only installation

```shell
# whenever make change to ~/.config/nixpkgs/home.nix

home-manager switch
```

### System config with flake

```shell
nixos-rebuild switch --flake /path/to/config#<hostname> --use-remote-sudo
```

### Update flake input

```shell
# update flake
nix flake update

# update flake lock
nix flake lock --update-input <input name>

# home-manager
nix flake lock --update-input home-manager

# dotfiles
nix flake lock --update-input dotfiles
```

### Search packages

```shell
# Use flake search to find packages
# nix eval /path/to/flake/folder#nixosConfigurations.<hostname>.packages
nix eval /nixos-config#nixosConfigurations.myhost.pkgs.gh

# use nix search
nix search nixpkgs <package name>
```