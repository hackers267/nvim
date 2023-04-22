return {
  { "hrsh7th/cmp-nvim-lsp",
  dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    "neovim/nvim-lspconfig"
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    local servers = {'lua_ls','tsserver','cssls','eslint','rust_analyzer'}
    for _,lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        capabilities = capabilities,
      }
    end
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = {'vim','awesome'},
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          }
        },
      }
    }
   end,
   },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
}
