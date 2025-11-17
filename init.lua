if vim.g.vscode then
	require("vsvim.init")
else
	vim.cmd("source ~/.config/nvim/initTerm.vim")
end
