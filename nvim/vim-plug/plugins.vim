" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Startup page
    Plug 'mhinz/vim-startify'

    " File Explorer
    " Plug 'scrooloose/NERDTree'
    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " NERDTree
    " Plug 'preservim/nerdtree'

    " Git Plugin
    " Plug 'Xuyuanp/nerdtree-git-plugin'

    " Vim devicons
    Plug 'ryanoasis/vim-devicons'
    
    " Fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Key description
    Plug 'liuchengxu/vim-which-key'

    "
    Plug 'neovim/nvim-lspconfig'
    
    " Syntax
    Plug 'Mofiqul/vscode.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Status line
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}


call plug#end()
