call plug#begin()
    Plug 'windwp/nvim-autopairs'
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'tami5/lspsaga.nvim'
    Plug 'folke/lsp-colors.nvim'
    "
    Plug 'hrsh7th/nvim-cmp' "/* Completion plugin */
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    "
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'

    " LaTeX
    Plug 'lervag/vimtex'

    " Theming
    Plug 'navarasu/onedark.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "
    Plug 'nvim-lualine/lualine.nvim' "/* Status line */
    Plug 'kristijanhusak/defx-git'
    Plug 'kristijanhusak/defx-icons'
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'kyazdani42/nvim-web-devicons'

    " etc
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    "
    Plug 'andweeb/presence.nvim'
call plug#end()
