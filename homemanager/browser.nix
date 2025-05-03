{
  pkgs,
  username,
  inputs,
  system,
  ...
}:
{
  programs.firefox = {
    enable = true;
    languagePacks = [
      "de"
      "en-US"
    ];

    profiles.${username} = {
      search.engines."Nix Packages" = {
        # TODO: Remove search engine, Albert's is sufficient
        urls = [
          {
            template = "https://mynixos.com/search?";
            params = [
              {
                name = "q";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@nix" ];
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
  home.packages = with pkgs; [
    bombadillo
    ladybird
  ];
}
