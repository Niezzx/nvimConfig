local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window(弹窗模式)
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Dependencies
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("nvim-lua/popup.nvim")
	use("lewis6991/impatient.nvim") -- speed up loading Lua modules
	use("kyazdani42/nvim-web-devicons") -- Use for file icons
	use("kkharji/sqlite.lua") -- handle databases

	-- Essential plugins
	use("tpope/vim-surround")
	use("inkarkat/vim-ReplaceWithRegister")

	-- Statusline
	use("nvim-lualine/lualine.nvim")

	-- indentline
	use("lukas-reineke/indent-blankline.nvim")

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	--  maximizes and restores current window
	use("szw/vim-maximizer")

	-- highlight colors
	use("brenoprata10/nvim-highlight-colors")

	-- toggle terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- ColorSchemes
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("navarasu/onedark.nvim")

	-- bufferline
	use({ "akinsho/bufferline.nvim", tag = "v3.*" })
	use("moll/vim-bbye")

	-- Command line
	use("gelguy/wilder.nvim")
	use("romgrk/fzy-lua-native")

	-- Autopair
	use("windwp/nvim-autopairs")

	-- Autoclose
	use("windwp/nvim-ts-autotag")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Comment
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("folke/todo-comments.nvim")

	-- Nvim-tree
	use({ "nvim-tree/nvim-tree.lua", tag = "nightly" }) -- tag = 'nightly' -- optional, updated every week.

	-- Telescope & Fuzzy finding w
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use("nvim-telescope/telescope-ui-select.nvim") -- for showing lsp code actions
	use("nvim-telescope/telescope-media-files.nvim") -- preview images,pdf ..
	use("nvim-telescope/telescope-frecency.nvim") -- telescope frecency sort
	use("sudormrfbin/cheatsheet.nvim") -- cheatsheet
	use("ahmedkhalf/project.nvim") -- project

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- Treesitter plugins
	use("p00f/nvim-ts-rainbow")

	-- LSP & CMP & Snippets
	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- easily install and manage language servers
	use("williamboman/mason-lspconfig.nvim")
	-- CMP
	use("hrsh7th/nvim-cmp") -- A completion engine
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	-- Formatting
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and line

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
