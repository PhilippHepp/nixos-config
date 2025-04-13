{pkgs, pkgs-stable, ...}:

{
    programs.neovim.enable = true;
    programs.neovim.defaultEditor = true;

    environment.systemPackages = with pkgs-stable; [
        pkgs.neovim

	# Programming Stuff
        tree-sitter
        zig
        pkgs.rustc
        cargo
        nodejs
        gnumake
        openssl
        pkg-config
        # texliveFull

	# LSP
	marksman
	lua-language-server
	nixd
	# rust-analyzer
	tinymist
	yaml-language-server
	nil
	slint-lsp
	pkgs.bash-language-server
	pkgs.vscode-langservers-extracted
    ];
}
