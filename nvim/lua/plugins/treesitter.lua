-- Plugin treesitter
return {
	{ 
		"nvim-treesitter/nvim-treesitter",
		name = "treesitter",
		priority = 1000,
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		keys = {
		},
		config = function()
			require("treesitter").setup({ 
				ensure_installed = { "lua", "vim", "vimdoc", "perl", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
         })
		end,
	}
}