local options = {
	-- 行号
	relativenumber = true,
	number = true,

	-- 缩进
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	autoindent = true,

	-- 防止包裹
	wrap = true,

	-- 光标行
	cursorline = true,

	-- 启用鼠标
	mouse = "a",

	-- 系统剪剪贴板
	clipboard = "unnamedplus",

	-- 默认新窗口右和下
	splitright = true,
	splitbelow = true,

	-- 搜索
	ignorecase = true,
	smartcase = true,
	hlsearch = true, -- highlight all matches on previous search pattern

	-- 等待映射时间(单位:ms)
	timeoutlen = 1500,

	-- 外观
	termguicolors = true,
	signcolumn = "yes",
	linespace = 5,

	cmdheight = 1, -- more space in the neovim command
	pumheight = 10, -- pop up menu height 弹出菜单高度
	fileencoding = "utf-8", -- the encoding written to a file
	linebreak = true, -- companion to wrap, don't split words
	showtabline = 4, -- always show tabs
	smartindent = true, -- make indenting smarter again
	undofile = true, -- enable persistent undo
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	conceallevel = 0, -- so that `` is visible in markdown files
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- 搜索识别的带连字符的词
vim.opt.iskeyword:append("-")
-- 将 vim 插件与 neovim 分开，以防 vim 仍在使用
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
-- indent line 配置
vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
