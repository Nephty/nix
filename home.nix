{ config, pkgs, inputs, lib, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  home.username = "nephty";
  home.homeDirectory = "/home/nephty";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./dots/kitty.nix
    ./dots/btop.nix
    ./dots/dunst.nix
    ./dots/wofi.nix
    ./dots/waybar.nix
    ./dots/hyprland.nix
    ./dots/hyprpaper.nix
    ./dots/hyprlock.nix
    ./dots/hypridle.nix
    ./dots/git.nix
    ./dots/hyprpicker.nix
    ./dots/keybinds.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.onedark;
#  colorScheme = inputs.nix-colors.colorSchemes.da-one-ocean;

  home.sessionVariables = {
    # EDITOR = "vim";
  };

  home.file = {
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 18;
  };

  home.packages = with pkgs; [
    ### Minimal configuration for work
    apostrophe
    bat
    brave
    brightnessctl
    brillo
#    btop # managed by btop.nix
    cron
#    dunst # managed by dunst.nix
    eza
    grim
    keepassxc
    killall
    libnotify
    libreoffice
    mullvad-vpn
    mate.pluma
    neofetch
    networkmanager
    pavucontrol
    python311
    python311Packages.pip
    qdirstat
    swaylock-effects
    swaybg
    swayidle
    unzip
    vim
    wget
#    wofi # managed by wofi.nix
    zip

    ### Extras
    bsdgames
    burpsuite
    clingo
    cmake
    discord
    exiftool
    flatpak
    font-awesome
    frogmouth
    gcc
    gimp
#    git # managed by git.nix
    gradle
#    hyprpicker # managed by hyprpicker.nix
    javaPackages.openjfx17
    jdk17
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jq
    maven
    meson
    neovim
    networkmanager-sstp
    ninja
    nmap
    nodejs_18
    openssl
    prismlauncher
#    (python311.withPackages(ps: with ps; [ pyautogui ]))
#    (python311.withPackages(ps: with ps; [textual-dev]))
    scenebuilder
    signal-desktop
    sstp
    tcpdump
    teamspeak_client
    termshark
    tlp
    vscodium
    wine-wayland
    wirelesstools
    wireshark
    wfuzz
    xdotool # bash auto clicker
    xfce.thunar
    xorg.libXtst
    yarn


    ### Unused (quick activation)
#    docker
#    docker-compose
#    drawio
#    element-desktop
#    firefox
#    hashcat
#    katana
#    klavaro
#    sqlmap
#    steghide
#    tesseract
  ];
}
