-- Packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

local packer = require("packer")
packer.init({
	git = {
		clone_timeout = 600,
	},
})
return packer.startup({
	function()
		-- Themes
		use("https://git.sr.ht/~leon_plickat/paige")
		use({ "NLKNguyen/papercolor-theme" })
		use("shaunsingh/solarized.nvim")
		use("shaunsingh/nord.nvim")
		use({ "dracula/vim", as = "dracula" })
		use({
			"xiyaowong/nvim-transparent",
		})
		use("folke/tokyonight.nvim")
		use("Shatur/neovim-ayu")
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		use({
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use("tiagofumo/vim-nerdtree-syntax-highlight")

		-- Utils
		use({
			"akinsho/bufferline.nvim",
		})
		use({
			"VonHeikemen/searchbox.nvim",
			requires = {
				{ "MunifTanjim/nui.nvim" },
			},
		})

		-- Beta plugins
		use("nathom/filetype.nvim")
		use("ldelossa/calltree.nvim")
		use("lewis6991/impatient.nvim")
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use({ "mg979/vim-visual-multi", branch = "master" })
		use({
			"iamcco/markdown-preview.nvim",
			ft = { "markdown", "m" },
			run = "cd app && yarn install",
			cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
		})
		use({
			"wfxr/minimap.vim",
			run = "cargo install --locked code-minimap",
		})
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-vsnip",
				"hrsh7th/vim-vsnip",
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				"hrsh7th/cmp-calc",
				"lukas-reineke/cmp-rg",
				"saadparwaiz1/cmp_luasnip",
				{ "quangnguyen30192/cmp-nvim-ultisnips", requires = "SirVer/UltiSnips" },
			},
		})
		use("nvim-lua/lsp-status.nvim")
		use({
			"andweeb/presence.nvim",
		})
		use("kristijanhusak/orgmode.nvim")
		use({
			"AckslD/nvim-whichkey-setup.lua",
			requires = { "liuchengxu/vim-which-key" },
		})
		use({ "norcalli/nvim-colorizer.lua", config = [[require'colorizer'.setup()]] })
		use("preservim/nerdcommenter")
		use({ "tpope/vim-fugitive", branch = "master" })
		use("junegunn/vim-easy-align")
		use({ "glepnir/dashboard-nvim" })
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		})
		use({ "karb94/neoscroll.nvim", config = [[require('neoscroll').setup()]] })

		use({
			"jpalardy/vim-slime",
			branch = "main",
			config = [[require("core.plugins.vim-slime")]],
		})

		-- LSP and syntax highlighting
		-- Because if you are running MS Windows, these plugins won't work :D most of the time
		if vim.fn.getenv("HOME") ~= vim.NIL then
			use({
				"nvim-treesitter/nvim-treesitter",
				config = [[require('core.plugins.treesitter')]],
				run = ":TSUpdate",
			})
			use({ "nvim-treesitter/playground" })
			use({
				"ttys3/nvim-blamer.lua",
			})
		end

		-- Language Server Protocol Plugins --
		use({ "neovim/nvim-lspconfig", branch = "master" })
		use({ "tami5/lspsaga.nvim", branch = "main" })
		use({
			"folke/lsp-trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use("ziglang/zig.vim")
		use("onsails/lspkind-nvim")
		use("kosayoda/nvim-lightbulb")

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})