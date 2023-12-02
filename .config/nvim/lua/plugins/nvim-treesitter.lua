return {
  event = "VimEnter", -- neovim起動時にプラグインが読み込まれるようにする
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise'
  },
  config = function()
    local nvim_treesitter = require("nvim-treesitter")
    -- configure nvim-tree
    nvim_treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      endwise = { enable = true },
      ensure_installed = {
        "json",
        "js",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "dockerfile",
        "gitignore",
        "ruby",
        "lua"
      },
      -- auto install above language parsers
      auto_install = true,
    })

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.erb = {
      install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-embedded-template", -- local path or git repo
        files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "master", -- default branch in case of git repo if different from master
        requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
      },
      filetype = "erb", -- if filetype does not match the parser name
    }
  end
}
