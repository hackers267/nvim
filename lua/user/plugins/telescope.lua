return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('telescope').load_extension("refactoring")
  end
}
