{ pkgs, pkgs-firefox, ...}: {
    programs.firefox = {
        enable = true;

        profiles.donielmaker = {
            # Don't really know it's use yet
            search.engines."Nix Packages" = {
                urls = [{
                    template = "https://search.nixos.org/packages";
                    params = [
                        {name = "type"; value = "packages";}
                        {name = "query"; value = "{searchTerms}";}
                    ];
                }];

                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
            };
            search.force = true;

            extensions = with pkgs-firefox;[
                bitwarden
                ublock-origin
                sponsorblock
            ];
        };
    };
}
