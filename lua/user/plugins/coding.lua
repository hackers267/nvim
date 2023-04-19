return {
  -- auto pairs
  {
    -- https://github.com/echasnovski/mini.pairs
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_,opts)
      require("mini.pairs").setup(opts)
    end
  },
  {
    "nvim-lua/plenary.nvim"
  },
}
