-- ref: https://zenn.dev/stafes_blog/articles/524e4c8c80db24 lazygitが立ち上がるようにする

return {
  'akinsho/toggleterm.nvim',
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  version = "*",
  config = function()
    require("toggleterm").setup({
      shell = vim.o.shell
    })
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true
    })
    local float_term = Terminal:new({
      direction = "float",
      hidden = true
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    function _float_term()
      float_term:toggle()
    end

    vim.api.nvim_set_keymap("n", "lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "lt", "<cmd>lua _float_term()<CR>", { noremap = true, silent = true })
  end
}
