return {
   {
      "kevinhwang91/nvim-ufo",
      name = "ufo",
      dependencies = {
         "kevinhwang91/promise-async"
      },
      config = function()
         vim.o.foldcolumn = '0'
         vim.o.foldlevel = 20
         vim.o.foldlevelstart = 99
         vim.o.foldenable = true

			vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
			vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
			vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
			vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)
			vim.keymap.set('n', 'zK', function()
				local winid = require('ufo').peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
         end, { desc = "Peek Fold" })

         require("ufo").setup({
				preview = {
					win_config = {
						border = {'', '─', '', '', '', '─', '', ''},
						winhighlight = 'Normal:Folded',
						winblend = 0
					},
					mappings = {
						scrollU = '<C-u>',
						scrollD = '<C-d>'
					}
				},
            provider_selector = function(bufnr, filetype, buftype)
               return {'lsp', 'indent'}
            end
         })
      end,
   }
}
