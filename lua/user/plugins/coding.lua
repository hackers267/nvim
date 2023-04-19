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
          null_ls.builtins.code_actions.gitsigns,
        }
      })
    end,
    dependencise = {
      "nvim-lua/plenary.nvim",
    }
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end,
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
  }
}
