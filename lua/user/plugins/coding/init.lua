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
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencise = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require('null-ls')
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
          sources = {
            null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.code_actions.gitrebase,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.completion.luasnip,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.luacheck,
          null_ls.builtins.diagnostics.ruff,
          null_ls.builtins.formatting.lua_format,
          null_ls.builtins.formatting.mdformat,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.eslint_d,
          null_ls.builtins.formatting.rustfmt.with({
            extra_args = { "--edition=2021" }
          }),
        },
        on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            vim.lsp.buf.format({ bufnr = bufnr })
                            -- vim.lsp.buf.formatting_sync()
                        end,
                    })
                end
            end,
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
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
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
  {
    "MunifTanjim/prettier.nvim",
    config = function()
      require("prettier").setup()
    end,
  }
}
