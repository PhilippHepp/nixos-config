{
  pkgs,
  dotfiles,
  ...
}: let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "...";
    hash = "sha256-...";
  };
in {
  programs.lf = {
    enable = true;
    keybindings = {
      # D = "trash";
      gh = "cd ~";
      df = "cd ${dotfiles}/nix";
    };
  };
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };
    plugins = {
      chmod = "${yazi-plugins}/chmod.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
    };
    initLua = ''
      require("full-border"):setup()
    '';
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
          desc = "Chamod on selected files";
        }
      ];
    };
  };
  home.packages = with pkgs; [
    superfile
  ];
}
