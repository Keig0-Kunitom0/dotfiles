-- ref: https://github.com/yuucu/dotfiles/blob/main/.config/nvim/lua/plugins/gitssigns.lua
-- github: https://github.com/lewis6991/gitsigns.nvim
-- :Copilot setup 実行でCopilotが利用できる（課金が必要）

return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      -- See `:help gitsigns.txt`
      signs = {
        add          = { text = '┆' },
        change       = { text = '┆' },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = '~' },
        untracked    = { text = '┆' }
      }
    })
  end
}
