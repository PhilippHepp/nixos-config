{ pkgs-stable, pkgs, ... }: 

let
    variant = "macchiato";
  # variant = "rose-pine-moon";
in

{
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
        iconTheme.package = pkgs-stable.catppuccin-papirus-folders.override {flavor = variant;};
      # iconTheme.name = "Rose-Pine";
      # iconTheme.package = pkgs.rose-pine-icon-theme;

      # theme.name = "catppuccin-macchiato-blue-standard";
      # theme.package = pkgs-stable.catppuccin-gtk.override {inherit variant;};
        theme.name = "rose-pine-moon";
        theme.package = pkgs.rose-pine-gtk-theme;
    };
} 
