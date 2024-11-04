return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  config = function ()
    require('ibl').setup {
      indent = {
        char = "╎",
      },
    }
  end
}
