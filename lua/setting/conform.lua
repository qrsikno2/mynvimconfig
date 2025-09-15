vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

return {
	formatters_by_ft = {
		c = { "clang_format" },
		lua = { "stylua" },
	},
	formatters = {
		clang_format = {
			condition = function(ctx)
				return vim.fn.filereadable(vim.fn.findfile(".clang-format", vim.fn.getcwd() .. ";")) == 1
			end,
		},
	},
	format_on_save = function(bufnr)
		local disable_filetypes = { c = true, cpp = true, lua = true }
		return {
			timeout_ms = 500,
			lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		}
	end,
}
