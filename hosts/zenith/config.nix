{config, ...}:

{
    # This is where you define all options for the base system
    # if you want to change any of the configs you'll have to look into 
    # ./home-manager and ./nixos

    don = {
        hostname = "zenith";
        system = "x86_64-linux";
        username = "donielmaker";
        mail = "daniel.schmidt0204@gmail.com";
        dotfiles = "/home/${config.don.hostname}/.config";
        kb_layout = "us";
        monitor = ", 2560x1440@144hz, auto, 1";
        timezone = "Europe/Berlin";
    };

    imports = [./hardware-configuration.nix];

    system.stateVersion = "24.05"; # Just don't
}
