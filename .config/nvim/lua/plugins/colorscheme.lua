-- return {
--   event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
--   "arturgoms/moonbow.nvim",
--   config = function()
--     vim.cmd([[colorscheme moonbow]])
--   end
-- }

-- return {
--   event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
--   "tiagovla/tokyodark.nvim",
--   opts = {
--     transparent_background = true,
--     -- custom options here
--   },
--   config = function(_, opts)
--     require("tokyodark").setup(opts) -- calling setup is optional
--     vim.cmd [[colorscheme tokyodark]]
--   end,
-- }

-- return {
--   event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
--   "sekke276/dark_flat.nvim",
--   config = function()
--     require("dark_flat").setup({
--       transparent = true
--     })
--     vim.cmd([[colorscheme dark_flat]])
--   end
-- }


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

return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  "rockyzhang24/arctic.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  name = "arctic",
  branch = "main",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme arctic")
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
