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
          name = "File Or Find", -- optional group name
          f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, },
          g = { "<cmd>Telescope live_grep<cr>", "Search A Word In Project", noremap=false, },
        },
        t = {
          name = "tree",
          f = {"<cmd>NvimTreeFocus<cr>", "Focus Tree"},
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
          a = { "<cmd>TypescriptAddMissingImports<cr>", "Add Missing Imports"},
          c = { "<cmd>LspUI code_action<cr>", "Code Action", noremap = true, silent = true },
          n = { "<cmd>LspUI rename<cr>", "Rename", noremap = true, silent = true },
          f = { "<cmd>TypescriptFixAll<cr>", "Fix TypeScript" },
          r = { "<cmd>TypescriptRemoveUnused<cr>", "Remove Unused" },
          e = { "<cmd>TypescriptRenameFile<cr>", "Rename File" },
          g = { "<cmd>TypescriptGoToSourceDefinition<cr>", "Go To Source Definition" },
        },
        r = {
          name = "Runner",
          f = { "<cmd>RunFile<cr>", "Run File", noremap = true, silent = false },
        }
      },
      opts)
      wk.register({
        f = {
          name = "Find",
          a = { "<cmd>HopChar1<cr>", "Find Char AnyWhere", noremap = false },
        },
      })
      wk.register({
        ["<M-Right>"] = { "<cmd>tabnext<cr>", "Next Tab", noremap = false},
        ["<M-Left>"] = { "<cmd>tabprevious<cr>", "Previous Tab", noremap = false},
      })
    end,
  },
}
