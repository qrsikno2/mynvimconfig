-- local color_scheme = "catppuccin"
-- local color_scheme = "gruvbox"
-- local color_scheme = "codeschool"
local color_scheme = "hybrid"
local default_colo = "default"

vim.cmd('set termguicolors')

local ok, _ = pcall(vim.cmd, "colorscheme " .. color_scheme)

if not ok then
	vim.notify("colorscheme " .. color_scheme .. " do not exist! now use "..string.upper(default_colo))

	pcall(vim.cmd, "colorscheme " .. default_colo)
end


