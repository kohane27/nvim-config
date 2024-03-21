return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    -- LSP Management
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    -- LSP status updates
    -- { "j-hui/fidget.nvim", opts = {} },

    {
      -- language server settings in json
      "tamago324/nlsp-settings.nvim",
    },

    {
      -- providing access to the SchemaStore catalog
      "b0o/schemastore.nvim",
    },

    -- Additional lua configuration
    -- { "folke/neodev.nvim" },
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        -- "angularls",
        "cssls",
        "emmet_ls",
        "awk_ls",
        "bashls",
        "cssmodules_ls",
        "dockerls",
        "eslint", -- instead of `tsserver` or `eslint_d` in `null_ls` for better linting and react-specific linting rules
        "html",
        "lemminx",
        "pyright",
        "pylsp",
        "sqlls",
        "jsonls",
        "yamlls",
        "terraformls",
      },
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "awk-language-server",
        "bash-language-server",
        "css-lsp",
        "cssmodules-language-server",
        "dockerfile-language-server",
        "emmet-ls",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "lemminx",
        "lua-language-server",
        "pyright",
        "python-lsp-server",
        "sqlls",
        "prettierd",
        "sql-formatter",
        "tfsec",
        "tflint",
      },
      auto_update = true,
    })

    local lspconfig = require("lspconfig")

    -- Add additional capabilities supported by nvim-cmp
    -- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- Tell the server the capability of foldingRange that Neovim hasn't added foldingRange to default capabilities
    lsp_capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local no_formatting = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    -- Call setup on each LSP server
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = lsp_capabilities,
          handlers = {
            -- Add borders to LSP popups
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
          },
        })
      end,
    })

    -- custom language servers not listed here:
    -- 1. `tsserver` managed by `typescript-tools.nvim`
    -- 2. jsonls
    -- 3. stylelint_lsp
    -- 4. lua_ls
    -- 5. yamlls

    -- 2. jsonls
    lspconfig.jsonls.setup({
      -- on_attach = on_attach,
      capabilities = lsp_capabilities,
      handlers = {
        -- Add borders to LSP popups
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      },
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    -- 3. stylelint_lsp
    -- lspconfig.stylelint_lsp.setup({
    --   settings = {
    --     stylelintplus = {
    --       autoFixOnFormat = true,
    --       autoFixOnSave = true,
    --     },
    --   },
    -- })

    -- 4. lua_ls
    lspconfig.lua_ls.setup({
      -- disable formatting here; using `stylua` in `null_ls`
      on_attach = no_formatting,
      capabilities = lsp_capabilities,
      handlers = {
        -- Add borders to LSP popups
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      },
      settings = {
        Lua = {
          format = {
            enable = false,
          },
          runtime = {
            version = "LuaJIT",
            -- Setup your lua path
            -- path = runtime_path,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim", "P" },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- 5. cssls
    lspconfig.cssls.setup({
      capabilities = lsp_capabilities,
      handlers = {
        -- Add borders to LSP popups
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      },
      settings = {
        css = { lint = { unknownAtRules = "ignore" } },
        scss = { lint = { unknownAtRules = "ignore" } },
        less = { lint = { unknownAtRules = "ignore" } },
      },
    })

    -- 6. yamlls
    -- TODO: fix
    -- lspconfig.yamlls.setup({
    --   settings = {
    --     capabilities = lsp_capabilities,
    --     handlers = {
    --       -- Add borders to LSP popups
    --       ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    --       ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    --     },
    --     yaml = {
    --       schemaStore = {
    --         -- You must disable built-in schemaStore support if you want to use
    --         -- this plugin and its advanced options like `ignore`.
    --         enable = false,
    --         -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
    --         url = "",
    --       },
    --       schemas = require("schemastore").yaml.schemas(),
    --     },
    --   },
    -- })
  end,
}
