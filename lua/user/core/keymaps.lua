local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true } --  TODO: 未使用的变量 term_opts

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- 窗口
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-- 编辑多文件
keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- 选中行移动
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts) -- 选定文本向右缩进
keymap("v", ">", ">gv", opts) -- 选定文本向左缩进

--- -------- plugin keymaps -------- ---

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-b>", ":Bdelete!<CR>", opts)

-- vim-maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- find files within current working directory
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory
keymap("n", "<leader>fb", "<cmd>Telescope grep_string", opts) -- find string under cursor in current working directory
keymap("n", "<leader>fh", "<cmd>Telescope buffers<cr>", opts) -- list open buffers in current neovim instance
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- list available help tags

-- telescope-media-files
keymap("n", "<leader>fm", "<cmd>Telescope media_files<cr>", opts) -- list available help tags

-- telescope frequency
keymap("n", "<leader>fr", "<cmd>Telescope frecency<CR>", opts)

-- telescope cheatsheet
keymap("n", "<leader>f/", "<cmd>Cheatsheet<CR>", opts)

-- telescope projects
keymap("n", "<leader>fp", "<cmd>Cheatsheet<CR>", opts)
