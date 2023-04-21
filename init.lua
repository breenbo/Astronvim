return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "tokyonight-moon",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = { virtual_text = false, underline = true },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
          -- "vue",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
        "volar",
      },
      filter = function(client)
        if vim.bo.filetype == "vue" then return client.name == "null-ls" end
        -- enable all other clients
        return true
      end,
      -- timeout_ms = 5000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen",
        },
      },
    },
  },
  --
  -- configure dap (source: chatgpt)
  dap = {
    adapters = {
      chrome = {
        type = "executable",
        command = "google-chrome-stable",
        args = {
          "--remote-debugging-port=9222",
          "--no-first-run",
          "--no-default-browser-check",
          "--disable-translate",
          "http://127.0.0.1:3000",
        },
        env = { ["LANG"] = "en_US.UTF-8" },
      },
      -- chrome = {
      --   type = "executable",
      --   command = "chrome-debug",
      --   args = {
      --     "--remote-debugging-port=9222",
      --     "--no-first-run",
      --     "--no-default-browser-check",
      --     "--new-window",
      --     "--user-data-dir=${XDG_DATA_HOME}/chrome",
      --   },
      --   name = "chrome",
      -- },
      -- node2 = {
      --   type = "executable",
      --   command = "node",
      --   args = { "--inspect-brk", "${file}" },
      --   options = { cwd = vim.fn.getcwd() },
      -- },
      configurations = {
        typescript = {
          type = "chrome",
          request = "launch",
          program = "${workspaceFolder}/node_modules/.bin/vite",
          name = "Launch Chrome",
          webRoot = "${workspaceFolder}",
          sourceMaps = true,
          protocol = "inspector",
          url = "http://localhost:8080",
          sourceMapPathOverrides = {
            ["webpack:///*"] = "${webRoot}/*",
            ["webpack:///src/*"] = "${webRoot}/*",
            ["webpack:///./src/*"] = "${webRoot}/*",
          },
        },
        javascript = {
          type = "chrome",
          request = "launch",
          program = "${workspaceFolder}/node_modules/.bin/vite",
          name = "Launch Chrome",
          webRoot = "${workspaceFolder}",
          sourceMaps = true,
          protocol = "inspector",
          url = "http://localhost:8080",
          sourceMapPathOverrides = {
            ["webpack:///*"] = "${webRoot}/*",
            ["webpack:///src/*"] = "${webRoot}/*",
            ["webpack:///./src/*"] = "${webRoot}/*",
          },
        },
        -- javascript = {
        --   {
        --     type = "node2",
        --     request = "launch",
        --     program = "${file}",
        --     cwd = vim.fn.getcwd(),
        --     sourceMaps = true,
        --     protocol = "inspector",
        --     console = "integratedTerminal",
        --     name = "Node.js",
        --   },
        --   {
        --     type = "chrome",
        --     request = "attach",
        --     program = "${file}",
        --     cwd = vim.fn.getcwd(),
        --     sourceMaps = true,
        --     webRoot = "${workspaceFolder}",
        --     name = "Attach to Chrome",
        --   },
        --   {
        --     type = "node2",
        --     request = "launch",
        --     name = "Launch Program",
        --     program = "${workspaceFolder}/node_modules/vite/bin/vite.js",
        --     cwd = "${workspaceFolder}",
        --     runtimeArgs = { "--inspect-brk" },
        --     console = "integratedTerminal",
        --     sourceMaps = true,
        --     protocol = "inspector",
        --     port = 9229,
        --     args = { "--host", "0.0.0.0" },
        --     windows = {
        --       program = "${workspaceFolder}/node_modules/vite/bin/vite",
        --     },
        --   },
        --   {
        --     type = "node2",
        --     request = "launch",
        --     name = "Launch Debug",
        --     program = "${workspaceFolder}/node_modules/@vue/cli-service/bin/vue-cli-service.js",
        --     cwd = "${workspaceFolder}",
        --     runtimeArgs = { "serve", "--debug" },
        --     sourceMaps = true,
        --     protocol = "inspector",
        --     console = "integratedTerminal",
        --     port = 9229,
        --     args = { "--host", "0.0.0.0" },
        --     windows = {
        --       program = "${workspaceFolder}/node_modules/@vue/cli-service/bin/vue-cli-service",
        --     },
        --   },
        --   {
        --     type = "node2",
        --     request = "attach",
        --     name = "Attach by Process ID",
        --     protocol = "inspector",
        --     port = 9229,
        --     sourceMaps = true,
        --     skipFiles = { "<node_internals>/**" },
        --     processId = "${command:PickProcess}",
        --   },
      },
      -- vue = {
      --   {
      --     type = "node2",
      --     request = "launch",
      --     program = "${file}",
      --     cwd = vim.fn.getcwd(),
      --     sourceMaps = true,
      --     protocol = "inspector",
      --     console = "integratedTerminal",
      --     name = "Node.js",
      --   },
      --   {
      --     type = "chrome",
      --     request = "attach",
      --     program = "${file}",
      --     cwd = vim.fn.getcwd(),
      --     sourceMaps = true,
      --     webRoot = "${workspaceFolder}",
      --     name = "Attach to Chrome",
      --   },
      --   {
      --     type = "node2",
      --     request = "launch",
      --     name = "Launch Program",
      --     program = "${workspaceFolder}/node_modules/vite/bin/vite.js",
      --     cwd = "${workspaceFolder}",
      --     runtimeArgs = { "--inspect-brk" },
      --     console = "integratedTerminal",
      --     sourceMaps = true,
      --     protocol = "inspector",
      --     port = 9229,
      --     args = { "--host", "0.0.0.0" },
      --     windows = {
      --       program = "${workspaceFolder}/node_modules/vite/bin/vite",
      --     },
      --   },
      --   {
      --     type = "node2",
      --     request = "launch",
      --     name = "Launch Debug",
      --     program = "${workspaceFolder}/node_modules/@vue/cli-service/bin/vue-cli-service.js",
      --     cwd = "${workspaceFolder}",
      --     runtimeArgs = { "serve", "--debug" },
      --     sourceMaps = true,
      --     protocol = "inspector",
      --     console = "integratedTerminal",
      --     port = 9229,
      --     args = { "--host", "0.0.0.0" },
      --     windows = {
      --       program = "${workspaceFolder}/node_modules/@vue/cli-service/bin/vue-cli-service",
      --     },
      --   },
      --   {
      --     type = "node2",
      --     request = "attach",
      --     name = "Attach by Process ID",
      --     protocol = "inspector",
      --     port = 9229,
      --     sourceMaps = true,
      --     skipFiles = { "<node_internals>/**" },
      --     processId = "${command:PickProcess}",
      --   },
      -- },
    },
  },
  --
  --
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
