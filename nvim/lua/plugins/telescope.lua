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
			{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
			{ "<C-b>", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
			{ "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
		},
		config = function()
			require("telescope").setup({ })
		end,
	}
}
