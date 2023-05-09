local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- Colorscheme: https://github.com/marko-cerovac/material.nvim
-- use 'marko-cerovac/material.nvim'

use({ 'rose-pine/neovim', as = 'rose-pine' })
vim.cmd('colorscheme rose-pine')

use 'nvim-lua/plenary.nvim'
use 'ThePrimeagen/harpoon'

-- use 'neoclide/coc.nvim'
use 'tpope/vim-fugitive'

use 'airblade/vim-gitgutter'

use 'nvie/vim-flake8'

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

use('mbbill/undotree')

use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}


--
-- Put this at the end after all plugins
if packer_bootstrap then
require('packer').sync()
end
end)
