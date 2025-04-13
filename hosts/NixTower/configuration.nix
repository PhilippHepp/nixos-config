{
  inputs,
  pkgs,
  ...
}: {
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko

    # System
    networking
    bootloader
    disko
    user
    nvidia
    locales

    # Programs
    terminalbase
    steam
    neovim

    # Modules
    sound
    displaymanager
    windowmanager
    gc
  ];

  environment.systemPackages = with pkgs; [
    # Programs
    (blender.override {cudaSupport = true;})
    nixpkgs-fmt
    nixfmt-rfc-style
    alejandra
    xorg.xrandr
    brave
    nemo
    xfce.thunar
    kdePackages.dolphin
    hyprpicker
    vesktop
    spotify-player
    prismlauncher
    obsidian
    geeqie
    yazi
    networkmanagerapplet
    brightnessctl
    inputplumber
    haruna
    libsForQt5.qt5ct
    qt6ct
    bemenu
    toipe
    bat
    ascii-image-converter
    wordgrinder
    asciiquarium
    # steam
    steam
    lutris
    protonup-qt
    (flameshot.override {enableWlrSupport = true;})
    # Other
    home-manager
  ];

  fileSystems = {
    "/home/philipp/Arch" = {
      device = "dev/disk/by-uuid/e94e7cb8-e2db-43cc-bb8e-2b607905ab76";
      fsType = "ext4";
      options = [
        "users"
        "nofail"
        "exec"
      ];
    };
    "/home/philipp/HDD" = {
      device = "dev/disk/by-uuid/24AC6C57AC6C2610";
      fsType = "ntfs-3g";
      options = [
        "users"
        "nofail"
        "exec"
      ];
    };
  };

  boot.supportedFilesystems.ntfs = true;

  swapDevices = [
    {
      device = "/swapfile";
      size = 17 * 1024; # 16GB
    }
  ];

  system.stateVersion = "24.11"; # Just don't
}
