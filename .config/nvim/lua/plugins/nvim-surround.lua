-- github: https://github.com/kylechui/nvim-surround

return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end
}
