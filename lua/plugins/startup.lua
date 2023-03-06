local status_ok, startup = pcall(require, "startup")
if not status_ok then
	return
end

require("startup").setup({
	header = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 5,
		content = {
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
		},
		highlight = "Statement",
		default_color = "",
		oldfiles_amount = 0,
	},
	body = {
		type = "mapping",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Basic Commands",
		margin = 5,
		content = {
			{ "  Find File", "Telescope find_files", "<leader>ff" },
			{ "  Find Word", "Telescope live_grep", "<leader>fg" },
			{ "󰒼 Find File Frecency", "Telescope frecency", "<leader>fr" },
			{ "󰧷 CheatSheet", "Telescope CheatSheet", "<leader>f/" },
			{ "󱧮 Find Project", "Telescope Project", "<leader>fp" },
			{ "󰉠 Code format", "<cmd>lua vim.lsp.buf.format", "<leader>lf" },
		},
		highlight = "String",
		default_color = "",
		oldfiles_amount = 0,
	},
	-- footer = {},
	options = {
		mapping_keys = true,
		cursor_column = 0.5,
		empty_lines_between_mappings = true,
		disable_statuslines = true,
		paddings = { 1, 3, 3, 0 },
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		background = "#4895ef",
		folded_section = "#7209b7",
	},
	parts = { "header", "body" },
})
