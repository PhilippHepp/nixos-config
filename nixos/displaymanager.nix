{
  services.displayManager = {
    enable = true;
    autoLogin.enable = true;
    autoLogin.user = "philipp";
    defaultSession = "hyprland";
  };

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    settings = {
      AutoLogin = {
        Session = "hyprland";
        User = "philipp";
      };
    };
    wayland.enable = true;
    theme = "breeze";
  };
}
