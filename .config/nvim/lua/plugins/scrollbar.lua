return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  "petertriho/nvim-scrollbar",
  config = function()
    local colors = require("solarized-osaka.colors").setup()

    require("scrollbar").setup({
      handle = {
        color = colors.bg_highlight,
      },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      }
    })
  end
}
