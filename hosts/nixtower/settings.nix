rec {
  hostname = "nixos";
  system = "x86_64-linux";
  username = "philipp";
  mail = "philipp.hepp7@gmail.com";
  dotfiles = "/home/${username}/.config";
  kb_layout = "de";
  monitor = ["DP-1, 2560x1080@144, 0x0, 1" "HDMI-A-1, 1920x1080@60, 0x1080, 1"];
  timezone = "Europe/Berlin";
  drive = "/dev/nvme0n1";
  theme = {
    colorscheme = "rose-pine-moon";
  };
}
