-- ref: https://blog.codeminer42.com/configuring-language-server-protocol-in-neovim/

return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    -- for conciseness
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters
    local conditional = function(fn)
      local utils = require("null-ls.utils").make_conditional_utils()
      return fn(utils)
    end

    null_ls.setup({
      -- setup formatters & linters
      sources = {
        --  to disable file types use
        --  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)
        formatting.prettier, -- js/ts formatter
        formatting.stylua, -- lua formatter

        diagnostics.eslint_d.with({ -- js/ts linter
          -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
          condition = function(utils)
            return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
          end,
        }),

        -- Here we set a conditional to call the rubocop formatter. If we have a Gemfile in the project, we call "bundle exec rubocop", if not we only call "rubocop".
        conditional(function(utils)
          return utils.root_has_file("Gemfile")
          and null_ls.builtins.formatting.rubocop.with({
            command = "bundle",
            args = vim.list_extend(
            { "exec", "rubocop" },
            null_ls.builtins.formatting.rubocop._opts.args
            ),
          })
          or null_ls.builtins.formatting.rubocop
        end)
      }
    })
  end
}
