local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_status_ok then
  print("lspconfig not working")
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
  print("cmp_nvim_lsp not working")
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- vim.cmd([[
-- "" show line diagnostics automatically in hover window
-- autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
-- ]])

-- Add additional capabilities supported by nvim-cmp
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr) end

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
-- 1. `tsserver` is managed by `typescript-tools.nvim`
-- 2. jsonls
-- 3. lua_ls

-- custom language servers
-- 1. typescript-tools.nvim
local status_ok, typescript_tools = pcall(require, "typescript-tools")
if not status_ok then
  print("typescript-tools not working")
end
typescript_tools.setup({})

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

-- lspconfig.cssls.setup({
--   capabilities = capabilities,
--   filetypes = { "typescript", "css", "scss", "less" },
-- })

-- 3. lua_ls
lspconfig.lua_ls.setup({
  -- disable formatting with `lua_ls` because using `stylua` in `null_ls`
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
  "angularls",
  "html",
  "emmet_ls",
  "cssls",
  "cssmodules_ls",
  "awk_ls",
  "bashls",
  "dockerls",
  "eslint", -- use this instead of `tsserver` because it provides react-specific linting rules
  "lemminx",
  "prismals",
  "pylsp",
  "sqlls",
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
