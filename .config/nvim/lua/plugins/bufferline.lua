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
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        modified_icon = "●",
        close_icon = "",
        -- close_icon = '',
        left_trunc_marker = "",
        right_trunc_marker = "",
        diagnostics = "nvim_lsp",
        offsets = {
          { filetype = "vista", text = "Tags", padding = 1 },
          { filetype = "neo-tree", text = "Explorer", padding = 1 },
        }
      }
    })
  end
}
