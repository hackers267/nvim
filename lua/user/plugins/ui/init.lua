local glow = require("user.plugins.ui.glow")
local bufferline = require("user.plugins.ui.bufferline")
local popup = require("user.plugins.ui.popup")
local project = require("user.plugins.ui.project")
local blankline = require("user.plugins.ui.blankline")

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('lualine').setup({
        sections = {
          lualine_x = {
            "codeium#GetStatusString",
            "encoding",
            "fileformat",
            "filetype",
          }
        }
      })
    end,
  },
  {
    'startup-nvim/startup.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local startup = require('startup')
      startup.setup({
        theme = "china",
      })
    end,
  },
  {
    'jinzhongjia/LspUI.nvim',
    event = "VeryLazy",
    config = function()
      require('LspUI').setup()
    end,
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup()
    end,
  },
  glow,
  blankline,
  bufferline,
  popup,
  project,
}
