{gpu, ... }: 

{
    imports = [
        ./bootloader.nix
        ./pkgs.nix
        ./sound.nix
        ./graphics.nix
        ./openrgb.nix
        ./netbird.nix
        (if (gpu == "nvidia") then ./nvidia.nix else {})
    ];
}
