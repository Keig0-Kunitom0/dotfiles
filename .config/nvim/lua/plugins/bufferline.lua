return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  config = function()
    vim.keymap.set('n', '<C-.>', '<Cmd>BufferLineCycleNext<CR>', {})
    vim.keymap.set('n', '<C-,>', '<Cmd>BufferLineCyclePrev<CR>', {})
    local bufferline = require('bufferline')
    require("bufferline").setup {
      options = {
        -- mode = "tabs",
        style_preset = bufferline.style_preset.minimal,
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        diagnostics = "nvim_lsp",
      },
    }
  end
}