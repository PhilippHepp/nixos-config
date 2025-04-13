# /hm/hyprland-controller.nix
{ config, pkgs, lib, ... }:

let
  cfg = config.programs.controllerInput;

  # Define the inputplumber configuration using Nix structures
  # This makes it easier to reference packages and manage
  inputplumberConfig = {
    device = [
      {
        # Try to match PS4 controllers (adjust if yours has a different name)
        # Use `sudo libinput list-devices` or `evtest` to find your controller's name
        name = "*Wireless Controller*"; # Common pattern for DualShock 4
        # name = "*DualSense*"; # If using a PS5 controller
        grab = false; # Start with false. If it interferes with games, set to true, but then you can't use it for games while this service runs.

        # --- Define Mappings ---
        mapping = [
          # D-Pad for Focus Movement
          {
            type = "abs";
            axis = "ABS_HAT0X"; # D-Pad Left/Right
            threshold = 0.5; # Trigger past half-way
            # action_positive = { command = ["notify-send", "D-Pad Right"]; }; # Debugging
            # action_negative = { command = ["notify-send", "D-Pad Left"]; };  # Debugging
            action_positive = { command = [ "${pkgs.hyprland}/bin/hyprctl" "dispatch" "movefocus" "r" ]; };
            action_negative = { command = [ "${pkgs.hyprland}/bin/hyprctl" "dispatch" "movefocus" "l" ]; };
          }
          {
            type = "abs";
            axis = "ABS_HAT0Y"; # D-Pad Up/Down
            threshold = 0.5;
            # action_positive = { command = ["notify-send", "D-Pad Down"]; }; # Debugging
            # action_negative = { command = ["notify-send", "D-Pad Up"]; };   # Debugging
            action_positive = { command = [ "${pkgs.hyprland}/bin/hyprctl" "dispatch" "movefocus" "d" ]; };
            action_negative = { command = [ "${pkgs.hyprland}/bin/hyprctl" "dispatch" "movefocus" "u" ]; };
          }

          # Shoulder Buttons for Workspace Switching
          {
            type = "key";
            key = "BTN_TR"; # R1
            # action = { command = ["notify-send", "Workspace Next"]; }; # Debugging
            action = { command = [ "${pkgs.hyprland}/bin/hyprctl" "dispatch" "workspace" "e+1" ]; };
          }
          {
            type = "key";
            key = "BTN_TL"; # L1
            # action = { command = ["notify-send", "Workspace Previous"]; }; # Debugging
            action = { command = [ "${pkgs.hyprland}/bin/hyprctl" "dispatch" "workspace" "e-1" ]; };
          }

          # Face Buttons for Actions
          {
            type = "key";
            key = "BTN_SOUTH"; # Cross (X)
            # action = { command = ["notify-send", "Close Window"]; }; # Debugging
            action = { command = [ "${pkgs.hyprland}/bin/hyprctl" "dispatch" "killactive" ]; };
          }
          {
            type = "key";
            key = "BTN_EAST"; # Circle (O)
            # action = { command = ["notify-send", "Open Terminal"]; }; # Debugging
            action = { command = [ "${pkgs.hyprland}/bin/hyprctl" "dispatch" "exec" "${config.programs.kitty.package}/bin/kitty" ]; }; # Use configured kitty package
          }
           {
            type = "key";
            key = "BTN_NORTH"; # Triangle
            # action = { command = ["notify-send", "Launcher"]; }; # Debugging
            action = { command = [ "${config.programs.rofi.package}/bin/rofi" "-show" "drun" ]; }; # Use configured rofi package
          }
           {
            type = "key";
            key = "BTN_WEST"; # Square
            # action = { command = ["notify-send", "Toggle Floating"]; }; # Debugging
            action = { command = [ "${pkgs.hyprland}/bin/hyprctl" "dispatch" "togglefloating" ]; };
           }

           # Options/Start for specific actions (customize as needed)
           {
             type = "key";
             key = "BTN_START"; # Options button
             # action = { command = ["notify-send", "Start Button"]; }; # Debugging
             action = { command = [ "${config.programs.rofi.package}/bin/rofi" "-show" "window" ]; }; # Show window switcher
           }
           # {
           #   type = "key";
           #   key = "BTN_SELECT"; # Share button (might be different name) or Touchpad press (BTN_TOUCH)
           #   action = { command = ["notify-send", "Select/Share Button"]; }; # Debugging
           # }

           # PS Button (might be BTN_MODE)
           # {
           #   type = "key";
           #   key = "BTN_MODE";
           #   action = { command = ["notify-send", "PS Button"]; }; # Debugging
           # }
        ];
      }
      # Add more devices if needed (e.g., a different controller)
    ];
  };

  # Generate the TOML configuration file from the Nix structure
  configFile = pkgs.formats.toml.generate "inputplumber.toml" inputplumberConfig;

in {
  # --- Define Module Options ---
  options.programs.controllerInput = {
    enable = lib.mkEnableOption "Enable PS4 controller input mapping via inputplumber";
    # Add more options later if needed (e.g., custom config path, grab mode)
  };

  # --- Configure Module ---
  config = lib.mkIf cfg.enable {

    # Install necessary packages
    home.packages = [ pkgs.inputplumber pkgs.libinput # For libinput list-devices
                       pkgs.evtest # Useful for debugging button names
                       pkgs.hyprland # Ensure hyprctl is available, though usually implied by hyprland module
                     ];

    # Create the systemd user service
    systemd.user.services.inputplumber = {
      Unit = {
        Description = "Inputplumber service for controller mapping";
        # Ensure it starts after the graphical session is ready
        Requires = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
        # If it requires hyprland socket, potentially add:
        # Requires = ["hyprland-session.target"]; # If such a target exists/is reliable
        # After = ["hyprland-session.target"];
      };

      Service = {
        # Make sure user is in 'input' group (handled in your nixos/user.nix)
        ExecStart = "${pkgs.inputplumber}/bin/inputplumber -c ${configFile}";
        Restart = "on-failure"; # Restart if it crashes
        RestartSec = "5s";
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

    # Optional: Add helpful alias for debugging
    programs.zsh.shellAliases = lib.mkIf config.programs.zsh.enable {
      testcontroller = "sudo evtest";
      listdevices = "sudo libinput list-devices";
    };
     programs.bash.shellAliases = lib.mkIf config.programs.bash.enable {
      testcontroller = "sudo evtest";
      listdevices = "sudo libinput list-devices";
    };

  };
}
