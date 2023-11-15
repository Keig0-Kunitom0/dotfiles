-- ref: https://github.com/yuucu/dotfiles/blob/main/.config/nvim/lua/plugins/telescope.lua
-- github: https://github.com/nvim-telescope/telescope.nvim

return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  'nvim-telescope/telescope.nvim',
  cmd = {
    "Telescope",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        path_display = { "truncate " }
      }
    })
    telescope.load_extension("fzf")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
    vim.keymap.set('n', ';b', builtin.buffers, {})
    vim.keymap.set('n', ';gs', builtin.git_files, {})
    vim.keymap.set('n', ';fh', builtin.help_tags, {})
    vim.keymap.set('n', ';r', builtin.grep_string, {})
    vim.keymap.set('n', ';h', builtin.oldfiles, {})
  end
}
