{
    stdenv,
    fetchFromGitHub,
    ...
}: 

stdenv.mkDerivation {
    pname = "rofi-spotlight";
    version = "1.0.0";

    src = fetchFromGitHub {
        owner = "newmanls";
        repo = "rofi-themes-collection";
        rev = "c2be059e9507785d42fc2077a4c3bc2533760939";
        hash = "sha256-pHPhqbRFNhs1Se2x/EhVe8Ggegt7/r9UZRocHlIUZKY=";
    };

    installPhase = ''
        mkdir -p $out

        cp $src/themes/spotlight-dark.rasi $out/
        sed -i 's/    fixed-height:   false;/    fixed-height:   true;/g' $out/spotlight-dark.rasi
    '';
}
