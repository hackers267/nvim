return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
      local opts = {
        mode = "n",
        prefix = "<leader>"
      }
      wk.register({
        f = {
          name = "File Or Find", -- optional group name
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, },
          f = { "<cmd>Telescope find_files<cr>", "Find File", noremap=false, },
          g = { "<cmd>Telescope live_grep<cr>", "Search A Word In Project", noremap=false, },
        },
        t = {
          name = "tree",
          t = { "<cmd>NvimTreeOpen<cr>", "Open Tree", noremap=false, },
        },
        p = {
          name = "Preview",
          d = { function() require("goto-preview").goto_preview_definition() end, "Preview Definition"},
          t = { function() require("goto-preview").goto_preview_type_definition() end, "Preview Type Definition"},
          i = { function() require("goto-preview").goto_preview_implementation() end, "Preview Implementation"},
          P = { function() require("goto-preview").close_all_win() end, "Close Preview"},
          pr = { function() require("goto-preview").goto_preview_references() end, "Preview References"},
        },
        r = {
          name = "Runner",
          f = { "<cmd>RunFile<cr>", "Run File", noremap = true, silent = false },
        }
      },
      opts)
      wk.register({
        ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        ["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open Diagnostics" },
        ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
        ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        ["<leader>q"] = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Set Diagnostics" },
      })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          wk.register({
            ["gD"] = { vim.lsp.buf.declaration,"Goto Declaration",  },
            ["gd"] = { vim.lsp.buf.definition,"Goto Definition",  },
            ["K"] = { vim.lsp.buf.hover,"Goto Hover", opts },
            ["gi"] = { vim.lsp.buf.implementation,"Goto Implementation",  },
            ["<C-k>"] = { vim.lsp.buf.signature_help,"Goto Signature Help",  },
            ["<space>wa"] = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder",  },
            ["<space>wr"] = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder",  },
            ["<space>wl"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List Workspace Folders",  },
            ["<space>D"] = { vim.lsp.buf.type_definition, "Type Definition",  },
            ["<space>rn"] = { vim.lsp.buf.rename, "Rename",  },
            ["gr"] = { vim.lsp.buf.references, "References", opts },
          },{opts})
        end,
      })


    end,
  },
}
