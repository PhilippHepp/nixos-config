{
  programs.nvf.settings.vim = {
    comments.comment-nvim.mappings = {
      toggleCurrentBlock = "gbc";
      toggleCurrentLine = "gcc";
    };

    lsp.mappings = {
      hover = "<S-f>";
    };

    autocomplete.nvim-cmp.mappings = {
      confirm = "<C-CR>";
    };

    tabline.nvimBufferline.mappings = {
      closeCurrent = "<S-q>";
      cycleNext = "<S-l>";
      cyclePrevious = "<S-h>";
      moveNext = "<C-S-l>";
      movePrevious = "<C-S-h>";
    };

    keymaps = [
      {
        key = "<leader>h";
        mode = "n";
        action = "<CMD>ClangdSwitchSourceHeader<CR>";
        desc = "Swap between source and header file";
      }
      {
        key = "<leader>n";
        mode = "n";
        action = "<CMD>noh<CR>";
        desc = "Stop highlighting search results";
      }
      {
        key = "<F5>";
        mode = "n";
        action = "<CMD>CMakeRun<CR>";
        desc = "Run CMake project";
      }
      {
        key = "<leader>lq";
        mode = "n";
        action = "<CMD>LspRestart<CR>";
        desc = "Restart LSP";
      }
    ];
  };
}
