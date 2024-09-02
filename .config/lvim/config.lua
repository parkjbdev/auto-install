-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Config
vim.o.foldenable = false
vim.o.foldmethod = 'indent'
vim.o.wrap = true
vim.g.autoindent = true
vim.g.expandtab = true
vim.g.tabstop = 2
vim.g.shiftwidth = 2
vim.g.skip_ts_context_commentstring_module = true
-- vim.g.nvim_tree_group_empty = 1

--- Plugins
lvim.plugins = {
  { "lambdalisue/vim-suda" },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = {
      floating_window = false,
      close_timeout = 2000,
      hint_inline = function()
        return "eol"
      end,
      hint_prefix = "",
    }
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
        }
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        renderer = {
          group_empty = true,
        }
      })
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
  },
  { "wakatime/vim-wakatime" },
  { "mg979/vim-visual-multi" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },

  -- lazy.nvim
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --     lsp = {
  --       -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --         ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
  --       },
  --       signature = {
  --         enabled = false,
  --       }
  --     },
  --     -- you can enable a preset for easier configuration
  --     presets = {
  --       bottom_search = true,         -- use a classic bottom cmdline for search
  --       command_palette = true,       -- position the cmdline and popupmenu together
  --       long_message_to_split = true, -- long messages will be sent to a split
  --       inc_rename = true,            -- enables an input dialog for inc-rename.nvim
  --       lsp_doc_border = false,       -- add a border to hover docs and signature help
  --     },
  --   },
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- },
  {
    "stevearc/dressing.nvim",
  },
  -- {
  --   "smjonas/inc-rename.nvim",
  --   config = function()
  --     require("inc_rename").setup({
  --       input_buffer_type = "dressing"
  --     })
  --   end,
  -- }

  -- {
  --   "nvim-telescope/telescope-ui-select.nvim",
  --   config = function()
  --     require("telescope").load_extension("ui-select")
  --   end,
  -- }
}

-- Bugfix
local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = { "clangd", "--offset-encoding=utf-16" },
}
lvim.builtin.treesitter.ignore_install = { "dart" }

-- Keybindings
-- vim.keymap.set("n", "[b", "<cmd>bprevious<CR>")
-- vim.keymap.set("n", "]b", "<cmd>bnext<CR>")
-- lvim.builtin.which_key.mappings["[b"] = {
--   name = "Previous Buffer",
--   b = { "<cmd>bprevious<cr>", "Previous Buffer" },
-- }
-- lvim.builtin.which_key.mappings["]b"] = {
--   name = "Next Buffer",
--   b = { "<cmd>bnext<cr>", "Next Buffer" },
-- }
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
lvim.builtin.which_key.mappings["f"] = {
  name = "Telescope",
  f = { "<cmd>Telescope find_files<cr>", "Find Files" },
  g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
}
