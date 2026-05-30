---@diagnostic disable: undefined-global
require("nvchad.configs.lspconfig").defaults()
local configs = require("nvchad.configs.lspconfig")
local on_init = configs.on_init
local capabilities = configs.capabilities

local custom_on_attach = function(client, bufnr)
  local on_attach = require("nvchad.configs.lspconfig").on_attach
  on_attach(client, bufnr)

  vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = "#a9a1e1" })
  local border = {
    { "╭", "LspFloatWinBorder" },
    { "─", "LspFloatWinBorder" },
    { "╮", "LspFloatWinBorder" },
    { "│", "LspFloatWinBorder" },
    { "╯", "LspFloatWinBorder" },
    { "─", "LspFloatWinBorder" },
    { "╰", "LspFloatWinBorder" },
    { "│", "LspFloatWinBorder" },
  }

  vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
    config = config or {}
    config.border = border
    vim.lsp.handlers.hover(_, result, ctx, config)
  end
  vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, config)
    config = config or {}
    config.border = border
    vim.lsp.handlers.signature_help(_, result, ctx, config)
  end
end

local servers = {
  "html",
  "cssls",
  "marksman",
  "somesass_ls",
  "jsonls",
  "bashls",
  "jdtls",
  "clangd",
  "pyright",
}

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = custom_on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

vim.lsp.config("ts_ls", {
  on_attach = custom_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  init_options = {
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
      importModuleSpecifierPreference = "non-relative",
    },
  },
  settings = {
    completions = {
      completeFunctionCalls = false,
    },
  },
})
vim.lsp.enable("ts_ls")

vim.lsp.config("jsonls", {
  on_attach = custom_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    json = {
      format = { enable = false },
    },
  },
})
vim.lsp.enable("jsonls")

vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  on_init = on_init,
  capabilities = capabilities,
})
vim.lsp.enable("eslint")

vim.lsp.config("sqlls", {
  on_attach = custom_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "sql", "mysql" },
  root_dir = function(_)
    return vim.loop.cwd()
  end,
})
vim.lsp.enable("sqlls")

vim.lsp.config("lua_ls", {
  on_attach = custom_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "require" },
      },
    },
  },
})
vim.lsp.enable("lua_ls")

vim.lsp.config("gopls", {
  on_attach = custom_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      gofumpt = true,
    },
  },
})
vim.lsp.enable("gopls")
