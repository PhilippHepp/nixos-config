{gpu, ... }: 

{
    imports = [
        ./bootloader.nix
        ./pkgs.nix
        ./sound.nix
        ./graphics.nix
        ./openrgb.nix
        ./netbird.nix
        ./fingerprint.nix
        ./bluethooth.nix
        (if (gpu == "nvidia") then ./nvidia.nix else {})
        (if (gpu == "intel") then ./intel.nix else {})
    ];
}
