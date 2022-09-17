vim.cmd([[ 
  let g:mapleader = "\<Space>"
  let g:maplocalleader = ','
]])

require("user.settings")

require("user.plugins")

require("user.elixir")
require("user.line")
-- require("user.which-key")
require("user.bufferline")
require("user.copilot")
require("user.treesitter")
require("user.telescope")
require("user.nvim-tree")
require("user.line-number")
require("user.git-signs")

require("user.keymap")

vim.cmd([[ 
  let g:vscode_style = "dark"
  colorscheme vscode

  let g:startify_session_dir = '~/.config/nvim/session'
  setlocal formatprg=mix\ format\ -
]])

