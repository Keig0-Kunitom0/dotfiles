return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    vim.keymap.set('n', '<C-f>', '<cmd>Neotree<CR>')
    vim.keymap.set('n', '<C-n>', '<cmd>Neotree close<CR>')
    vim.keymap.set('n', '<leader>gs', '<cmd>Neotree git_status<CR>')
    vim.keymap.set('n', '<leader>b', '<cmd>Neotree buffers<CR>')

    local neo_tree = require('neo-tree')

    neo_tree.setup({
      close_if_last_window = true,
      enable_diagnostics = false,
      source_selector = {
        winbar = true,
        content_layout = "center",
        filesystem = " File",
        buffers = "➜ Buffs",
        git_status = " Git",
        diagnostics = "",
      },
      default_component_configs = {
        indent = {
          padding = 0,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        git_status = {
          symbols = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
      window = {
        width = 35,
        mappings = {
          ["o"] = "open",
          ["v"] = "open_vsplit",
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        follow_current_file = { enabled = true },
        filtered_items = {
          visible = false, -- デフォルトで隠されているかどうか
          show_hidden_count = true,
          hide_dotfiles = false, -- dotfileを隠すかどうか
          hide_gitignored = false, -- gitignoreされているファイルを隠すかどうか
          hide_by_name = {
            "node_modules",
            "thumbs.db",
          },
          never_show = {
            ".git",
            ".DS_Store",
            ".history",
          },
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function(_)
              vim.opt_local.signcolumn = "auto"
            end,
          },
        },
      }
    })
  end
}
