{
  config,
  inputs,
  pkgs,
  theme,
  ...
}:

let
  scheme = "${pkgs.base16-schemes}/share/themes/${theme.colorscheme}.yaml";
in
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = scheme;
    cursor = {
      name = "${theme.cursor}";
      size = 24;
      package = pkgs.rose-pine-cursor;
    };
    fonts = {
      sizes = {
        applications = 13;
        desktop = 12;
        popups = 12;
        terminal = 13;
      };
      # nerd-fonts.iosevka-term-slab
      # nerd-fonts.bigblue-terminal
      # nerd-fonts.fira-code
      # nerd-fonts.zed-mono
      sansSerif = {
        name = "Iosevka Nerd Font";
        package = pkgs.nerd-fonts.iosevka;
      };
      serif = {
        name = "TeX Gyre Schola";
        package = pkgs.gyre-fonts;
      };
      monospace = {
        name = "IosevkaTermSlab Nerd Font";
        package = pkgs.nerd-fonts.iosevka-term-slab;
      };
    };
    iconTheme = {
      enable = true;
      dark = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override { flavor = "macchiato"; };
    };
    opacity = {
      applications = 0.7;
      desktop = 0.7;
      popups = 0.7;
      terminal = 0.7;
    };
    targets = {
      firefox = {
        profileNames = [ "philipp" ];
        colorTheme.enable = true;
      };
      hyprpaper.enable = false;
      kitty.variant256Colors = true;
      lazygit.enable = false;
      rofi.enable = false;
      qt.enable = false;
      gnome.enable = false;
      kde.enable = false;
    };
  };
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    qt6ct
  ];
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "Fusion";
  };
  gtk = {
    enable = true;
    # iconTheme.name = "Rose-Pine";
    # iconTheme.package = pkgs.rose-pine-icon-theme;

    # theme.name = "catppuccin-macchiato-blue-standard";
    # theme.package = pkgs-stable.catppuccin-gtk.override {inherit variant;};
    # theme.name = "rose-pine-moon";
    # theme.package = pkgs.rose-pine-gtk-theme;
  };
}
