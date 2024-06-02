return {
	{ 
		"nvim-telescope/telescope.nvim", 
		name = "telescope",
		priority = 1000,
      branch = '0.1.x',
		dependencies = { 
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>p", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
			{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
			{ "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
		},
		config = function()
			require("telescope").setup({ })
		end,
	}
}
