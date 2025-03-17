require('mason').setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

require('mason-lspconfig').setup({
	ensure_installed = {'gopls', 'lua_ls', 'clangd', 'thriftls', 'vimls', 'zls'}
})

