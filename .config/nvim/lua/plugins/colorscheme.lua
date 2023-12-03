return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  "arturgoms/moonbow.nvim",
  config = function()
    vim.cmd([[colorscheme moonbow]])
  end
}

-- return {
--   event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = function()
--     vim.o.background = "dark" -- or "light" for light mode
--     vim.cmd([[colorscheme gruvbox]])
--   end
-- }

-- return {
--   event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
--   'sjl/badwolf',
--   config = function()
--     vim.cmd("colorscheme badwolf")
--   end
-- }

-- return {
-- 	{
--     event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
-- 		"craftzdog/solarized-osaka.nvim",
-- 		priority = 1000,
-- 		config = function()
--       vim.cmd("colorscheme solarized-osaka")
-- 		end
-- 	}
-- }

-- return {
--   event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
--   'p00f/alabaster.nvim',
--   priority = 1000 ,
--   config = function()
--     vim.cmd([[colorscheme alabaster]])
--   end
-- }
