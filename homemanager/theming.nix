{
  config,
  inputs,
  pkgs,
  theme,
  lib,
  ...
}: let
  scheme = "${pkgs.base16-schemes}/share/themes/${theme.colorscheme}.yaml";
in {
  imports = [inputs.stylix.homeManagerModules.stylix];

  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = scheme;
    cursor = {
      name = "${theme.cursor}";
      size = 32;
      package = pkgs.rose-pine-cursor;
    };
    fonts = {
      sizes = {
        applications = 13;
        desktop = 12;
        popups = 12;
        terminal = 16;
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
      package = pkgs.catppuccin-papirus-folders.override {flavor = "macchiato";};
    };
    opacity = {
      applications = 0.7;
      desktop = 0.7;
      popups = 0.5;
      terminal = 0.5;
    };
    targets = {
      firefox = {
        profileNames = ["philipp"];
        colorTheme.enable = true;
      };
      nvf = {
        transparentBackground.enable = true;
      };
      kitty.variant256Colors = true;
      hyprpaper.enable = false;
      lazygit.enable = false;
      rofi.enable = false;
      gnome.enable = false;
      qt.enable = false;
    };
  };
  home.packages = with pkgs; [
    qt6ct
  ];
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
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
