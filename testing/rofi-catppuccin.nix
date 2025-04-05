{
    flavor ? "macchiato", 
    stdenv,
    fetchFromGitHub,
    ...
}: 

stdenv.mkDerivation {
    pname = "rofi-catppuccin";
    version = "0.0.1";

    src = fetchFromGitHub {
        owner = "catppuccin";
        repo = "rofi";
        rev = "c24a212a6b07c2d45f32d01d7f10b4d88ddc9f45";
        hash = "sha256-WGYEA4Q7UvSaRDjP/DiEtfXjvmWbewtdyJWRpjhbZgg=";
    };

    installPhase = ''
        #mkdir -p $out

        #cp $src/themes/catppuccin-${flavor}.rasi $out/
        cp $src/themes/catppuccin-${flavor}.rasi $out
    '';
}
