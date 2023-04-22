return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
      local opts = {
        prefix = "<leader>"
      }
      wk.register({
        f = {
          name = "file", -- optional group name
          f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, },
          n = { "New File" }, -- just a label. don't create any mapping
          e = "Edit File", -- same as above
          b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
        },
        t = {
          name = "tree",
          e = {"<cmd>NvimTreeToggle<cr>", "Toggle Tree"},
          o = {"<cmd>NvimTreeOpen<cr>", "Open Tree"},
          c = {"<cmd>NvimTreeClose<cr>", "Close Tree"},
        },
        p = {
          name = "Preview",
          d = { function() require("goto-preview").goto_preview_definition() end, "Preview Definition"},
          t = { function() require("goto-preview").goto_preview_type_definition() end, "Preview Type Definition"},
          i = { function() require("goto-preview").goto_preview_implementation() end, "Preview Implementation"},
          P = { function() require("goto-preview").close_all_win() end, "Close Preview"},
          pr = { function() require("goto-preview").goto_preview_references() end, "Preview References"},
        },
        a = {
          name = "Action",
        },
        r = {
          name = "Runner",
          f = { "<cmd>RunFile<cr>", "Run File", noremap = true, silent = false },
        }
      },
      opts)
    end,
  },
}
