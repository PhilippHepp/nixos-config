{
  pkgs,
  dotfiles,
  shell,
  lib,
  ...
}:
{
  programs.lf = {
    enable = true;
    keybindings = {
      # D = "trash";
      gh = "cd ~";
      df = "cd ${dotfiles}/nix";
    };
  };
  programs.yazi =
    {
      enable = true;
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
      # FIX: find hash and rev values
      # plugins = {
      # chmod = "${yazi-plugins}/chmod.yazi";
      # full-border = "${yazi-plugins}/full-border.yazi";
      # toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
      # };
      initLua = '''';
      keymap = {
        manager.prepend_keymap = [
        ];
      };
    }
    // lib.optionalAttrs (shell == "bash") { enableBashIntegration = true; }
    // lib.optionalAttrs (shell == "zsh") { enableZshIntegration = true; }
    // lib.optionalAttrs (shell == "fish") { enableFishIntegration = true; };

  home.packages = with pkgs; [
    superfile
    nemo
  ];
}
