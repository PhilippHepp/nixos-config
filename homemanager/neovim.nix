{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.nvf
    # TODO home/philipp/.config/nix/hm/vimbinds.nix
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        searchCase = "smart";
        preventJunkFiles = true;
        undoFile.enable = true;
        options = rec {
          cursorlineopt = "both";
          shiftwidth = 2;
          tabstop = shiftwidth;
          softtabstop = shiftwidth;
        };
        lsp = {
          formatOnSave = true;
          lspkind.enable = true;
          lightbulb.enable = true;
          trouble.enable = true;
        };
        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };
        runner.run-nvim = {
          enable = true;
        };
        languages = {
          enableDAP = true;
          enableExtraDiagnostics = true;
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;

          nix.enable = true;
          markdown.enable = true;
          bash.enable = true;
          lua.enable = true;
          python = {
            enable = true;
            lsp.server = "python-lsp-server";
          };
        };
        visuals = {
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;

          highlight-undo.enable = true;
          indent-blankline.enable = true;

          # Fun
          cellular-automaton.enable = true;
        };
        statusline.lualine.enable = true;

        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;

        filetree = {
          neo-tree = {
            enable = true;
            setupOpts = {
              enable_cursor_hijack = true;
              enable_diagnostics = true;
              enable_git_status = true;
              enable_modified_markers = true;
              enable_opened_markers = true;
            };
          };
        };
        tabline.nvimBufferline = {
          enable = true;
        };
        treesitter = {
          context.enable = true;
          fold = true;
          indent.enable = true;
        };

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };
        telescope = {
          enable = true;
          setupOpts.defaults = {
            file_ignore_patterns = ["out/" "build/" ".git/"];
          };
        };
        git = {
          enable = true;
          gitsigns.enable = true;

          vim-fugitive.enable = true;
        };
        minimap = {
          minimap-vim.enable = false;
          codewindow.enable = true; # lighter, faster, and uses lua for configuration
        };
        dashboard.startify = {
          enable = true;
          changeToVCRoot = true;
        };
        notify = {
          nvim-notify.enable = true;
        };

        projects = {
          project-nvim.enable = true;
        };
        utility = {
          ccc.enable = false;
          vim-wakatime.enable = false;
          diffview-nvim.enable = true;
          yanky-nvim.enable = false;
          icon-picker.enable = true;
          surround.enable = true;
          leetcode-nvim.enable = true;
          multicursors.enable = true;
          preview.markdownPreview.enable = true;

          motion = {
            hop.enable = true;
            leap.enable = true;
            precognition.enable = true;
          };
          images = {
            image-nvim.enable = false;
          };
        };
        notes = {
          obsidian.enable = false; # FIXME: neovim fails to build if obsidian is enabled
          neorg.enable = false;
          orgmode.enable = false;
          mind-nvim.enable = true;
          todo-comments.enable = true;
        };
        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false; # the theme looks terrible with catppuccin
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };
          smartcolumn = {
            enable = true;
            setupOpts.custom_colorcolumn = {
              # this is a freeform module, it's `buftype = int;` for configuring column position
              nix = "110";
              ruby = "120";
              java = "130";
              go = ["90" "130"];
            };
          };
          fastaction.enable = true;
        };
        comments = {
          comment-nvim = {
            enable = true;
          };
        };
        extraPlugins = with pkgs.vimPlugins; {
          vimtex = {
            package = vimtex;
            setup = ''vim.g.vimtex_view_method = "zathura"'';
          };
          img-clip = {package = img-clip-nvim;};
        };
      };
    };
  };
}
