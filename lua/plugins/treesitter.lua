local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"javascript",
		"json",
		"lua",
		"python",
		"typescript",
		"tsx",
		"html",
		"css",
		"markdown",
		"markdown_inline",
	}, -- one of "all" or a list of languages
	sync_install = false,
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	indent = { enable = true, disable = { "" } },
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = { "#ffff404d", "#7fff7f4d", "#ff7fff4d", "#4fecec4d" }, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
