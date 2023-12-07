return {
  event = 'VimEnter',
  'nvimdev/lspsaga.nvim',
  -- cond = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',  -- optional
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        title = true,
        border = "double",
      },
      symbol_in_winbar = {
        enable = true,
        priority = 1000,
      },
      code_action_lightbulb = {
        enable = true,
      },
      show_outline = {
        win_width = 60,
        auto_preview = false,
      },
    })

    local keymap = vim.keymap.set

    keymap("n", "K",  "<cmd>Lspsaga hover_doc<CR>")
    keymap('n', 'gh', '<cmd>Lspsaga finder<CR>')
    keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
    keymap("n", "go", "<cmd>Lspsaga goto_definition<CR>")
    keymap("n", "ga", "<cmd>Lspsaga code_action<CR>")
    keymap("n", "rn", "<cmd>Lspsaga rename<CR>")
    keymap("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
    keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
    keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
    keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
    keymap('n', "<Leader>t", "<cmd>Lspsaga term_toggle<CR>")
  end,
}
