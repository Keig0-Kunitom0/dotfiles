return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- ruby
    -- solargraph
    lspconfig.solargraph.setup({
      on_attach = on_attach,
      cmd = { "solargraph", "stdio" },
      filetypes = { "ruby" },
    })

    lspconfig.rubocop.setup({
      on_attach = on_attach,
      cmd = { "rubocop", "--lsp" },
      filetypes = { "ruby" },
    })

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      filetypes = { "lua" },
      cmd = { "lua-language-server", "--stdio" }
    })

    lspconfig.tailwindcss.setup({
      on_attach = on_attach,
      filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      cmd = { "tailwindcss-language-server", "--stdio" }
    })
  end
}
