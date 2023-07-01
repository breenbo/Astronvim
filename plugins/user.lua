return {
  -- You can also add new plugins here as well:
  --
  --
  {
    "kylechui/nvim-surround",
    config = function() require("nvim-surround").setup {} end,
    event = "User AstroFile",
  }, --
  --
  --
  --
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "BufRead package.json",
    config = function() require("package-info").setup() end,
  }, --
  --
  --
  --
  {
    "ggandor/lightspeed.nvim",
    config = function() require("lightspeed").setup {} end,
    event = "User AstroFile",
  }, --
  --
  --
  --
  { "tpope/vim-fugitive", lazy = false }, --
  --
  --
  --
  {
    "nvim-neotest/neotest",
    dependencies = {
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
        quickfix = { open = false, enabled = false },
        status = { enabled = true, signs = true, virtual_text = false },
        summary = { open = "botright vsplit | vertical resize 40" },
      }
    end,
    ft = { "vue", "ts", "js" },
  }, --
  --
  --
  --
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    -- config = function() require("chatgpt").setup { keymaps = { submit = "<C-s>" } } end,
    config = function() require("chatgpt").setup {} end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  }, --
  --
  --
  --
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
  }, --
  --
  --
  --
  --
  --
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parser",
    event = "VeryLazy",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {}, -- adds icons
          ["core.keybinds"] = {}, -- add default keybinds
          ["core.completion"] = { config = { engine = "nvim-cmp" } }, -- add completion support
          ["core.journal"] = {}, -- enable journal support
          ["core.summary"] = {}, -- create workspaces summary from meta-datas
          ["core.presenter"] = { config = { zen_mode = "zen-mode" } }, -- enable presenter support
          ["core.dirman"] = {
            config = {
              workspaces = {
                homepad = "~/projects/homepad",
                admin = "~/projects/homepad/admin",
                contact = "~/projects/homepad/contact",
                documents = "~/projects/homepad/documents",
                login = "~/projects/homepad/login",
                tickets = "~/projects/homepad/tickets",
                php = "~/projects/php",
              },
              default_workspace = "homepad",
            },
          },
        },
      }
    end,
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
