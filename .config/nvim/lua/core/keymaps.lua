local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- leaderキーをカンマに設定
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- jj でINSERTモードに切り替える
keymap("i", "jj", "<ESC>", opts)

-- タブ切り替え
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- コンマの後に自動的にスペースを挿入
keymap("i", ",", ",<Space>", opts)

-- 行の端に行く
keymap("n", "<Space>h", "^", opts)
keymap("n", "<Space>l", "$", opts)

-- ESC*10 でハイライトやめる
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- 全行選択
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Visual --
-- インデントモードに滞在し続ける
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- ファイルのパスをクリップボードにコピーする関数(gitがないと使えない）
-- ref: https://zenn.dev/kenkenlysh/articles/9d6d8c40229d55
local copy_file_path = require("scripts.copy_relative_file_path")
vim.keymap.set('n', 'cp', copy_file_path.copy_relative_file_path, { silent = true, noremap = true })
