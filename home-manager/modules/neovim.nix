{pkgs, ...}:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        plugins = with pkgs.vimPlugins.nvim-treesitter-parsers; [
            json
            javascript
            tsx
            yaml
            yuck
            html
            css
            markdown
            markdown_inline
            bash
            lua
            gitignore
            query
            c
            rust
            regex
            slint
            typst
        ];
    };

}
