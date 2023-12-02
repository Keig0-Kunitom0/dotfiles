return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  'sjl/badwolf',
  config = function()
    vim.cmd("colorscheme badwolf")
  end
}

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
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000 ,
--   config = function()
--     require("gruvbox").setup({
--       terminal_colors = true, -- add neovim terminal colors
--       undercurl = true,
--       underline = true,
--       bold = true,
--       italic = {
--         strings = true,
--         emphasis = true,
--         comments = true,
--         operators = false,
--         folds = true,
--       },
--       strikethrough = true,
--       invert_selection = false,
--       invert_signs = false,
--       invert_tabline = false,
--       invert_intend_guides = false,
--       inverse = true, -- invert background for search, diffs, statuslines and errors
--       contrast = "", -- can be "hard", "soft" or empty string
--       palette_overrides = {},
--       overrides = {},
--       dim_inactive = false,
--       transparent_mode = false
--     })
--     vim.o.background = "dark" -- or "light" for light mode
--     vim.cmd([[let g:gruvbox_contrast_dark='hard']])
--     vim.cmd([[colorscheme gruvbox]])
--   end
-- }

-- return {
--   event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
--   'p00f/alabaster.nvim',
--   priority = 1000 ,
--   config = function()
--     vim.cmd([[colorscheme alabaster]])
--   end
-- }
