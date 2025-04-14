rec {
  # System Identification
  hostname = "nixtower"; # Host-specific
  system = "x86_64-linux"; # Usually fixed per host
  timezone = "Europe/Berlin"; # Host-specific location

  # User Configuration
  username = "philipp";
  mail = "philipp.hepp7@gmail.com";
  shell = "zsh"; # Or use string "zsh" and look up pkgs.${shell} in user.nix
  dotfiles = "/home/${username}/.config"; # Derived

  userSshKeys = [
    # "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH..." # Add actual keys
  ];
  locales = {
    main = "en_US.UTF-8";
    extra = "de_DE.UTF-8";
  };
  # Hardware & Installation
  mydrive = "/dev/nvme0n1"; # Primary disk for installation
  swapSize = "16G"; # Match RAM
  kb_layout = "de";
  monitor = [
    # Hyprland monitor config
    "DP-1, 2560x1080@144, 0x0, 1"
    "HDMI-A-1, 1920x1080@60, 320x1080, 1"
  ];

  # Nvidia Specifics
  nvidiaPackage = "latest";
  # Theming & Appearance
  theme = {
    cursor = "BreezeX-RosePine-Linux";
    colorscheme = "vesper"; # For Stylix base16Scheme
    font = "IosevkaTermSlab";
  };
  wallpaperPath = "/home/${username}/Pictures/Wallpapers/current.png";

  # Application Settings
  shellPrompt = "fastfetch"; # Command for Zsh prompt
  sensitivity = -0.6;
}
