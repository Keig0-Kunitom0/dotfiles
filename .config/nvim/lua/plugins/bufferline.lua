return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.keymap.set('n', '<C-.>', '<Cmd>BufferLineCycleNext<CR>', {})
    vim.keymap.set('n', '<C-,>', '<Cmd>BufferLineCyclePrev<CR>', {})
    vim.keymap.set('n', '<leader>q', '<CMD>BufferLinePickClose<CR>')
    vim.keymap.set('n', '<leader>wq', '<CMD>BufferLineCloseOthers<CR>')
    local bufferline = require('bufferline')
    require("bufferline").setup({
      options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.minimal,
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_tab_indicators = true,
        separator_style = {'', ''},
        show_close_icon = false,
        color_icons = true,
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            text_align = "center"
          }
        }
      }
    })
  end
}
