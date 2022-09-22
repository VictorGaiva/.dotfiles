local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    -- Startup page
    use 'mhinz/vim-startify'
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Auto pairs for '(' '[' '{'
    use 'jiangmiao/auto-pairs'

    --  Nvim Tree
    use 'kyazdani42/nvim-tree.lua'

    -- Vim devicons

    -- Fuzzy finder
    use 'nvim-lua/plenary.nvim'
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0'}
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Buffer line
    use 'akinsho/nvim-bufferline.lua'

    --  Elixir 
    use 'elixir-editors/vim-elixir'

    --  Tabout
    use 'abecodes/tabout.nvim'

    -- Key description
    use 'folke/which-key.nvim'

    -- Syntax

    -- Status line
    use {'glepnir/galaxyline.nvim', branch = 'main'}

    --  Show git changes in file
    use 'lewis6991/gitsigns.nvim'

    --  LSP
    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use({'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons"})
    use({"glepnir/lspsaga.nvim", branch = "main"})

    -- Colors
    use 'folke/tokyonight.nvim'

    -- 
    use 'famiu/bufdelete.nvim'

    if packer_bootstrap then require('packer').sync() end
  end,
  config = {display = {open_fn = require('packer.util').float}}
})
