local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- ファイル保存時に余白を消す
autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

autocmd("BufWritePre", {
    pattern = "*",
    command = "silent! !ctags -R -f .tags; --exclude=vendor --exclude=coverage --exclude=node_modules --exclude=config/webpack --exclude=public --exclude=bin",
})

-- ファイルを開いた時に、カーソルの場所を復元する
autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- 改行時にコメントにならないようにする
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})
