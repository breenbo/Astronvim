return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.tokyonight" },
  { import = "astrocommunity.editing-support/todo-comments-nvim" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2" },
  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.pack.tailwindcss" },
  {
    "neorg",
    opts = {
      load = {
        ["core.norg.dirman"] = {
          config = {
            workspaces = {
              homepad = "~/projects/homepad",
              documents = "~/projects/homepad/documents",
            },
          },
        },
      },
    },
  },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
