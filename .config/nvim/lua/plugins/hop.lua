return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  'phaazon/hop.nvim',
  config = function()
    require('hop').setup({
      keys = 'etovxqpdygfblzhckisuran'
    })
    vim.keymap.set('n', 'ff', '<cmd>HopChar1<CR>')
    vim.keymap.set('n', 'fc', '<cmd>HopLine<CR>')
  end
}

