return {
  -- auto pairs
  {
    -- https://github.com/echasnovski/mini.pairs
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_,opts)
      require("mini.pairs").setup(opts)
    end
  },
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
--           null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.code_actions.gitrebase,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.completion.luasnip,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.luacheck,
          null_ls.builtins.diagnostics.ruff,
          null_ls.builtins.formatting.rustfmt,
        }
      })
    end,
    dependencise = {
      "nvim-lua/plenary.nvim",
    }
  },
  {
    "kevinhwang91/nvim-bqf",
  },
  {
    "folke/todo-comments.nvim",
    dependencise = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
	require("todo-comments").setup()
    end,
  },
  {
    "danymat/neogen",
    dependencise = {
      "nvim-treesitter/nvim-treesitter",
      config = true
    },
  },
  {
    "kosayoda/nvim-lightbulb",
    dependencise = {
      "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = {
          enabled = true
        }
      })
    end,
  },
  {
    "ethanholz/nvim-lastplace",
  },
  {
    "tpope/vim-repeat",
  },
  {
    "tpope/vim-surround",
  },
  {
    "s1n7ax/nvim-search-and-replace",
    config = function()
	    require('nvim-search-and-replace').setup()
    end,
  },
}
