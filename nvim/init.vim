source ~/.dotfiles/nvim/vim-plug/plugins.vim
source ~/.dotfiles/nvim/general/settings.vim
source ~/.dotfiles/nvim/keys/mappings.vim
source ~/.dotfiles/nvim/keys/which-key.vim

luafile ~/.dotfiles/nvim/lua/elixir.lua
luafile ~/.dotfiles/nvim/lua/line.lua

let g:vscode_style = "dark"
colorscheme vscode

" Fuzzy finder screen
" let g:fzf_preview_window = ['left:40%', 'ctrl-/']
"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

let g:startify_session_dir = '~/.config/nvim/session'
setlocal formatprg=mix\ format\ -
