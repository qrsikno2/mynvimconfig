local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.keymap.set('n', '``', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<c-S-f>', '<cmd>Telescope find_files<CR>', opts)
vim.keymap.set('n', '<c-f>', '<cmd>Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<c-b>', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>t', '<cmd>Telescope<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd>BlameToggle<CR>', opts)
vim.keymap.set('n', '`e', '<cmd>CopilotChatExplain<CR>', opts)
vim.keymap.set('v', '`e', '<cmd>\'<,\'>CopilotChatExplain<CR>', opts)


