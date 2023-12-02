return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  "williamboman/mason.nvim", -- LSP Installer
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    require("mason").setup {}

    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- install self
        -- "gopls",
        -- "solargraph",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true -- not the same as ensure_installed
    })

    mason_null_ls.setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        -- "rubocop", -- ruby formatter
      },
      -- auto-install configured formatters & linters (with null-ls)
      automatic_installation = true -- not the same as ensure_installed
    })
  end
}
