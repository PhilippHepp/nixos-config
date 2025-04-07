rec {
    hostname = "nixos";
    system = "x86_64-linux";
    username = "philipp";
    mail = "philipp.hepp7@gmail.com";
    dotfiles = "/home/${username}/.config";
    kb_layout = "de";
    monitor = [ "HDMI-A-1, 2560x1080@144, 0x-1080, 1" "DVI-D-1, 1920x1080@60, 0x0, 1" ]; 
    timezone = "Europe/Berlin";
    drive = "/dev/nvme0n1";
}
