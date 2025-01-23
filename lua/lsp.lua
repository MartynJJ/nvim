local lspconfig = require("lspconfig")
local cmp = require("cmp")

-- Autocomplete setup
cmp.setup({
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
  },
})

-- LSP server setup
lspconfig.pyright.setup({}) -- Example: Python LSP

