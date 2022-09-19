vim.cmd([[ 
  let g:mapleader = "\<Space>"
  let g:maplocalleader = ','
]])

require("user.settings")
require("user.plugins")

require("user.line-number")
require("user.completion")
-- require("user.project")

require("user.elixir")
require("user.line")
require("user.which-key")
require("user.bufferline")
require("user.copilot")
require("user.telescope")
require("user.nvim-tree")
require("user.git-signs")

require("user.keymap")

vim.cmd([[ 
  let g:vscode_style = "dark"
  colorscheme vscode

  setlocal formatprg=mix\ format\ -

]])

