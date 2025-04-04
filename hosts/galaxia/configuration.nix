{inputs, pkgs, ...}:

{
    imports = with inputs.self.nixosModules; [
        ./hardware-configuration.nix
        inputs.disko.nixosModules.disko

        # System
        settings
        networking
        bootloader
        user

        # Programs
        neovim
        zsh
        # /programs/wireguard

        # Modules
        sound
        graphics
        bluethooth
        sddm
        intel
        ntfs
    ];

    environment.systemPackages = with pkgs; [
        # Programs
        obsidian
        vesktop
        brave
        nemo
        hyprpicker
        # steam
        geeqie
        (flameshot.override { enableWlrSupport = true; })
        # Other
        home-manager
    ];

    system.stateVersion = "24.05"; # Just don't

    networking.enableIPv6 = false;
    networking.wireguard.enable = true;
    networking.wireguard.interfaces.wg0 = {
        ips = ["10.10.14.6/24"];
        privateKey = "sLQxey4raHRl7klEDD5D18OuZSsqOdFXeRuh9MCGOWo=";
        mtu = 1420;
        peers = [
            {
                allowedIPs = [
                    "10.10.12.0/24"
                ];
                endpoint = "public.ipv64.de:51820";
                publicKey = "Ltmlc2mcJuKprhi5l6rU2hwMqejwQIQ/GFZB+sEckCQ=";
                presharedKey = "ZRpCqktsOfw82jy1Ony7lJmKQ1x4VBswuAAIM6L5Gs4=";
                dynamicEndpointRefreshSeconds = 300;
            }
        ];
    };
}
