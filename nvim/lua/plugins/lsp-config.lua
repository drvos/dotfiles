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
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ansiblels" }
         })
      end,
   },
   {
      "neovim/nvim-lspconfig",
      name = "nvim-lspconfig",
      config = function()
         local lspconfig = require("lspconfig")
         lspconfig.lua_ls.setup({})
         lspconfig.ansiblels.setup({})
         lspconfig.perlpls.setup({})

         vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
         vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
         vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
      end,
   }
}
