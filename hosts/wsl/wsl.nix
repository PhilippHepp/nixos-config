{
    settings = rec {
        hostname = "wsl";
        system = "x86_64-linux";
        username = "donielmaker";
        mail = "daniel.schmidt0204@gmail.com";
        dotfiles = "/home/${username}/.config";
        #kb_layout = "de";
        #monitor = ", 1920x1080@60hz, auto, 1";
        timezone = "Europe/Berlin";
    };
}
