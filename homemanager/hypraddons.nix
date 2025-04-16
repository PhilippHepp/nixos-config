{
  dotfiles,
  theme,
  config,
  pkgs,
  ...
}:
{
  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = "hyperctl dispatch dpms on";
          ignore_dbus_inhibit = false;
        };
        listener = [
          {
            timeout = 600;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
    hyprpaper = {
      enable = true;
      settings = {
        preload = "${dotfiles}/nix/assets/wallpapers/${theme.wallpaper}";
        wallpaper = "${dotfiles}/nix/assets/wallpapers/${theme.wallpaper}";

        # wallpaper = "/home/${username}/Images/Eldritch-Island-Vista.webp";
      };
    };
  };
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 0;
        hide_cursor = true;
      };
      input-field = {
        size = "400, 100";
        position = "0, 0";
        monitor = "DP-1";
        dots_center = true;
        fade_on_empty = false;
        placeholder_text = "#ACHTUNG ACHTUNG";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        numlock_color = "rgb(${config.lib.stylix.colors.base0C})";
        font_family = "IosevkaTermSlab Nerd Font";
        outline_thickness = 5;
        shadow_passes = 2;
      };

    };
  };
  services.wlsunset = {
    enable = true;
    temperature = {
      day = 6400;
      night = 3200;
    };
    latitude = 53;
    longitude = 9;
  };
  home.packages = with pkgs; [
    hyprshot
    hyprnome
  ];
}
