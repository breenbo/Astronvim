return {
  -- You can also add new plugins here as well:
  { "folke/todo-comments.nvim", config = function() require("todo-comments").setup {} end, event = "User AstroFile" },
  { "kylechui/nvim-surround",   config = function() require("nvim-surround").setup {} end, event = "User AstroFile" },
  "folke/tokyonight.nvim",
  "NLKNguyen/papercolor-theme",
  {
    "ggandor/lightspeed.nvim",
    config = function() require("lightspeed").setup {} end,
    event = "User AstroFile",
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
}
