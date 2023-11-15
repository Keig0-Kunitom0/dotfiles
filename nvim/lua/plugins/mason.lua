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
      -- vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
      -- vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
      -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
      -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.definition()<CR>')
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
      -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
      -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
      -- vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
      -- vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
      -- vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
      -- vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
      -- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
      -- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
      )
      vim.opt.signcolumn = "yes"

      -- rubocop lsp
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "ruby",
        callback = function()
          vim.lsp.start {
            name = "rubocop",
            cmd = { "bundle", "exec", "rubocop", "--lsp" },
          }
        end,
      })
    end

    local lsp = require("lspconfig")
    lsp.solargraph.setup { on_attach = on_attach }

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
