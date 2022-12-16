vim.g.mapleader = " "

local keymap = vim.keymap -- for reuse

-- general keymaps

keymap.set("n", "x", '"_x"') -- in normal mode, when use x to delete, don't copy the deletion
----  splits
keymap.set("n","<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n","<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n","<leader>se", "<C-w>=") -- make split windows equall width
keymap.set("n","<leader>sx", ":close<CR>") -- close current split window
---- tabs
keymap.set("n","<leader>to", ":tabnew<CR>") -- open new tab 
keymap.set("n","<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n","<leader>tn", ":tabn<CR>") -- go to next tab 
keymap.set("n","<leader>tp", ":tabp<CR>") -- go to prev tab 

-- Plugins

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- telescope
keymap.set("n", "<leader>ff","<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fs","<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc","<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb","<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh","<cmd>Telescope help_tags<CR>")

-- ZK related keymaps

local opts = { noremap=true, silent=false }

-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>", opts)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)

-- End ZK related keymaps
