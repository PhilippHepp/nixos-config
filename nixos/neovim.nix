{pkgs, pkgs-stable, ...}:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

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
        texliveFull

        # LSP
        marksman
        texlab
        lua-language-server
        rust-analyzer
        tinymist
        yaml-language-server
        nil
        # nixd
        slint-lsp
        pkgs.typescript-language-server
        pkgs.bash-language-server
        pkgs.vscode-langservers-extracted
    ];
}
