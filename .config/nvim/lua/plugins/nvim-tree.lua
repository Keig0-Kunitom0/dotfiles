-- ref: https://github.com/yuucu/dotfiles/blob/main/.config/nvim/lua/plugins/nvim-tree.lua
-- github: https://github.com/nvim-tree/nvim-tree.lua

return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 45,
        relativenumber = false,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = false
        },
        highlight_git = true,
        highlight_opened_files = 'name',
        icons = {
          glyphs = {
            git = {
              unstaged = '!',
              renamed = '»',
              untracked = '?',
              deleted = '✘',
              staged = '✓',
              unmerged = '',
              ignored = '◌',
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          quit_on_open = true,
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    vim.keymap.set("n", "<C-f>", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file on current file" }) -- toggle file explorer on current file
    vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file" }) -- toggle file
    vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })   -- refresh file explorer
  end
}
