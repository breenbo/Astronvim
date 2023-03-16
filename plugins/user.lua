return {
  -- You can also add new plugins here as well:
  { "kylechui/nvim-surround", config = function() require("nvim-surround").setup {} end, event = "User AstroFile" },
  "NLKNguyen/papercolor-theme",
  {
    "ggandor/lightspeed.nvim",
    config = function() require("lightspeed").setup {} end,
    event = "User AstroFile",
  },
  { "tpope/vim-fugitive", lazy = false },
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
