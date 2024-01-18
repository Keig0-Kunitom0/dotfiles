return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
			local logo = [[
                                             
      ████ ██████           █████      ██
     ███████████             █████ 
     █████████ ███████████████████ ███   ███████████
    █████████  ███    █████████████ █████ ██████████████
   █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████
]]
    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("l", "󰒲 " .. "Lazy Git", ":lua _lazygit_toggle()<CR>"),
      dashboard.button("f", " " .. " Find file", ":Telescope find_files hidden=true<CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    dashboard.opts.layout[1].val = 10
    return dashboard
  end,
  config = function(_, dashboard)
    require("alpha").setup(dashboard.opts)
    vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
    ]])
    vim.api.nvim_create_autocmd("User", {
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100) / 100
        dashboard.section.footer.val = "󱐌 Lazy-loaded "
        .. stats.loaded
        .. "/"
        .. stats.count
        .. " plugins in "
        .. ms
        .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
