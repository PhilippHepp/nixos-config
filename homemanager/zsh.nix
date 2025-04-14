{ dotfiles, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      update-flake = "nix flake update --flake ${dotfiles}/nix";
      rb = "sudo nixos-rebuild switch --flake ${dotfiles}/nix";
      rbt = "sudo nixos-rebuild test --flake ${dotfiles}/nix";
      rbb = "sudo nixos-rebuild boot --flake ${dotfiles}/nix";
      update = ''
        echo "Updating flake inputs..."
        nix flake update --flake ${dotfiles}/nix && \
        echo "Rebuilding system (switch)..." && \
        sudo nixos-rebuild switch --flake ${dotfiles}/nix
        echo "Update and rebuild complete."
      '';
      updatet = ''
        echo "Updating flake inputs..."
        nix flake update --flake ${dotfiles}/nix && \
        echo "Testing system build..." && \
        sudo nixos-rebuild test --flake ${dotfiles}/nix
        echo "Update and test complete."
      '';
      lg = "lazygit";
      v = "nvim";
      ls = "eza -a --icons=auto";
      # zz = "eza -aTL 3 --icons";
      ff = "fastfetch";
      #rust = "nix develop ${dotfiles}/nix#rust -c zsh";
      sp = "spotify_player";
      gc = "sudo nix-collect-garbage -d";
      gco = "sudo nix optimise-store";
      gcd = ''
        echo "Running nix-collect-garbage -d..."
        sudo nix-collect-garbage -d
        echo "Running nix store optimise..."
        sudo nix store optimise
        echo "GC and Optimise complete."
      '';
    };
  };
}
