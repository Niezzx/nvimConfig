local status_ok, cheatsheet = pcall(require, "cheatsheet")
if not status_ok then
	return
end

cheatsheet.setup({
	bundled_plugin_cheatsheets = {
		disabled = { "gitsigns.nvim" },
	},
})
