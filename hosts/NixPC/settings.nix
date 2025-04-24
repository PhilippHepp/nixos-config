rec {
  # System Identification
  hostname = "nixpc"; # Host-specific
  system = "x86_64-linux"; # Usually fixed per host
  timezone = "Europe/Berlin"; # Host-specific location

  # User Configuration
  username = "eugen";
  mail = "eugen.hepp@gmx.de";
  shell = "zsh"; # Or use string "zsh" and look up pkgs.${shell} in user.nix
  dotfiles = "/home/${username}/.config"; # Derived

  userSshKeys = [
    # "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH..." # Add actual keys
  ];
  locales = {
    main = "de_DE.UTF-8";
    extra = "de_DE.UTF-8";
  };
  # Hardware & Installation
  mydrive = "/dev/sda"; # Primary disk for installation
  swapSize = "16G"; # Match RAM
  kb_layout = "de";
  monitor = [
    # Hyprland monitor config
    "HDMI-A-1, 2560x1080@60, 0x0, 1"
  ];

  # Nvidia Specifics
  nvidiaPackage = "latest";
  # Theming & Appearance
  theme = {
    cursor = "BreezeX-RosePine-Linux";
    colorscheme = "vesper"; # For Stylix base16Scheme
    font = "IosevkaTermSlab";
    wallpaper = "Eldritch-Island-Vista.webp";
  };
  # Application Settings
  shellLogo = "yellow-sign.txt";
  shellPrompt = ""; # Command for Zsh prompt
  sensitivity = 0;
}
