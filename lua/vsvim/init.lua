local vscode = require("vscode")
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cindent = true
vim.opt.ruler = true
vim.opt.backspace = { "indent", "eol", "start" }
-- use Ctrl-hjkl to move 6* in any mode(normal, insert, visual)
vim.keymap.set("n", "<C-h>", "6h", opts)
vim.keymap.set("n", "<C-j>", "6j", opts)
vim.keymap.set("n", "<C-k>", "6k", opts)
vim.keymap.set("n", "<C-l>", "6l", opts)
vim.keymap.set("n", "H", "0", opts)
vim.keymap.set("n", "L", "$", opts)
vim.keymap.set("n", "J", "<C-d>", opts)
vim.keymap.set("n", "K", "<C-u>", opts)

vim.keymap.set("v", "<C-h>", "6h", opts)
vim.keymap.set("v", "<C-j>", "6j", opts)
vim.keymap.set("v", "<C-k>", "6k", opts)
vim.keymap.set("v", "<C-l>", "6l", opts)
vim.keymap.set("v", "H", "0", opts)
vim.keymap.set("v", "L", "$", opts)
vim.keymap.set("v", "J", "<C-d>", opts)
vim.keymap.set("v", "K", "<C-u>", opts)

vim.keymap.set("n", "<space><space>", "<C-w><C-w>", opts)

vim.keymap.set("n", "<space>e", function()
	-- 在VSCode中，显示当前行的诊断信息，通常使用命令`editor.action.showHover`，但它会显示所有信息，包括类型信息等。
	-- 但是，VSCode没有单独显示诊断的命令。我们可以使用以下方式：
	-- 先将光标移动到诊断信息上，然后触发悬停。但这样不够直接。
	-- 另一种方式是打开问题面板，但这不是悬浮窗口。
	-- 所以，这里我们可能需要调整：在VSCode中，通常按Ctrl+`（反引号）会显示当前行的错误，但这是VSCode的默认行为。
	-- 由于VSCode的LSP集成方式不同，我们可能需要使用VSCode的命令。
	vscode.action("editor.action.showHover")
end, { noremap = true, silent = true })

-- 跳转上一个/下一个诊断
vim.keymap.set("n", "[d", function()
	vscode.action("editor.action.marker.prevInFiles")
end, { noremap = true, silent = true })
vim.keymap.set("n", "]d", function()
	vscode.action("editor.action.marker.nextInFiles")
end, { noremap = true, silent = true })

-- 打开问题面板（相当于setloclist）
vim.keymap.set("n", "<space>q", function()
	vscode.action("workbench.panel.markers.view.focus")
end, { noremap = true, silent = true })

-- LSP通用命令
vim.keymap.set("n", "gD", function()
	vscode.action("editor.action.revealDefinition")
end, { noremap = true, silent = true })

vim.keymap.set("n", "gi", function()
	vscode.action("editor.action.goToImplementation")
end, { noremap = true, silent = true })

vim.keymap.set("n", "gs", function()
	vscode.action("editor.action.triggerParameterHints")
end, { noremap = true, silent = true })

-- 类型定义
vim.keymap.set("n", "<space>D", function()
	vscode.action("editor.action.goToTypeDefinition")
end, { noremap = true, silent = true })

-- for gr gotoReferences
vim.keymap.set("n", "gr", function()
	vscode.action("editor.action.goToReferences")
end, { noremap = true, silent = true })
