local status_ok, colors = pcall(require, "nvim-highlight-colors")
if not status_ok then
	return
end

colors.setup()
