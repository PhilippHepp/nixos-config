{pkgs ? import <nixpkgs> {}, flavor ? "macchiato"}:

pkgs.stdenv.mkDerivation {
    name = "Catppuccin ${flavor}";

    src = pkgs.fetchzip {
        url = "https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-${flavor}.zip";
        sha256 = "sha256-ytkrPoXy/M0Hf9SHh9PjzfkYrF8pRGw3EF9fUwwzJ14=";
    };

    installPhase = ''
        runHook preInstall

        mkdir -p $out/share/sddm/themes/"Catppuccin ${flavor}"
        cp $src/* $out/share/sddm/themes/"Catppuccin ${flavor}" -r

        runHook postInstall
    '';
}
