return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      close_on_exit = true,
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal"
        }
      },
      hide_numbers = true,
      insert_mappings = true,
      persist_size = false,
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      start_in_insert = true,
      shade_terminal = true,
      open_mapping = "<c-\\>"
    })
  end,
}
