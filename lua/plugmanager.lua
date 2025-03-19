require('packer').startup(function(use)
	use('wbthomason/packer.nvim')

	use('flazz/vim-colorschemes')

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"

	use 'hrsh7th/nvim-cmp'
	use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
	use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer auto-completion
	use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path auto-completion
	use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline auto-completion
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use 'jiangmiao/auto-pairs'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use {
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require('blame').setup {}
		end,
		opts = {
			blame_options = { '-w' },
		},
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}
	use {
		'lewis6991/gitsigns.nvim'
	}
	use {
		'ray-x/lsp_signature.nvim'
	}

	 -- use {
	 -- 	'RRethy/vim-illuminate'
	 -- }

	use {
		"AbdelrahmanDwedar/awesome-nvim-colorschemes"
	}
	use {
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/neotest-go",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		}
	}

	-- use 'pteroctopus/faster.nvim'

	use {
		'rachartier/tiny-inline-diagnostic.nvim',
	}
	use {
		'github/copilot.vim'
	}

	use {
		'nvimdev/lspsaga.nvim',
	}

end)

