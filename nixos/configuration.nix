# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
	imports = [];

	wsl.enable = true;
	wsl.defaultUser = "donielmaker";

# services = {
#     xserver = {
#         enable = true;
#         xkb.layout = "us";
#         desktopManager.plasma5.enable = true;
#     }; 
#     displayManager.sddm.enable = true;
# };

	networking.networkmanager.enable = true;
	networking.hostName = "wsl"; # Define your hostname  

    time.timeZone = "Europe/Berlin";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
# Text Editors
			vim
			neovim
# CLI Tools
			zsh
			oh-my-posh
			git
			gh
			ripgrep
			fd
			fzf
			zoxide
			chafa
			unzip
			neofetch
# Programming doodads
			gcc
			rustc
			cargo
			nodejs_22
			gnumake
			openssl
			pkg-config
# LSP
			rust-analyzer
			slint-lsp
			lua-language-server
# Other
			home-manager
			];

	users.users.donielmaker = {
		isNormalUser = true;
		description = "DonielMaker";
		extraGroups = ["networkmanager" "wheel" "input"];
		shell = pkgs.zsh;
	};

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It's perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?
}

