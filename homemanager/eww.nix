{ config
, dotfiles
, ...
}:

let
  palette = config.lib.stylix.colors;
in

{
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
        font-family: "${config.stylix.fonts.monospace.name}", monospace; // Choose your Nerd Font
        font-size: 16px;
      }

      // Bar specific styles
      .bar {
        background-color: $bg;
        color: $fg;
        border-radius: 15px;
        border: 3px solid $bg_highlight; // Optional border
      }
      button {
        background-color: $bg;
        border-radius: 20px;
        &:hover {
          background-color: $bg_highlight;
          transition: 0.5s;
        }
      }

      .workspace {
        background-color: $bg_highlight;
        border-radius: 4px;
        &.active {
          background-color: $fg;
        }
      }
      .cal {
        background-color: $bg;
        border: 2px solid $bg_highlight;
        border-radius: 20px;
        opacity: 0.95;
        font-size: 18px;
        padding: 5px;

        .header {
          color: $blue;
          border: none;
        }
      }
      .muted {
        color: $red;
      }

      .sink {
        .unmuted, .volume {
          color: $teal;
        }
      } 

      .source {
        .unmuted, .volume {
          color: $blue;
        }
      }
      .shutdown {
        color: $red;
      }

      .reboot {
        color: $yellow;
      }

      .sleep {
        color: $blue;
      }
    '';
  };

}
