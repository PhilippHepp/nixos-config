{ username, ... }:
{
  services.displayManager = {
    enable = true;
    autoLogin.enable = true;
    autoLogin.user = "${username}";
    defaultSession = "hyprland";
  };

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    settings = {
      AutoLogin = {
        Session = "hyprland";
        User = "${username}";
      };
    };
    wayland.enable = true;
    theme = "breeze";
  };
}
