local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_status_ok then
  print("lspconfig failing")
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
  print("cmp_nvim_lsp failing")
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

vim.cmd([[
"" show line diagnostics automatically in hover window
autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
]])

-- Add additional capabilities supported by nvim-cmp
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr) end

--[[
Language servers setup:

For language servers list see:
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

Bash -> bashls
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls

Python -> pyright
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright

HTML/CSS/JSON -> vscode-html-languageserver
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
--]]

-- Define `root_dir` when needed
-- See: https://github.com/neovim/nvim-lspconfig/issues/320
-- This is a workaround, maybe not work with some servers.
local root_dir = function()
  return vim.fn.getcwd()
end

-- custom language servers not listed here:
-- 1. jsonls
-- 2. sumneko_lua
-- 3. `tsserver` is managed by `typescript.nvim`

-- Use a loop to call 'setup' on multiple servers
local servers = {
  "awk_ls",
  "bashls",
  "cssls",
  "cssmodules_ls",
  "dockerls",
  "emmet_ls",
  "eslint",
  "graphql",
  "html",
  "lemminx",
  "pyright",
  "sqls",
  -- "stylelint_lsp", -- conflict with prettier in js files
}

-- Call setup
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    -- on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
  })
end

-- custom language server not listed above
-- 1. jsonls
lspconfig.jsonls.setup({
  -- on_attach = on_attach,
  root_dir = root_dir,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
})

-- 2. sumneko_lua
-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup({
  on_attach = function(client, _)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,

  root_dir = root_dir,
  capabilities = capabilities,
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
      -- workspace = {
      --   -- Make the server aware of Neovim runtime files
      --   library = vim.api.nvim_get_runtime_file("", true),
      -- },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- 3. typescript
local status_ok, typescript = pcall(require, "typescript")
if not status_ok then
  print("typescript failing")
end

typescript.setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false,
  server = { -- pass options to lspconfig's setup method
    on_attach = function(client, _)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end,
  },
})
