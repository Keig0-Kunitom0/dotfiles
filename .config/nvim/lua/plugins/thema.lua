return {
  "folke/tokyonight.nvim",
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  priority = 10000,
  opts = {},
  config = function()
    require('tokyonight').setup({
      -- transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    })
    vim.cmd("colorscheme tokyonight-night")
  end,
}

-- return {
--   "Shatur/neovim-ayu",
--   config = function()
--     local colors = require("ayu.colors")
--     require("ayu").setup({
--       overrides = {
--         Comment = { fg = colors.comment },
--         LspSignatureActiveParameter = { italic = false },
--       },
--     })
--     vim.cmd([[colorscheme ayu-light]])
--     vim.g.terminal_color_0 = "#000000"
--     vim.g.terminal_color_8 = "#323232"

--     -- red
--     vim.g.terminal_color_1 = "#ff3333"
--     vim.g.terminal_color_9 = "#ff6565"

--     -- green
--     vim.g.terminal_color_2 = "#86b300"
--     vim.g.terminal_color_10 = "#b8e532"

--     -- yellow
--     vim.g.terminal_color_3 = "#f29718"
--     vim.g.terminal_color_11 = "#ffc94a"

--     -- blue
--     vim.g.terminal_color_4 = "#41a6d9"
--     vim.g.terminal_color_12 = "#73d8ff"

--     -- magenta
--     vim.g.terminal_color_5 = "#f07178"
--     vim.g.terminal_color_13 = "#ffa3aa"

--     -- cyan
--     vim.g.terminal_color_6 = "#4dbf99"
--     vim.g.terminal_color_14 = "#7ff1cb"

--     vim.g.terminal_color_7 = "#ffffff"
--     vim.g.terminal_color_15 = "#ffffff"
--   end,
-- }

-- return {
--   "ellisonleao/gruvbox.nvim",
--   event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
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
--       transparent_mode = false,
--     })
--     vim.cmd("colorscheme gruvbox")
--   end
-- }
-- return {
--   'ray-x/aurora',
--   event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
--   config = function()
--     vim.cmd([[
--       set termguicolors
--       let g:aurora_italic = 1
--       let g:aurora_transparent = 1
--       let g:aurora_bold = 1
--       let g:aurora_darker = 1
--     ]])
--     vim.cmd('colorscheme aurora')
--     vim.api.nvim_set_hl(0, '@string', {fg='#59E343'})
--     vim.api.nvim_set_hl(0, '@field', {fg='#f93393'})
--     vim.api.nvim_set_hl(0, '@number', {fg='#e933e3'})
--   end
-- }
