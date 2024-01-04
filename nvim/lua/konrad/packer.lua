-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  use('tanvirtin/monokai.nvim')
  use('nvim-treesitter/playground')
  use('thePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('beauwilliams/statusline.lua')
  use {'JoosepAlviste/nvim-ts-context-commentstring'}
  use {'hrsh7th/nvim-cmp'}
  use({
      'nvim-treesitter/nvim-treesitter',
      requires = 'nvim-treesitter/playground',
      config = function()
          require('nvim-treesitter.configs').setup({
              ensure_installed = "all", -- Or list specific languages
              highlight = {
                  enable = true,             -- false will disable the whole extension
              },
              context_commentstring = {
                  config = {
                      javascript = {
                          __default = '// %s',
                          jsx_element = '{/* %s */}',
                          jsx_fragment = '{/* %s */}',
                          jsx_attribute = '// %s',
                          comment = '// %s',
                      },
                      typescript = { __default = '// %s', __multiline = '/* %s */' },
                  },
              },
          })
      end
  }, {
      run = ':TSUpdate'
  })

  use({
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup({
              pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
          })
      end
  })


  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  use({
	  "roobert/tailwindcss-colorizer-cmp.nvim",
	  -- optionally, override the default options:
	  config = function()
		  require("tailwindcss-colorizer-cmp").setup({
			  color_square_width = 2,
		  })
	  end
  })
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  use({
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	})


end)
