{ dotfiles, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      sp = "spotify_player";
      gc = "sudo nix-collect-garbage -d";
      gco = "sudo nix optimise-store";
      rbt = "sudo nixos-rebuild test --flake ${dotfiles}/nix";
      tbb = "sudo nixos-rebuild boot --flake ${dotfiles}/nix";
      update-flake = "nix flake update --flake ${dotfiles}/nix";
      ff = "fastfetch";
    };
    shellAliases = {
      rb = "sudo nixos-rebuild switch --flake ${dotfiles}/nix";
      update = ''
        echo "Updating flake inputs..."
        nix flake update --flake ${dotfiles}/nix && \
        echo "Rebuilding system (switch)..." && \
        sudo nixos-rebuild switch --flake ${dotfiles}/nix
        echo "Update and rebuild complete."
      '';
      lg = "lazygit";
      v = "nvim .";
      ls = "eza -a --icons=auto";
      lS = "eza -l -ssize";
      ll = "eza -l";
      lD = "eza -lD";
      lDD = "eza -laD";
      c = "z";
      at = "astroterm -c -r -0.5 -l 2 -t 5.5 -u -i Bremen -s 3";
      gcd = ''
        echo "Running garbage collection"
        sudo nix-collect-garbage -d
        echo "Running nix store optimization"
        sudo nix store optimise
        echo "GC and Optimise complete."
      '';
    };
  };
  home.packages = with pkgs.fishPlugins; [
    z
    fzf
    plugin-git
    autopair
    spark
  ];

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
