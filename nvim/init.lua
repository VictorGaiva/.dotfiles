vim.cmd([[ 
  let g:mapleader = "\<Space>"
  let g:maplocalleader = ','
]])

require("user.plugins")
require("user.settings")
require("user.which-key")

require("user.line-number")
require("user.completion")
-- require("user.project")

require("user.elixir")
require("user.line")
require("user.bufferline")
require("user.copilot")
require("user.telescope")
require("user.nvim-tree")
require("user.git-signs")

require("user.keymap")
require("user.lspsaga")
require("user.trouble")
require("user.luasnip")

require("user.theme")
