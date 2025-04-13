{
  pkgs,
  username,
  inputs,
  system,
  ...
}: {
  programs.firefox = {
    enable = true;
    languagePacks = [
      "de"
      "en-US"
    ];

    profiles.${username} = {
      search.engines."Nix Packages" = {
        urls = [
          {
            template = "https://mynixos.com/search?q=";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = ["@nix"];
      };
      search.force = true;
      extensions.force = true;
      extensions.packages = with inputs.firefox-addons.packages.${system}; [
        clearurls
        ublock-origin
        buster-captcha-solver
        bitwarden
        sponsorblock
      ];
    };
  };
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
    ];
    commandLineArgs = [
      "--disable-features=WebRtcAllowInputVolumeAdjustment"
    ];
  }; # TODO: add bombadillo
}
