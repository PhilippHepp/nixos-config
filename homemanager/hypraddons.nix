{ dotfiles, theme, ... }:
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
}
