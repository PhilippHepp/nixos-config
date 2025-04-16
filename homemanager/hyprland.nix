{
  pkgs,
  monitor,
  dotfiles,
  theme,
  kb_layout,
  ...
}:
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland = {
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";

      inherit monitor;

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
      ];

      windowrule = [
        # "float, ^(imv)$"
        # "float, ^(mpv)$"
        #
        # "float, ^(wofi)$"
        # "stayfocused, ^(wofi)$"
        # "noborder, ^(wofi)$"
        #
        # "float, title:^(Bitwarden)$"

        "float, title:^(Picture in picture)$"
        "pin, title:^(Picture in picture)$"
        "size 678 384, title:^(Picture in picture)$"
        "move 1214 671, title:^(Picture in picture)$"
        "noinitialfocus, title:^(Picture in picture)$"

        "float, class:^(Rofi)$"
        "stayfocused, class:^(Rofi)$"
        "noborder, class:^(Rofi)$"

        #"float, ^(org.pulseaudio.pavucontrol)$"

        #"float, ^(.blueman-manager-wrapped)"
      ];

      exec-once = [
        "hyprpaper"
        "hyprlock || hyprctl dispatch exit"
        "xrandr --output DP-1 --primary"
        # "hyprctl setcursor BreezeX-RosePine-Linux 24"
        "openrgb -p ${dotfiles}/OpenRGB/Main.orp"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        # "mangohud steam"
      ];

      exec = [
        # "swww img ~/home/philipp/Images/Signalis-RosePine-Wallpaper.png"
        ''hyperctl hyprpaper reload ,"${dotfiles}/nix/assets/wallpapers/${theme.wallpaper}"''
      ];

      cursor = {
        no_hardware_cursors = true;
      };

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        inherit kb_layout;
        # kb_variant = "lang";
        # kb_options = "grp:caps_toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.25;
        };

        sensitivity = -0.7; # -1.0 - 1.0, 0 means no modification.
        numlock_by_default = true;
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      general = {
        gaps_in = 5;
        gaps_out = "10, 10, 10, 10";
        border_size = 3;
        # "col.active_border" = "rgba(9ccfd8ee)";
        # "col.inactive_border" = "rgba(31748faa)";

        layout = "dwindle";

        # no_cursor_warps = false;
      };

      decoration = {
        rounding = 10;

        dim_inactive = true;
        dim_strength = 0.15;

        blur = {
          enabled = true;
          size = 12;
          passes = 2;
          new_optimizations = true;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # color = "rgba(1a1a1aee)";
        };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

      bind = [
        "$mainMod, Return, exec, ${pkgs.kitty}/bin/kitty"
        "$mainMod, E, exec, kitty -e yazi"
        "$mainMod, B, exec, ${pkgs.firefox}/bin/firefox"
        # Application Launcher
        "$mainMod, space, exec, rofi -show drun -show-icons"
        # Clipboard History
        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy" # Clipboard
        "$mainMod, C, exec, rofi -show calc -no-history"
        # Color Picker
        "$mainMod, I, exec, hyprpicker -a -f hex"

        # Spotify
        "$mainMod, S, exec, kitty -e spotify_player"
        "$mainMod SHIFT, S, exec, hyprshot -m region -z "
        # ''$mainMod SHIFT, S, exec, grim -g "$(slurp -w 0)" $XDG_SCREENSHOTS_DIR/$(date +'%s.png)''

        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, F, togglefloating,"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, G, fullscreen"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, P, exec, systemctl suspend"

        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        #Switch workspaces with mainMod + scrollwheel
        "$mainMod, mouse_down, exec, hyprnome"
        "$mainMod, mouse_up, exec, hyprnome --previous"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Mute source
        ", Control_R, exec, pamixer --default-source -t"

        #  INFO: Currently unused

        # Keyboard backlight
        # "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
        # "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

        # Configuration files
        # ''$mainMod SHIFT, N, exec, alacritty -e sh -c "rb"''
        # ''$mainMod SHIFT, C, exec, alacritty -e sh -c "conf"''
        # ''$mainMod SHIFT, H, exec, alacritty -e sh -c "nvim ~/nix/home-manager/modules/wms/hyprland.nix"''
        # ''$mainMod SHIFT, W, exec, alacritty -e sh -c "nvim ~/nix/home-manager/modules/wms/waybar.nix''
        # '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

        # Laptop related
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -t"

        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        "SHIFT, XF86AudioRaiseVolume, exec, pamixer --default-source -i 5"
        "SHIFT, XF86AudioLowerVolume, exec, pamixer --default-source -d 5"
      ];

      bindm = [
        # Interact with Floating Windows
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
