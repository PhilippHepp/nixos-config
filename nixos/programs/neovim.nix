{pkgs, pkgs-stable, ...}:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    environment.systemPackages = with pkgs-stable; [
        pkgs.neovim

        # Programming Stuff
        zig
        pkgs.rustc
        cargo
        nodejs_22
        gnumake
        #openssl
        pkg-config

        # LSP
        lua-language-server
        rust-analyzer
        tinymist
        yaml-language-server
        nil
        slint-lsp
        pkgs.typescript-language-server
        pkgs.bash-language-server
        pkgs.vscode-langservers-extracted
    ];
}
