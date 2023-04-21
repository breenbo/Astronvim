return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.tokyonight" },
  { import = "astrocommunity.editing-support/todo-comments-nvim" },
  -- { import = "astrocommunity.editing-support.nvim-ts-rainbow2" },
  -- { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  --
  -- { import = "astrocommunity.note-taking.neorg" },
  -- {
  --   "neorg",
  --   opts = {
  --     load = {
  --       ["core.default"] = {},
  --       ["core.concealer"] = {}, -- adds icons
  --       ["core.completion"] = {
  --         config = {
  --           engine = "nvim-cmp",
  --         },
  --       },                     -- add completion support
  --       ["core.journal"] = {}, -- enable journal support
  --       ["core.dirman"] = {
  --         config = {
  --           workspaces = {
  --             homepad = "~/projects/homepad",
  --             admin = "~/projects/homepad/admin",
  --             contact = "~/projects/homepad/contact",
  --             documents = "~/projects/homepad/documents",
  --             login = "~/projects/homepad/login",
  --             tickets = "~/projects/homepad/tickets",
  --           },
  --           default_workspace = "homepad",
  --         },
  --       },
  --     },
  --   },
  -- },
  --
  -- { import = "astrocommunity.pack.tailwindcss" },
  -- { import = "astrocommunity.editing-support.nvim-regexplainer" },
}
