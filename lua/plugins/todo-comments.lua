local status_ok, todo = pcall(require, "todo-comments")
if not status_ok then
	return
end

todo.setup()

-- Two methods are available to jump to the next/previous todo comment.
vim.keymap.set("n", "]t", function()
  todo.jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  todo.jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

vim.keymap.set("n", "]t", function()
  todo.jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })
