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
    "nvim-tree/nvim-web-devicons",
    {
      "Allianaab2m/telescope-kensaku.nvim",
      config = function()
        require("telescope").load_extension("kensaku") -- :Telescope kensaku
      end
    }
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ['<C-h>'] = 'which_key',
            ['<esc>'] = require('telescope.actions').close,
            ['<C-[>'] = require('telescope.actions').close,
          },
          n = {
            ['<C-h>'] = 'which_key',
          }
        },
        path_display = { "truncate " },
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
        },
        winblend = 20,
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    })
    telescope.load_extension("fzf")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files hidden=true<CR>')
    vim.keymap.set('n', '<C-g>', '<cmd>Telescope live_grep<CR>')
    vim.keymap.set('n', ';b', builtin.buffers, {})
    vim.keymap.set('n', ';g', builtin.git_status, {})
    vim.keymap.set('n', ';fh', builtin.help_tags, {})
    vim.keymap.set('n', ';r', builtin.grep_string, {})
    vim.keymap.set('n', ';h', builtin.oldfiles, {})
    vim.keymap.set('n', ';gs', builtin.git_stash, {})
    vim.keymap.set('n', ';gb', builtin.git_branches, {})
    vim.keymap.set('n', ';gc', builtin.git_bcommits, {})
  end
}
