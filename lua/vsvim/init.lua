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
