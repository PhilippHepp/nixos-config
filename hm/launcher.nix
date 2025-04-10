{ config, pkgs, lib, ... }:

{
  options.programs.fzf-launcher.enable = lib.mkEnableOption "Enable fzf-based application launcher";

  config = lib.mkIf config.programs.fzf-launcher.enable {
    environment.systemPackages = [ pkgs.fzf ];

    # You might want to provide a default fzf-launcher script here or
    # instruct the user on how to obtain/create one.
    # Here's a basic example of how you might define a simple launcher script:
    environment.shellAliases.launch = ''
      find /run/current-system/sw/bin /home/$USER/.local/bin /usr/local/bin /opt/*/bin /app/bin /usr/bin -executable -type f -print0 |
      sed -z 's:.*/::g' |
      sort -zu |
      fzf --reverse --height 40% --prompt "Launch: " --preview 'echo {}' |
      while IFS= read -r app; do
        command -v "$app" && exec "$app" &
      done
    '';

    # Alternatively, you could guide the user to use a more feature-rich
    # external fzf-launcher script. For example, if they have it in their
    # PATH, they could just use an alias like:
    # environment.shellAliases.launch = "fzf-launcher";

    # Further steps (not directly in this simple module):
    # 1. The user would typically bind this alias (e.g., 'launch') to a key
    #    combination in their window manager or terminal multiplexer
    #    configuration (like i3, sway, tmux, etc.).
    # 2. For a more robust solution, you might consider packaging a specific
    #    fzf-launcher script as part of the module or providing options
    #    to configure its behavior.
  };
}
