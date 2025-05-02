{
  pkgs,
  username,
  ...
}:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "864a0210d9ba1e8eb925160c2e2a25342031d8d3";
    hash = "sha256-m3709h7/AHJAtoJ3ebDA40c77D+5dCycpecprjVqj/k=";
  };
in
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    enableZshIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
      opener = {

      };
    };
    plugins = {
      chmod = "${yazi-plugins}/chmod.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
    };
    initLua = ''require("full-border"):setup()'';
    keymap = {
      manager.prepend_keymap = [
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
      ];
    };
  };

  home.packages = with pkgs; [
    superfile
    nemo
    # Utils
    zathura
    imagemagick
    resvg
  ];
}
