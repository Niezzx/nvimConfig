local status_wilder_ok, wilder = pcall(require, "wilder")
if not status_wilder_ok then
	return
end

wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option("pipeline", {
	wilder.branch(
		wilder.cmdline_pipeline({
			fuzzy = 1,
			fuzzy_filter = wilder.lua_fzy_filter(),
		}),
		wilder.vim_search_pipeline()
	),
})

wilder.set_option(
	"renderer",
	wilder.renderer_mux({
		[":"] = wilder.popupmenu_renderer({
			highlighter = wilder.lua_fzy_highlighter(),

			left = {
				" ",
				wilder.popupmenu_devicons(),
			},
			right = {
				" ",
				wilder.popupmenu_scrollbar(),
			},
		}),
		["/"] = wilder.wildmenu_renderer({
			highlighter = wilder.lua_fzy_highlighter(),
		}),
	})
)

-- Popupnenu borders
wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		min_width = "15%",
		highlights = {
			border = "Normal", -- highlight to use for the border
		},
		-- 'single', 'double', 'rounded' or 'solid'
		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
		border = "rounded",
	}))
)

-- Gradient highlighting
local gradient = {
	"#f4468f",
	"#fd4a85",
	"#ff507a",
	"#ff566f",
	"#ff5e63",
	"#ff6658",
	"#ff704e",
	"#ff7a45",
	"#ff843d",
	"#ff9036",
	"#f89b31",
	"#efa72f",
	"#e6b32e",
	"#dcbe30",
	"#d2c934",
	"#c8d43a",
	"#bfde43",
	"#b6e84e",
	"#aff05b",
}

for i, fg in ipairs(gradient) do
	gradient[i] = wilder.make_hl("WilderGradient" .. i, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = fg } })
end

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer({
		highlights = {
			gradient = gradient, -- must be set
			-- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
		},
		highlighter = wilder.highlighter_with_gradient({
			wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
		}),
	})
)
