return {
   {
      "nvim-lualine/lualine.nvim",
      name = "lualine",
      dependencies = {
         "nvim-tree/nvim-web-devicons"
      },
      config = function()
         require("lualine").setup({
            options = { theme = 'dracula' }
         })
      end,
   }
}
