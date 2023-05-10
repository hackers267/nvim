return {
  {'tanvirtin/vgit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('vgit').setup()
    end,
  },
  {'TimUntersberger/neogit',
  dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('neogit').setup()
    end,
  },
  {'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('gitsigns').setup()
    end,
  },
  { 'aspeddro/gitui.nvim',
    config = function()
      require('gitui').setup()
    end,
  },
}
