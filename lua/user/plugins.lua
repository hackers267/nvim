local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTART = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
   autocmd!
    autocmd BufWritePost plugins.lua source <afile> PackerSync
  augroup end
]]

-- Use a protected call so wh don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
  }
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "lewis6991/impatient.nvim" -- Speed up loading Lua modules
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  -- LSP
  use "neovim/nvim-lspconfig" --enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

use {
    "kyazdani42/nvim-tree.lua",
    commit = "6abc87b1d92fc8223f1e374728ea45c848bfdf6d"
  } -- file explore
  -- Themes
  use {
    "projekt0n/github-nvim-theme",
    tag = "v0.0.4",
  }
  use {
    "catppuccin/nvim",
    commit="6df82e66a50cfefcc0e8af05bfc3411dc2d7a368"
  }
end)
