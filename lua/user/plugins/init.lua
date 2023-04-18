return {
    {
        "williamboman/mason.nvim",
        -- build = ":MasonUpdate",
	config = function()
	 require("mason").setup()
	end
    },
    {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
	  "neovim/nvim-lspconfig"
	},
	config = function()
	  require("mason-lspconfig").setup()
	end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
          require("nvim-treesitter.install").update({with_sync = true})
        end,
    }
}
