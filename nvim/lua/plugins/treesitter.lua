return {
	{
		"nvim-treesitter/nvim-treesitter",
		name = "nvim-treesitter",
		priority = 1000,
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		keys = {
		},
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = { "lua", "vim", "vimdoc", "perl", "pod", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
         })
		end,
	}
}
