{
  pkgs,
  config,
  dotfiles,
  ...
}:

let
  palette = config.lib.stylix.colors;
in

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      modi = "drun,calc";
    };
    plugins = with pkgs; [ rofi-calc ];
    location = "center";
    theme = "arthur";
  };
  programs.eww = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file = {
    "${dotfiles}/eww/eww.scss".text = ''
           

      // Assign semantic names
      $bg: #${palette.base00};
      $bg_highlight: #${palette.base03};
      $fg: #${palette.base06};
      $fg_subtle: #${palette.base05};
      $red: #${palette.base08};
      $orange: #${palette.base09};
      $yellow: #${palette.base0A};
      $green: #${palette.base0B};
      $teal: #${palette.base0C};
      $blue: #${palette.base0D};
      $purple: #${palette.base0E};
      $magenta: #${palette.base07}; // Mapping from example

      // General Styles
      * {
        all: unset;
        font-family: "IosevkaTermSlab Nerd Font", monospace; // Choose your Nerd Font
        font-size: 14px;
      }

      // Bar specific styles
      .bar {
        background-color: $bg;
        color: $fg;
        border-radius: 15px;
        border: 3px solid $bg_highlight; // Optional border
      }

      // Sections
      .left, .center, .right {
        padding: 2px 2px;
      }

      .left {
        // styles for left section container
      }

      .center {
        // styles for center section container
      }

      .right {
        // styles for right section container
      }

      // Generic Button Styles
      button {
        background-color: transparent;
        border-radius: 8px;
        padding: 0px 2px;
        margin: 0 2px;

        &:hover {
          background-color: $bg_highlight;
          transition: background-color 0.3s ease;
        }
      }

      // Powermenu specific styles
      .powermenu button label {
        font-size: 16px;
        min-width: 20px;
      }
      .shutdown { color: $red; }
      .reboot   { color: $yellow; }
      .sleep    { color: $blue; }

      // Workspaces
      .workspaces-scroll {
        // Maybe add padding if needed
      }
      .workspaces {
        padding: 0 5px;
      }
      .workspace button {
        font-size: 18px; // Adjust icon size
        padding: 0 4px;
        color: $fg_subtle;
        border-radius: 6px; // Softer corners for icons
        min-width: 25px; // Ensure consistent button width

        &.occupied {
          color: $fg; // Make occupied workspaces stand out slightly
        }
        &.active {
          color: $blue; // Active workspace icon color
          background-color: $bg_highlight;
        }
      }

      // Time/Date
      .time-date button {
        font-weight: bold;
        padding: 0 10px;
      }

      // Calendar Popup
      .calendar-window {
        background-color: transparent; // Allow box shadow
        padding: 10px; // Space for shadow
      }
      .calendar-box {
        background-color: $bg;
        border: 1px solid $bg_highlight;
        border-radius: 8px;
        padding: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); // Add shadow
        color: $fg;

        calendar {
          padding: 5px;
          &.header {
            color: $blue;
            font-weight: bold;
            margin-bottom: 5px;
          }
          &.button { // Day numbers
             border-radius: 4px;
             &:hover { background-color: $bg_highlight; }
          }
          &.highlight { // Today
            color: $orange;
            font-weight: bold;
          }
          &:selected { // Clicked day
            background-color: $blue;
            color: $bg;
          }
          &.placeholder { // Days from other months
            color: $bg_highlight;
          }
          &.heading { // Day names (Mon, Tue...)
            color: $purple;
            margin-bottom: 3px;
          }
        }
      }


      // Right Side Modules (General Container)
      .controls {
        margin-left: 1px; // Space between modules
        padding: 0 2px;
        border-radius: 8px;
        transition: background-color 0.3s ease;

        &:hover {
          background-color: $bg_highlight; // Highlight module on hover
        }
      }

      // Volume & Brightness Shared
      .scale-box {
        padding: 0 2px;
      }
      scale {
        trough {
          background-color: $bg_highlight;
          border-radius: 10px;
          min-height: 6px;
          min-width: 80px; // Adjust width of sliders
          margin: 0 1px;
        }
        highlight {
          border-radius: 10px;
        }
      }

      // Volume Specific
      .audio-controls {
        // Container for both sink and source
      }
      .volume-control { // Container for icon + slider reveal
        padding: 0 2px;
      }
      .volume-icon {
        font-size: 16px;
        min-width: 20px; // Align icons
      }
      .sink-icon { color: $teal; }
      .source-icon { color: $blue; }
      .muted { color: $red; }

      .volume trough {
        background-color: $bg_highlight;
        margin: 0px; // Reset margin if needed
      }
      .sink-slider trough highlight { background-color: $teal; }
      .source-slider trough highlight { background-color: $blue; }


      // Brightness Specific
      .brightness-control {
        padding: 0 2px;
      }
      .brightness-icon {
        font-size: 16px;
        color: $yellow;
        min-width: 10px; // Align icons
      }
      .brightness-slider trough highlight { background-color: $yellow; }


      // Network Specific
      .network-control {
        padding: 0 5px;
      }
      .network-icon {
        font-size: 16px;
        min-width: 20px; // Align icons
        &.disconnected { color: $red; }
        &.connected { color: $green; }
        &.connecting { color: $orange; }
      }
      .network-ssid {
        margin-left: 5px;
        font-style: italic;
        color: $fg_subtle;
      } 
    '';
  };

  home.packages = [
    pkgs.libqalculate
    pkgs.socat
  ];
}
