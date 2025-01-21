{pkgs ? import <nixpkgs> {}, flavor ? "macchiato"}:

pkgs.stdenv.mkDerivation {
    name = "catppuccin-sddm";

    src = pkgs.fetchzip {
        url = "https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-${flavor}.zip";
        sha256 = "sha256-ytkrPoXy/M0Hf9SHh9PjzfkYrF8pRGw3EF9fUwwzJ14=";
    };

    installPhase = ''
        runHook preInstall

        sed -i 's/Catppuccin\ macchiato/catppuccin-sddm/' ./metadata.desktop
        mkdir -p $out/share/sddm/themes/catppuccin-sddm
        cp ./* $out/share/sddm/themes/catppuccin-sddm -r

        runHook postInstall
    '';
}
