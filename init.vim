source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

colorscheme codedark
let g:airline_theme = 'codedark'

" Fuzzy finder screen
" let g:fzf_preview_window = ['left:40%', 'ctrl-/']

let g:startify_session_dir = '~/.config/nvim/session'
setlocal formatprg=mix\ format\ -
:set tabstop=2
