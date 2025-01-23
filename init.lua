-- Set leader key early
vim.g.mapleader = " "

-- Load configurations
require("options")    -- General options
require("keymaps")    -- Key mappings
require("plugins")    -- Plugin setup
require("lsp")        -- LSP and autocomplete setup

