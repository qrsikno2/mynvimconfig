local sagasetting = require("setting.lspsaga")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	vim.notify("LSP on_attach called for buffer: " .. bufnr .. " with client: " .. client.name, vim.log.levels.INFO)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local function buf_set_keymap(...)
		vim.keymap.set(...)
	end
	sagasetting.keymap(buf_set_keymap)

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
end

local myclangd_capabilities = require("cmp_nvim_lsp").default_capabilities()
myclangd_capabilities.offsetEncoding = { "utf-8", "utf-16" }

-- Lua
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
})
vim.lsp.enable("lua_ls")

-- Go
vim.lsp.config("gopls", {
	on_attach = on_attach,
})
vim.lsp.enable("gopls")

-- Clangd (关键修改)
vim.lsp.config("clangd", {
	on_attach = on_attach,
	capabilities = myclangd_capabilities,
	root_dir = function(fname)
		-- 使用 vim.fs.root 替代 util.root_pattern
		local root = vim.fs.root(fname, { "compile_commands.json", ".git" })
		return root ~= "" and root or vim.fn.getcwd()
	end,
	-- 移除 single_file_support，新版默认支持单文件
	initialization_options = { -- 改用标准字段名
		compilationDatabaseDirectory = "",
		index = { threads = 32 },
		clang = {
			extraArgs = {
				"-I/usr/include",
				"-I/usr/local/include",
				"-I/usr/include/c++/13",
			},
			resourceDir = "",
		},
	},
})
vim.lsp.enable("clangd")

-- Thrift
vim.lsp.config("thriftls", {
	on_attach = on_attach,
	settings = {
		["thriftls"] = {}, -- 修正错误的配置键 (原写成了 rust-analyzer)
	},
})
vim.lsp.enable("thriftls")

-- Rust
vim.lsp.config("rust_analyzer", {
	on_attach = on_attach,
})
vim.lsp.enable("rust_analyzer")

-- Zig
vim.lsp.config("zls", {
	on_attach = on_attach,
})
vim.lsp.enable("zls")

vim.lsp.config("pyright", {
	on_attach = on_attach,
})
vim.lsp.enable("pyright")
