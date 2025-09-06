{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 5; # Timeout for the boot menu in seconds.

  networking.hostName = "nixos"; # Define your hostname.

  # ========== NetworkManager ==========
  # Try to fix captive portal issue
  networking.useNetworkd = true;
  networking.dhcpcd.enable = false;
  networking.useDHCP = false;

  services.resolved.enable = true;
  services.resolved.dnssec = "false";

  networking.resolvconf.dnsExtensionMechanism = false;

  systemd.network.wait-online.enable = false;

  # ====================================

  time.timeZone = "Asia/Ho_Chi_Minh";
  
  i18n.supportedLocales = [
    "all"
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
    LC_ALL = "C.UTF-8";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Disable apps
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Solaar
  services.solaar = {
    enable = true; # Enable the service
    # package = pkgs.solaar; # The package to use
    window = "hide"; # Show the window on startup (show, *hide*, only [window only])
    batteryIcons = "regular"; # Which battery icons to use (*regular*, symbolic, solaar)
    extraArgs = ""; # Extra arguments to pass to solaar on startup
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable the auto cleanup of old generations
  nix.gc = { 
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    git-lfs
    zsh
    gnupg
    # ===podman packages===
    dive
    podman-tui
    podman-compose
    # ===flameshot dependencies===
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    # ====================
    # ===kvm + qemu packages===
    # =========================
    # ===vagrant packages===
    # ======================
    # ===virtualbox packages===
    # =========================
    # App image
    gearlever
    appimage-run
  ];


  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";

  environment.gnome.excludePackages = [ pkgs.gnome-tour ];

  # Firefox.
  programs.firefox.enable = true;

  # Nano
  # Since my home-manager don't have this, it seems I cannot disable it
  programs.nano.enable = false;

  # Steam
  # cannot install with home-manager
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Zsh
  # Without this, cannot change user shell to zsh
  programs.zsh.enable = true;

  # Enable Appimage
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # gpgconf --kill gpg-agent
  programs.gnupg.agent = {
    enable = true;
  };

  # NOTE: not working
  # ibus-bamboo: https://github.com/BambooEngine/ibus-bamboo
  # i18n.inputMethod = {
  #   type = "ibus";
  #   enable = true;
  #   ibus.engines = with pkgs.ibus-engines; [
  #     bamboo
  #   ];
  # };

  # Fcitx5: https://nixos.wiki/wiki/Fcitx5
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk             # alternatively, kdePackages.fcitx5-qt
        fcitx5-bamboo          # table input method support
        fcitx5-unikey          # table input method support
        fcitx5-nord            # a color theme
      ];
      waylandFrontend = true;
    };
  };

  # Below are package that should be user-only

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  users.users.vi-tran = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    # set password
    shell = pkgs.zsh;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}