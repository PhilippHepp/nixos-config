# Bullshit

{
    qtbase,
    qtsvg,
    qtgraphicaleffects,
    qtquickcontrols2,
    wrapQtAppsHook,
    stdenvNoCC,
    fetchFromGitHub
}:

stdenvNoCC.mkDerivation {
    name = "tokyonight-sddm-theme";

    src = fetchFromGitHub {
      owner = "siddrs";
      repo = "tokyo-night-sddm";
      rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
      hash = "sha256-JRVVzyefqR2L3UrEK2iWyhUKfPMUNUnfRZmwdz05wL0=";
    };

    nativeBuildInputs = [
        wrapQtAppsHook
    ];

    propagatedUserEnvPkgs = [
        qtbase
        qtsvg
        qtgraphicaleffects
        qtquickcontrols2
    ];

    dontBuild = true;

    installPhase = ''
        mkdir -p $out/
        cp -aR ./* $out
    '';
}
