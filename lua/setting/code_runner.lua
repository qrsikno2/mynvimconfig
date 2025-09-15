require("code_runner").setup({
	-- 模式选择
	mode = "term",
	-- 聚焦在终端窗口
	focus = true,
	-- 终端位置
	term = {
		position = "bot",
		size = 15,
		close_on_exit = false,
		keymap = {
			close = "<ESC><CR>",
		},
	},
	-- 支持的文件类型及对应的运行命令
	filetype = {
		rust = function()
			local file_path = vim.fn.expand("%:p")
			local dir_path = vim.fn.fnamemodify(file_path, ":h")
			local cargo_toml_path = dir_path .. "/Cargo.toml"
			if vim.fn.filereadable(cargo_toml_path) == 1 then
				return "cd " .. dir_path .. " && cargo run"
			else
				return "rustc " .. file_path .. " && " .. vim.fn.fnamemodify(file_path, ":r")
			end
		end,
		python = "python3 $file",
		javascript = "node $file",
		-- 你可以按需添加更多语言的配置
	},
})
