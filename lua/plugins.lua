-- Install plugin manager (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins configuration
require("lazy").setup({

  -- Auto Completion
  { 
    "hrsh7th/nvim-cmp", 
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':'.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },

  -- LSP Config
  { 
    "neovim/nvim-lspconfig", 
    config = function()
      require("lspconfig").pyright.setup {} -- Example for Python
    end,
  },

  -- Fugitive - Git integration
  {
    "tpope/vim-fugitive",
    cmd = {
      "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Glgrep", "Ggrep",
      "Gbrowse", "G blamediff", "Gfetch", "Gpush", "Gpull", "Gcommit",
      "Gstatus", "Gblame", "Gmove", "Gdelete", "Gedit"
    },
    -- No configuration needed as Fugitive works out of the box
  },

  -- Status Line
  { 
    "nvim-lualine/lualine.nvim", 
    dependencies = { "nvim-tree/nvim-web-devicons" }, 
    config = function()
      require("lualine").setup {
        options = { theme = "gruvbox" },
      }
    end,
  },

  -- File Explorer
  { 
    "nvim-tree/nvim-tree.lua", 
    dependencies = { "nvim-tree/nvim-web-devicons" }, 
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    end,
  },

  -- Fuzzy Finder
  { 
    "nvim-telescope/telescope.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" }, 
    config = function()
      require("telescope").setup()
    end,
  },

  -- Syntax Highlighting
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate", 
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "python", "javascript", "html", "css", "bash", "json", "yaml" },
        highlight = { enable = true },
      }
    end,
  },

  -- Git Integration
  { 
    "lewis6991/gitsigns.nvim", 
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Auto Closing Pairs
  { 
    "windwp/nvim-autopairs", 
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Commenting
  { 
    "numToStr/Comment.nvim", 
    config = function()
      require("Comment").setup()
    end,
  },

  -- Terminal Integration
  { 
    "akinsho/toggleterm.nvim", 
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
        direction = "float",
      })
    end,
  },

  -- Diagnostics and Code Actions
  { 
    "folke/trouble.nvim", 
    dependencies = { "nvim-tree/nvim-web-devicons" }, 
    config = function()
      require("trouble").setup()
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
    end,
  },

  -- Bufferline (Better Tabs)
  { 
    "akinsho/bufferline.nvim", 
    dependencies = "nvim-tree/nvim-web-devicons", 
    config = function()
      require("bufferline").setup()
      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
    end,
  },

  -- Mason Plugin
  { 
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

 -- Theme - Catppuccin for GitHub Dark Default look
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- Make sure we load this during startup if it's not already loaded
    priority = 1000, -- Ensure it's loaded before other plugins
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- This is the dark variant closest to GitHub Dark Default
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = false,
          mini = false,
          -- Add any other integrations you might use
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- New and Useful Plugins

  -- Colorizer for CSS, HTML, etc.
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },


  -- Surround motions
  {
    "tpope/vim-surround",
  },

  -- Better Startup Page - Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          header = {
            "  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗██╗███╗   ███╗",
            "  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║██║████╗ ████║",
            "  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║██║██╔████╔██║",
            "  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝██║██║╚██╔╝██║",
            "  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝ ██║██║ ╚═╝ ██║",
            "  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝  ╚═╝╚═╝     ╚═╝",
          },
          center = {
            { 
              action = "Telescope find_files",
              desc = " Find file",
              icon = " ",
              key = "f",
            },
            {
              action = "ene | startinsert",
              desc = " New file",
              icon = " ",
              key = "n",
            },
            {
              action = "Telescope oldfiles",
              desc = " Recent files",
              icon = " ",
              key = "r",
            },
            {
              action = "q",
              desc = " Quit",
              icon = " ",
              key = "q",
            },
          },
          footer = {},
        },
      })
    end,
  },
})
