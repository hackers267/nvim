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
        prefix = "<leader>",
        silent = true,
        noremap = true,
        nowait = true,
      }
      wk.register({
          b = {
            name = "Buffers",
            b = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer", noremap = true, silent = false },
            D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort By Directory", noremap = true, silent = false },
            e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to clonse", noremap = true, silent = false },
            f = { "<cmd>Telescope buffers previewer=false<cr>", "Find Buffer", noremap = true, silent = false },
            h = { "<cmd>BufferLineCloseLeft<cr>", "Close Left Buffer", noremap = true, silent = false },
            l = { "<cmd>BufferLineCloseRight<cr>", "Close Right Buffer", noremap = true, silent = false },
            L = { "<cmd>BufferLineSortByExtension<cr>", "Sort By Extension", noremap = true, silent = false },
            j = { "<cmd>BufferLinePick<cr>", "Pick Buffer", noremap = true, silent = false },
            n = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer", noremap = true, silent = false },
            W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)", noremap = true, silent = false },
          },
          f = {
            name = "File Or Find", -- optional group name
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, },
            f = { "<cmd>Telescope find_files<cr>", "Find File", noremap = false, },
            g = { "<cmd>Telescope live_grep<cr>", "Search A Word In Project", noremap = false, },
          },
          g = {
            name = "Git",
            b = { "<cmd>Telescope git_branches<cr>", "Checkout Branch", noremap = false, },
            c = { "<cmd>Telescope git_commits<cr>", "Checkout Commit", noremap = false, },
            C = { "<cmd>Telescope git_bcommits<cr>", "Checkout Commit", noremap = false, },
            d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", noremap = false, },
            g = { "<cmd>Gitui<cr>", "Gitui", noremap = false, },
            j = {
              "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
              "Next Hunk",
              noremap = false,
            },
            k = {
              "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
              "Prev Hunk",
              noremap = false,
            },
            l = { "<cmd>GitBlameToggle<cr>", "Blame", noremap = false, },
            o = { "<cmd>Telescope git_status<cr>", "Open changed file", noremap = false, },
            p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk", noremap = false, },
            r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk", noremap = false, },
            R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer", noremap = false, },
            s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk", noremap = false, },
            u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", noremap = false, },
          },
          l = {
            name = "LSP",
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", noremap = false, },
            d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics", noremap = false, },
            e = { "<cmd>Telescope quickfix<cr>", "Quickfix", noremap = false, },
            i = { "<cmd>LspInfo<cr>", "Info", noremap = false, },
            I = { "<cmd>MasonInfo<cr>", "Mason Info", noremap = false, },
            l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action", noremap = false, },
            q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix", noremap = false, },
            r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename", noremap = false, },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols", noremap = false, },
            S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", noremap = false, },
            w = { "<cmd>Telescope Diagnostics<cr>", "Diagnostics", noremap = false, },
          },
          s = {
            name = "Search",
            b = { "<cmd>Telescope git_branches<cr>", "Checkout Branch", noremap = false, },
            c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme", noremap = false, },
            C = { "<cmd>Telescope commands<cr>", "Commands", noremap = false, },
            f = { "<cmd>Telescope find_files<cr>", "Find File", noremap = false, },
            h = { "<cmd>Telescope help_tags<cr>", "Find Help", noremap = false, },
            H = { "<cmd>Telescope highlights<cr>", "Find Highlights", noremap = false, },
            k = { "<cmd>Telescope keymaps<cr>", "Keymaps", noremap = false, },
            M = { "<cmd>Telescope man_pages<cr>", "Man Pages", noremap = false, },
            l = { "<cmd>Telescope resume<cr>", "Resume Last Search", noremap = false, },
            p = {
              "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
              "Colorscheme With Preview",
              noremap = false,
            },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, },
            R = { "<cmd>Telescope registers<cr>", "Registers", noremap = false, },
            t = { "<cmd>Telescope live_grep<cr>", "Text", noremap = false, },
          },
          t = { "<cmd>NvimTreeOpen<cr>", "Open Tree", noremap = false, },
          e = { "<cmd>NvimTreeToggle<cr>", "Toggle Tree", noremap = false, },
          w = { "<cmd>w!<cr>", "Save", noremap = false, },
          q = { "<cmd>confirm q<cr>", "Quit", noremap = false, },
          x = { "<cmd>wq<cr>", "Save And Quit", noremap = false, },
          p = {
            name = "Preview",
            d = { function() require("goto-preview").goto_preview_definition() end, "Preview Definition" },
            t = { function() require("goto-preview").goto_preview_type_definition() end, "Preview Type Definition" },
            i = { function() require("goto-preview").goto_preview_implementation() end, "Preview Implementation" },
            P = { function() require("goto-preview").close_all_win() end, "Close Preview" },
            pr = { function() require("goto-preview").goto_preview_references() end, "Preview References" },
          },
          r = {
            name = "Runner",
            f = { "<cmd>RunFile<cr>", "Run File", noremap = true, silent = false },
          },
          c = { "<cmd>BufferKill<cr>", "Close Buffer", noremap = true, silent = false },
        },
        opts)
      wk.register({
        ["F2"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
        ["S+F2"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
      })

      -- Use Hop
      wk.register({
        f = { "<cmd>HopChar1AC<cr>", "Hop Char 1 After Cursor" },
        F = { "<cmd>HopChar1BC<cr>", "Hop Char 1 Before Cursor" },
        w = { "<cmd>HopWord<cr>", "Hop Word" },
        ["^"] = { "<cmd>HopLineStart<cr>", "Hop Line Start" },
        ["$"] = { "<cmd>HopLineEnd<cr>", "Hop Line End" },
        ["0"] = { "<cmd>HopLine<cr>", "Hop Line" },
      })
      wk.register({
        ["<M-1>"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "Toggle Horizontal Term" },
        ["<M-2>"] = { "<cmd>ToggleTerm direction=vertical<cr>", "Toggle vertical Term" },
        ["<M-3>"] = { "<cmd>ToggleTerm direction=float<cr>", "Toggle Float Term" },
        ["<M-4>"] = { "<cmd>ToggleTerm direction=tab<cr>", "Toggle Tab Term" },
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
            ["gD"] = { vim.lsp.buf.declaration, "Goto Declaration", },
            ["gd"] = { vim.lsp.buf.definition, "Goto Definition", },
            ["K"] = { vim.lsp.buf.hover, "Goto Hover", opts },
            ["gi"] = { vim.lsp.buf.implementation, "Goto Implementation", },
            ["<C-k>"] = { vim.lsp.buf.signature_help, "Goto Signature Help", },
            ["<space>wa"] = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder", },
            ["<space>wr"] = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder", },
            ["<space>wl"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
              "List Workspace Folders", },
            ["<space>D"] = { vim.lsp.buf.type_definition, "Type Definition", },
            ["<space>rn"] = { vim.lsp.buf.rename, "Rename", },
            ["gr"] = { vim.lsp.buf.references, "References", opts },
          }, { opts })
        end,
      })
    end,
  },
}
