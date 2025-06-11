local lspconfig = require('lspconfig')
local util = require 'lspconfig.util'

-- 设置键映射
-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- 不知道有什么问题所以注释了
-- vim.cmd('        autocmd CursorMoved  <buffer> lua vim.lsp.buf.document_highlight()')
-- vim.cmd('        autocmd CursorMovedI <buffer> lua vim.lsp.buf.document_highlight()')
-- vim.cmd('        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
-- 定义一个新的函数来在新标签页打开定义
-- 重新映射快捷键，比如将'gd'映射到新函数

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>"
	vim.notify("LSP on_attach called for buffer: " .. bufnr .. " with client: " .. client.name, vim.log.levels.INFO) -- 添加这行
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)


	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, noremap = true, silent = false }) -- vim.keymap.set('n', 'gd', "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, noremap = true, silent = false })
	vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

-- Configure each language
-- How to add LSP for a specific language?
-- 1. use `:Mason` to install corresponding LSP
-- 2. add configuration below

-- Do Not AutoInstall This Because a very low debain python version is provided.
-- lspconfig.pylsp.setup({
-- 	on_attach = on_attach,
-- })

lspconfig.lua_ls.setup({
	on_attach = on_attach,
})


lspconfig.gopls.setup({
	on_attach = on_attach,
})

local myclangd_capabilities = require('cmp_nvim_lsp').default_capabilities()
myclangd_capabilities.offsetEncoding = { "utf-8", "utf-16" } -- 解决 clangd 在 windows 下的 utf-16 编码问题
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = myclangd_capabilities,
	root_dir = function(fname)
		return util.root_pattern('compile_commands.json', '.git')(fname)
		or util.find_git_ancestor(fname)
		or vim.fn.getcwd()
	end,
	single_file_support = true,
	-- 初始化参数
	init_options = {
		compilationDatabaseDirectory = "",
		index = {
			threads = 32;
		},
		-- 需要读者定制化添加，有一些系统库并没有被 clang 默认索引
		-- 可通过 clang++ -v -E -x c++ - 查看默认的 include 路径
		clang = {
			extraArgs = {
				"-I/usr/include",
				"-I/usr/local/include",
				"-I/usr/include/c++/13",
			},
			resourceDir = ""
		}
	}
})

lspconfig.thriftls.setup({
	on_attach = on_attach,
	settings = {
		['rust-analyzer'] = {},
	},
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
})

lspconfig.zls.setup({
	on_attach = on_attach,
})
