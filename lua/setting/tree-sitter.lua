local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then
	return
end

treesitter.setup {
	highlight = {
		enable = true,
		disable = {}
	},
	indent = {
		enable = true,
		disable = {}
	},
	ensure_installed = {
		"go",
		"c",
		"python",
		"lua",
		"thrift",
		"make",
		"bash",
		"yaml",
		"html",
		"zig",
		"rust"
	}
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.used_by = {"javascript", "typescript.tsx"}
