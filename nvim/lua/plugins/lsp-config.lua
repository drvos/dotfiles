return {
   {
      "williamboman/mason.nvim",
      name = "mason",
      config = function()
         require("mason").setup()
      end,
   },
   {
      "williamboman/mason-lspconfig.nvim",
      name = "mason-lspconfig",
      lazy = false,
      opts = {
         auto_install = true
      }
   },
   {
      "neovim/nvim-lspconfig",
      name = "nvim-lspconfig",
      config = function()
         local lspconfig = require("lspconfig")
         lspconfig.lua_ls.setup({})
         lspconfig.perlpls.setup({})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      end,
   }
}
