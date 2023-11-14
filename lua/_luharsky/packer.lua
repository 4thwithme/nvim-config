vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use('wbthomason/packer.nvim');
	use("windwp/nvim-autopairs");
	use("folke/which-key.nvim");
	use('theprimeagen/harpoon');
	use('nvim-lua/plenary.nvim');
	use({ 'nvim-telescope/telescope.nvim', tag = '0.1.2' });
	use('akinsho/toggleterm.nvim');
	use('nvim-tree/nvim-web-devicons');
	use('folke/trouble.nvim');
	use('nvim-lualine/lualine.nvim');
	use('MunifTanjim/nui.nvim');
	use('folke/noice.nvim');
	use('nvim-telescope/telescope-file-browser.nvim');
	use({ 'kkharji/sqlite.lua', module = 'sqlite' });
	use('AckslD/nvim-neoclip.lua');
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' });
	use('debugloop/telescope-undo.nvim');
	use('jose-elias-alvarez/null-ls.nvim');
	use('prisma/vim-prisma');
	use('mg979/vim-visual-multi');
	use('sindrets/diffview.nvim');
	use('simrat39/rust-tools.nvim');
	use('mfussenegger/nvim-dap');
	use('wuelnerdotexe/vim-astro');
	use("startup-nvim/startup.nvim");
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	});
	use('lewis6991/gitsigns.nvim');
	use('github/copilot.vim');

	use("SmiteshP/nvim-navic");
	use("utilyre/barbecue.nvim")

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
			{ 'onsails/lspkind.nvim' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/vim-vsnip' },
			{ "hrsh7th/cmp-vsnip" },
			{ "simrat39/rust-tools.nvim" },
		}
	}

	use({
		"j-hui/fidget.nvim",
		config = function() require("fidget").setup() end
	})

	use('laytan/cloak.nvim');
	use('4thwithme/black.nvim');
end);
