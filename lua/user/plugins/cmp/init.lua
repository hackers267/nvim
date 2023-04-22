local rust = require("user.plugins.cmp.rust_cmp")

return {
  { "hrsh7th/cmp-path" },
  { "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
          ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,{'i','s'}),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,{'i','s'}),
        }),
        window = {},
        sources = cmp.config.sources({
	        { name = "nvim_lsp" },
	        { name = "luasnip" },
	        { name = "path" },
	        { name = "crates" },
          { name = "nvim_lsp_signature_help" },
        },
        {
          { name = "buffer" }
        })
      }
    end,
  },
  { "hrsh7th/cmp-buffer",
    config = function()
      local cmp = require('cmp')
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer"}
        }
      })
    end,
  },
  { "hrsh7th/cmp-nvim-lua" },
  rust,
}
