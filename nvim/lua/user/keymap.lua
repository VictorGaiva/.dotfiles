local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }
-- Swtich up/down 
keymap('n', 'j', 'k', default_opts)
keymap('n', 'k', 'j', default_opts)

-- Find files by name
keymap('n', '<leader>P', ':Telescope find_files<CR>', default_opts)
-- Find files by content
keymap('n', '<leader>F', ':Telescope live_grep<CR>', default_opts)
keymap('n', '<leader>h', ':Telescope help_tags<CR>', default_opts)
-- Find files by from open buffers
keymap('n', '<C-f>', ':Telescope buffers<CR>', default_opts)


-- Find LS symbols
keymap('n', '<leader>f', ':Telescope lsp_document_symbols<CR>', default_opts)
-- List references to current symbol
keymap('n', '<leader>r', ':Telescope lsp_references<CR>', default_opts)
-- Signature help
-- keymap('n', '<leader>s', ':lua vim.lsp.buf.signature_help()<CR>', default_opts)


-- Next buffer
keymap('n', '<S-TAB>', ':bnext<CR>', default_opts)
-- Previous buffer
keymap('n', '<C-S-TAB>', ':bprevious<CR>', default_opts)

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- Bdelete
keymap("n", "<leader>q", ":Bdelete<CR>", default_opts)

-- See references
keymap("n", "<F11>", ":lua vim.lsp.buf.references()<CR>", default_opts)

-- Go to definition
keymap("n", "<F12>", ":lua vim.lsp.buf.definition()<CR>", default_opts)

-- Toggle NvimTree
keymap("n", "<C-B>", ":NvimTreeToggle<CR>", default_opts)
keymap("n", "<C-b>", ":NvimTreeFocus<CR>", default_opts)