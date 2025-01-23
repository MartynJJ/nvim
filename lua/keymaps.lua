local keymap = vim.keymap.set
local opts = { noremap = true, silent = true } -- Options for keybindings

-- Save and quit
-- <leader>w: Save the current file
keymap("n", "<leader>w", ":w<CR>", opts)
-- <leader>q: Quit the current buffer
keymap("n", "<leader>q", ":q<CR>", opts)

-- Telescope mappings
-- <leader>ff: Open Telescope to find files
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
-- <leader>fg: Open Telescope to live grep (search for text in files)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
-- <leader>fb: Open Telescope to list open buffers
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
-- <leader>fh: Open Telescope to search through command history
keymap("n", "<leader>fh", "<cmd>Telescope command_history<CR>", opts)
-- <leader>fr: Open Telescope to find recently opened files
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", opts)

-- Window Management
-- <leader>sv: Split window vertically
keymap("n", "<leader>sv", "<C-w>v", opts)
-- <leader>sh: Split window horizontally
keymap("n", "<leader>sh", "<C-w>s", opts)
-- <leader>sc: Close current window
keymap("n", "<leader>sc", "<C-w>c", opts)
-- <leader>so: Close all other windows except the current one
keymap("n", "<leader>so", "<C-w>o", opts)

-- Navigation between windows
-- <C-h>: Move to the left window
keymap("n", "<C-h>", "<C-w>h", opts)
-- <C-j>: Move to the window below
keymap("n", "<C-j>", "<C-w>j", opts)
-- <C-k>: Move to the window above
keymap("n", "<C-k>", "<C-w>k", opts)
-- <C-l>: Move to the right window
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
-- <C-Up>: Increase window height
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- <C-Down>: Decrease window height
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- <C-Left>: Decrease window width
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- <C-Right>: Increase window width
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
