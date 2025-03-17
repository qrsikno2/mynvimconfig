local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.keymap.set('n', '``', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>F', '<cmd>Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>f', '<cmd>Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd>BlameToggle<CR>', opts)

