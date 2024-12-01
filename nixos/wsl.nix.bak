{ username, ... }:{
    disabledModules = [
        ./modules/bootloader.nix
        ./modules/graphics.nix
        ./modules/sound.nix
        ./openrgb.nix
    ];

    wsl.enable = true;
    wsl.defaultUser = username;
        
    networking.hostName = "wsl";
}
