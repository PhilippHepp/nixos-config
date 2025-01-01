{
    # This is where you define all options for the base system
    # if you want to change any of the configs you'll have to look into 
    # ./home-manager and ./nixos

    don = rec {
        hostname = "galaxia";
        system = "x86_64-linux";
        username = "donielmaker";
        mail = "daniel.schmidt0204@gmail.com";
        dotfiles = "/home/${username}/.config";
        kb_layout = "de";
        monitor = ", 1920x1080@60hz, auto, 1";
        timezone = "Europe/Berlin";
    };
}
