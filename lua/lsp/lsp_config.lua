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
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr) end

--[[
Language servers setup:
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--]]

-- Define `root_dir` when needed
-- See: https://github.com/neovim/nvim-lspconfig/issues/320
-- This is a workaround, maybe not work with some servers.
local root_dir = function()
  return vim.fn.getcwd()
end

-- custom language servers not listed here:
-- 1. `tsserver` is managed by `typescript.nvim`
-- 2. jsonls
-- 3. sumneko_lua

-- custom language servers
-- 1. typescript
local status_ok, typescript = pcall(require, "typescript")
if not status_ok then
  print("typescript failing")
end

typescript.setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false,
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    on_attach = function(client, _)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
    end,
  },
})

-- 2. jsonls
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

-- 3. sumneko_lua
-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup({
  on_attach = function(client, _)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
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
  "pylsp",
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
