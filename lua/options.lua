-- General options
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.tabstop = 4            -- Number of spaces a tab is counted for
vim.opt.shiftwidth = 4         -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true       -- Convert tabs to spaces
vim.opt.smartindent = true     -- Smart autoindenting when starting a new line
vim.opt.wrap = false            -- Disable line wrapping
vim.opt.mouse = "a"            -- Enable mouse in all modes
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.splitright = true      -- Vertical splits appear on the right
vim.opt.splitbelow = true      -- Horizontal splits appear below
vim.opt.ignorecase = true      -- Ignore case when searching
vim.opt.smartcase = true       -- Override ignorecase if search contains uppercase letters

-- Add a color column at column 80
vim.opt.colorcolumn = "80"     -- Highlight column 80

-- Additional useful options
vim.opt.termguicolors = true   -- Enable 24-bit RGB colors in the TUI
vim.opt.cursorline = true      -- Highlight the current line
vim.opt.signcolumn = "yes"     -- Always show the sign column, prevents text shifting
vim.opt.scrolloff = 8          -- Start scrolling when we're 8 lines from margin
vim.opt.sidescrolloff = 8      -- Start horizontal scrolling when we're 8 characters from margin
vim.opt.showmode = false       -- Hide the current mode (like --INSERT--) since we use statusline plugins
vim.opt.undofile = true        -- Enable persistent undo
vim.opt.updatetime = 300       -- Reduce time for certain events like CursorHold
vim.opt.timeoutlen = 500       -- Time in milliseconds to wait for a mapped sequence to complete
vim.opt.wildmenu = true        -- Enable enhanced command line completion
vim.opt.wildmode = {'longest:full', 'full'} -- Complete the longest common match, then list all matches
vim.opt.fileencoding = "utf-8" -- Set file encoding to UTF-8
vim.opt.backup = false         -- Disable backup files
vim.opt.writebackup = false    -- Disable write backup
vim.opt.swapfile = false       -- Disable swap files

-- Enable hidden buffers to switch between buffers without saving
vim.opt.hidden = true

-- Enable better listchars for special characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '+' }

-- Improve search behavior
vim.opt.hlsearch = true        -- Highlight search matches
vim.opt.incsearch = true       -- Incremental search

-- Better command line completion
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
