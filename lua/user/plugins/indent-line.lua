local status_ok, indentline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

local colorlist = {
	"#E06C75",
	"#E5C07B",
	"#98C379",
	"#56B6C2",
	"#61AFEF",
	"#C678DD",
}
local function highlight_color(k, v)
	vim.cmd("highlight IndentBlanklineIndent" .. k .. " guifg=" .. v .. " gui=nocombine")
end

for k, v in pairs(colorlist) do
	local status, msg = pcall(highlight_color, k, v)
	if not status then
		print("Error defining highlight color: " .. msg)
	end
end

-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

indentline.setup({
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
})
