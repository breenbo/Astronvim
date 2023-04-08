return {
  -- You can also add new plugins here as well:
  { "kylechui/nvim-surround", config = function() require("nvim-surround").setup {} end, event = "User AstroFile" },
  {
    "ggandor/lightspeed.nvim",
    config = function() require("lightspeed").setup {} end,
    event = "User AstroFile",
  },
  { "tpope/vim-fugitive", lazy = false },
  {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "marilari88/neotest-vitest",
    },
    config = function()
      --
      --
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      --
      --
      require("neotest").setup {
        adapters = { require "neotest-vitest" },
        --
        quickfix = {
          open = false,
          enabled = false,
        },
        status = {
          enabled = true,
          signs = true,
          virtual_text = false,
        },
        summary = {
          open = "botright vsplit | vertical resize 40",
        },
      }
    end,
    ft = { "vue", "ts", "js" },
    dependencies = { "marilari88/neotest-vitest" },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        keymaps = {
          submit = "<C-s>",
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "sindrets/diffview.nvim",
    event = "User AstroFile",
    requires = "nvim-lua/plenary.nvim",
  },
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- "NLKNguyen/papercolor-theme",
}
