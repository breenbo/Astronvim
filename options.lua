local api_keys = require "user.api_keys"
-- set vim options here (vim.<first_key>.<second_key> = value)
return {
    opt = {
        -- set to true or false etc.
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        scrolloff = 999,
        colorcolumn = "80",
        linebreak = true,
        textwidth = 80
    },
    g = {
        mapleader = " ", -- sets vim.g.mapleader
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 2, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true -- disable notifications when toggling UI elements
    },
    -- chatgpt api key
    env = {OPENAI_API_KEY = api_keys.OPENAI_API_KEY}
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   vim.diagnostic.config { virtual_text = false, virtual_lines = false }
--   --
--   --
--   return local_vim
-- end
