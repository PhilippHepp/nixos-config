{
  inputs,
  pkgs,
  theme,
  ...
}: {
  imports = [inputs.stylix.homeManagerModules.stylix];

  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme.colorscheme}.yaml";
    targets = {
      nvf.enable = true;
      bat.enable = true;
      neovim.enable = true;
      yazi.enable = true;
      hyprland.enable = true;
      kitty = {
        enable = true;
        variant256Colors = true;
      };
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "Fusion";
  };
  gtk = {
    enable = true;

    # cursorTheme.name = "Bibata-Modern-Ice";
    # cursorTheme.package = pkgs-stable.bibata-cursors;
    cursorTheme.name = "BreezeX-RosePine-Linux";
    cursorTheme.package = pkgs.rose-pine-cursor;

    iconTheme.name = "Papirus-Dark";
    iconTheme.package = pkgs.catppuccin-papirus-folders.override {flavor = "macchiato";};
    # iconTheme.name = "Rose-Pine";
    # iconTheme.package = pkgs.rose-pine-icon-theme;

    # theme.name = "catppuccin-macchiato-blue-standard";
    # theme.package = pkgs-stable.catppuccin-gtk.override {inherit variant;};
    theme.name = "rose-pine-moon";
    theme.package = pkgs.rose-pine-gtk-theme;
  };
}
