" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    " Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Elixir misc
    Plug 'elixir-editors/vim-elixir'
    " Autocomplete elixir
    Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

    " NERDTree
    " Plug 'preservim/nerdtree'
    " Vim devicons
    Plug 'ryanoasis/vim-devicons'
    " Git Plugin
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Startup page
    Plug 'mhinz/vim-startify'
    " VSCode Theme
    Plug 'tomasiser/vim-code-dark'
    " jparise/vim-graphql
    Plug 'jparise/vim-graphql'
    " Fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Key description
    Plug 'liuchengxu/vim-which-key'

call plug#end()
