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

-- nvim-ufo: tell the server the capability of foldingRange
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- require("lsp-format").on_attach(client)

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- NOTE no keymappings in WhichKey
  -- NOTE document what's here so no conflict in WhichKey
  -- Mappings
  local opts = { noremap = true, silent = true }

  -- K mapped to 5gk
  -- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  -- conflict with switching tabs
  -- buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

  -- -- conflict with default gi
  -- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
  -- TODO another key
  -- ["<C-j>"] = {
  --   '<cmd>lua vim.diagnostic.open_float(0, {scope="line", border = "rounded" })<cr>',
  --   "Line Diagnostic",
  -- },
  -- ["<C-k>"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
  -- K = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<space>cl", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

  -- TODO another key
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
  buf_set_keymap("n", "<space>ts", "<cmd>Telescope lsp_document_symbols<CR>", opts)
  -- buf_set_keymap("n", "<space>ts", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)
end

--[[

Language servers setup:

For language servers list see:
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

Bash --> bashls
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls

Python --> pyright
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright

HTML/CSS/JSON --> vscode-html-languageserver
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html

--]]

-- Define `root_dir` when needed
-- See: https://github.com/neovim/nvim-lspconfig/issues/320
-- This is a workaround, maybe not work with some servers.
local root_dir = function()
  return vim.fn.getcwd()
end

vim.cmd([[
" format on save except the following
let ftToIgnore = ['c', 'markdown']
autocmd BufWritePre * if index(ftToIgnore, &ft) < 0 | lua vim.lsp.buf.formatting_sync()
]])

-- Use a loop to conveniently call 'setup' on multiple servers and
-- `tsserver` is managed by `typescript.nvim` below
local servers = { "bashls", "pyright", "cssls", "emmet_ls" }

-- Call setup
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
  })
end

-- custom language server not listed above
-- 1. jsonls
lspconfig.jsonls.setup({
  on_attach = on_attach,
  root_dir = root_dir,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
})

-- 2. html
lspconfig.html.setup({
  on_attach = function(client, _)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
  root_dir = root_dir,
  capabilities = capabilities,
})

-- 3. sumneko_lua
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

-- 4. typescript
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
