{
   wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
            "$mainMod" = "SUPER";

            monitor = ",2560x1440@144hz,auto,1";

            env = [
                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
                # "XCURSOR_THEME,Bibata-Modern-Ice"
                # "XCURSOR_SIZE, 24"
                # "HYPRCURSOR_THEME,Bibata-Modern-Ice"
                # "HYPRCURSOR_SIZE,24"
                "QT_QPA_PLATFORM,wayland"
                "XDG_SCREENSHOTS_DIR,~/screenshots"
            ];

            windowrule = [
                "float, ^(imv)$"
                "float, ^(mpv)$"

                "float, ^(wofi)$"
                "stayfocused, ^(wofi)$"
                "noborder, ^(wofi)$"

                # "float, ^(org.pulseaudio.pavucontrol)$"
                "float, ^(pavucontrol)$"
            ];

            exec-once = [
                "hyprctl setcursor Bibata-Modern-Ice 24"
                "eww open -c /home/donielmaker/.config/eww/bar bar"
                "swww init"
                "swww img /home/donielmaker/.config/nix/wallpapers/nixos-wallpaper-catppuccin-macchiato.png"
                "openrgb -p /home/donielmaker/.config/OpenRGB/Main.orp"
                "wl-paste --type text --watch cliphist store"
                "wl-paste --type image --watch cliphist store"
            ];

            cursor = {
                no_hardware_cursors = true;
            };

            debug = {
                disable_logs = false;
                enable_stdout_logs = true;
            };

            input = {
                kb_layout = "us";
                # kb_variant = "lang";
                # kb_options = "grp:caps_toggle";

                follow_mouse = 1;

                touchpad = {
                    natural_scroll = false;
                };

                sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
            };

            dwindle = {
                pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                preserve_split = true; # you probably want this
            };

            general = {
                gaps_in = 5;
                gaps_out = "60, 20, 20, 20";
                border_size = 3;
                "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                "col.inactive_border" = "rgba(595959aa)";

                layout = "dwindle";

                # no_cursor_warps = false;
            };

            decoration = {
                rounding = 10;

                dim_inactive = true;
                dim_strength = 0.3;

                blur = {
                    enabled = true;
                    size = 16;
                    passes = 2;
                    new_optimizations = true;
                };

                drop_shadow = true;
                shadow_range = 4;
                shadow_render_power = 3;
                "col.shadow" = "rgba(1a1a1aee)";
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
                "$mainMod, V, exec, cliphist list | wofi --dmenu --allow-images --normal-window --width 500 --height 500 | cliphist decode | wl-copy"

                "$mainMod, Return, exec, alacritty"
                "$mainMod, E, exec, nemo"
                "$mainMod, B, exec, firefox"
                # "$mainMod, Space, exec, rofi -show drun -show-icons"
                "$mainMod, Space, exec, wofi --show drun --normal-window  --allow-images --width 500 --height 500"

                "$mainMod, Q, killactive,"
                "$mainMod_Shift, Q, closewindow"
                "$mainMod, M, exit,"
                "$mainMod, F, togglefloating,"
                "$mainMod, P, pseudo, # dwindle"
                "$mainMod, J, togglesplit, # dwindle"

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

                # Volume and Media Control
                # "$mainMod, Page_Up, exec, pamixer -i 5 "
                # "$mainMod, Page_Down, exec, pamixer -d 5 "
                # ", Shift_R, exec, pamixer --default-source -t && pamixer -t"
                # ",Shift_R, exec, bash /home/donielmaker/.config/nix/home-manager/modules/togglemute.sh"
                ", Control_R, exec, pamixer --default-source -t"

                #  INFO: Currently unused

                # Keyboard backlight
                # "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
                # "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

                # Brightness control
                # ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
                # ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

                # Configuration files
                # ''$mainMod SHIFT, N, exec, alacritty -e sh -c "rb"''
                # ''$mainMod SHIFT, C, exec, alacritty -e sh -c "conf"''
                # ''$mainMod SHIFT, H, exec, alacritty -e sh -c "nvim ~/nix/home-manager/modules/wms/hyprland.nix"''
                # ''$mainMod SHIFT, W, exec, alacritty -e sh -c "nvim ~/nix/home-manager/modules/wms/waybar.nix''
                # '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

                # Waybar
                # "$mainMod, B, exec, pkill -SIGUSR1 waybar"
                # "$mainMod, W, exec, pkill -SIGUSR2 waybar"

                # Disable all effects
                # "$mainMod Shift, G, exec, ~/.config/hypr/gamemode.sh "
            ];

            bindm = [
                # Interact with Floating Windows
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];
        };
    };
}
