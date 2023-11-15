return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  config = function()
    local nvim_treesitter = require("nvim-treesitter")
    -- configure nvim-tree
    nvim_treesitter.setup({
      ensure_installed = 'all',
      highlight = { enable = true },
      indent = { enable = true },
      disable = {}
    })
  end
}
