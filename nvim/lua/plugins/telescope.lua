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
         { "<leader><leader>", "<cmd>Telescope oldfiles<cr>", desc = "Telescope oldfiles" },
		},
		config = function()
			require("telescope").setup({ })
		end,
	},
   {
      "nvim-telescope/telescope-ui-select.nvim"
   },
   config = function()
		require("telescope").setup {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown { }
				}
			}
		}
		require("telescope").load_extension("ui-select")
   end,
}
