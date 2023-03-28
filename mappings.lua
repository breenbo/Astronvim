-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- LSP - go next/prev error
    ["<leader>ln"] = { function() vim.diagnostic.goto_next() end, desc = "Goto next error" },
    ["<leader>lp"] = { function() vim.diagnostic.goto_prev() end, desc = "Goto previous error" },
    --
    -- FIX eslint error
    --
    ["<leader>le"] = { ":!eslint_d --fix %<CR>", desc = "Fix ts linting" },
    --
    -- FIND
    --
    ["<leader>ft"] = { "<cmd> TodoTelescope <CR>", desc = "Todos" },
    --
    -- change buffer
    --
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    --
    -- git navigation
    --
    ["<leader>gnh"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" },
    ["<leader>gph"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" },
    --
    -- update package.json
    --
    ["<leader>j"] = { name = "JSON" },
    ["<leader>jd"] = { function() require("package-info").delete() end, desc = "Delete package" },
    ["<leader>ji"] = { function() require("package-info").update() end, desc = "Install package" },
    ["<leader>ju"] = { function() require("package-info").update() end, desc = "Update package" },
    ["<leader>jc"] = { function() require("package-info").update() end, desc = "Change package version" },
    --
    -- neotest
    --
    ["<leader>T"] = { name = "Neotest" },
    ["<leader>TR"] = {
      function() require("neotest").run.run() end,
      desc = "run test",
    },
    ["<leader>TF"] = {
      function() require("neotest").run.run(vim.fn.expand "%") end,
      desc = "run file tests",
    },
    ["<leader>TO"] = {
      function() require("neotest").output.open { last_run = true, enter = true } end,
      desc = "open output",
    },
    ["<leader>TS"] = {
      function() require("neotest").summary.toggle() end,
      desc = "toggle summary panel",
    },
    ["<leader>TN"] = {
      function() require("neotest").jump.next { status = "failed" } end,
      desc = "jump next failed test",
    },
    ["<leader>TP"] = {
      function() require("neotest").jump.prev { status = "failed" } end,
      desc = "jump prev failed test",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
