source ~/.dotfiles/nvim/vim-plug/plugins.vim
source ~/.dotfiles/nvim/general/settings.vim
source ~/.dotfiles/nvim/keys/mappings.vim

luafile ~/.dotfiles/nvim/lua/elixir.lua
luafile ~/.dotfiles/nvim/lua/line.lua

let g:vscode_style = "dark"
colorscheme vscode

" Fuzzy finder screen
" let g:fzf_preview_window = ['left:40%', 'ctrl-/']
"

autocmd StdinReadPre * let s:std_in=1

let g:startify_session_dir = '~/.config/nvim/session'
setlocal formatprg=mix\ format\ -


" Nerdtree
" Auto close nerdtree if no files are open
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
