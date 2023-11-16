-- ref: https://zenn.dev/stafes_blog/articles/524e4c8c80db24 lazygitが立ち上がるようにする

return {
  'akinsho/toggleterm.nvim',
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  version = "*",
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  end
}
