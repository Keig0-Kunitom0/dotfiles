return {
  "williamboman/mason.nvim", -- LSP Installer
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
  },
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  config = function()
    require("mason").setup {}
    local mason_lspconfig = require("mason-lspconfig")
    -- 2. build-in LSP function
    -- keyboard shortcut
    local on_attach = function(_, bufnr)
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
      )
      vim.opt.signcolumn = "yes"
    end

    local lsp = require("lspconfig")

    mason_lspconfig.setup_handlers({
      function(server_name)
        local opts = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          on_attach = on_attach,
          settings = {
            ["omniSharp"] = {
              useGlobalMono = "always"
            }
          },
        }

        lsp[server_name].setup(opts)
      end,
    })

    vim.cmd("LspStart") -- 初回起動時はBufEnterが発火しない
  end,
}
