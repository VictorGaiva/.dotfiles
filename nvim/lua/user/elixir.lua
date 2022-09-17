local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


lspconfig.elixirls.setup({
  cmd = {vim.fn.expand("~/.dotfiles/elixir-ls/bin/language_server.sh")},
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern('.git'),
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
      -- filetypes = { "elixir", "eelixir" },
    }
  }
})
