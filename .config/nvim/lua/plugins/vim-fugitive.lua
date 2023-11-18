return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>") -- open git status
  end
}
