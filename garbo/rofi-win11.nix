{
    stdenv,
    fetchFromGitHub,
    ...
}: 

stdenv.mkDerivation {
    pname = "rofi-win11";
    version = "0.0.1";

    src = fetchFromGitHub {
        owner = "newmanls";
        repo = "rofi-themes-collection";
        rev = "c2be059e9507785d42fc2077a4c3bc2533760939";
        hash = "sha256-pHPhqbRFNhs1Se2x/EhVe8Ggegt7/r9UZRocHlIUZKY=";
    };

    installPhase = ''
        mkdir -p $out

        cp $src/themes/windows11-list-dark.rasi $out/
    '';
}
