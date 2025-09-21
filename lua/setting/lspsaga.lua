local rev = {}
rev.keymap = function(mapbuf)
	local opt = { noremap = true, silent = true }
	mapbuf("n", "<leader>r", ":Lspsaga rename<CR>", opt)
	mapbuf("n", "<leader>ca", ":Lspsaga code_action<CR>", opt)
	mapbuf("n", "gd", ":Lspsaga goto_definition<CR>", opt)
	mapbuf("n", "gk", ":Lspsaga hover_doc<CR>", opt)
	mapbuf("n", "gr", ":Lspsaga finder def+ref<CR>", opt)
	-- mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
end
require("lspsaga").setup({
	lightbulb = {
		enable = false,
	},
})
return rev
