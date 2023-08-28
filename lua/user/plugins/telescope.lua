return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'neovim/nvim-lspconfig',
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup {}
    telescope.load_extension("refactoring")
    telescope.load_extension("projects")
  end
}
