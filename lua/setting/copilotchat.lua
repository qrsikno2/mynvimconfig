require("CopilotChat").setup {
	-- See Configuration section for options
	debug = true,
	show_help = "yes",
	prompts = {
		Explain = "用中文解释他是怎么做的",
		Review = "Review the following code and provide concise suggestions.",
		Tests = "Briefly explain how the selected code works, then generate unit tests.",
		Refactor = "Refactor the code to improve clarity and readability.",
	},
}
