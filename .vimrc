" --------------------
" 各プラグイン説明
" --------------------


" -------------------
" ctags タグによるメソッドジャンプ
" -------------------
" 新しいプロジェクトで使用する際には最初に :Ctags を実行する

" 参考 https://qiita.com/gotchane/items/240004235437e559d0bc
" もし使えなくなったら https://qiita.com/aratana_tamutomo/items/59fb4c377863a385e032

" ctrl + ] で定義先ジャンプ（gemのソースコードにも飛べる！)
" ctrl + o で戻る
" g + ctrl + ] で同じ名前のメソッドがある場合複数候補を出す

" 導入手順
" 1. brew install ctags をインストール
" 2. 下記プラグインをインストール
"  'vim-ruby/vim-ruby'
"  'tpope/vim-rails'
"  'tpope/vim-rbenv'
"  'tpope/vim-bundler'
" 3. gem install gem-ctags をインストール
" 4. rbenv ctags をインストール
" 5. gem install guard-ctags-bundler をインストール
" 6. :Ctagsを実行
" ディレクトリ以下に再帰的tagを作成する ctags -R


" --------------------
" coc.nvim LSP
" --------------------
" gd       で定義元ジャンプ
" gr       で定義先ジャンプ
" ctrl + o で前に戻る
" .ruby-version を3.1.2にする
" 新しいディレクトリのrailsに移動した場合、solargraphが入っていない状態なので、gem install solargraphを実行する


" --------------------
" NERDTree フォルダーツリー
" --------------------
" ファイル操作系
" s  で垂直分割して開く
" gs で垂直分割して開くが、ファイルにカーソルは移動しない
" go でファイルを開くが、カーソルはツリーのまま
"
" ディレクトリ操作系
" O  で全ての子ディレクトリを開く
" x  で親ディレクトリを閉じる
" C  ツリーのルートを選択したディレクトリに変更
" u  ツリーのルートを上の階層にする
" cd 選択したディレクトリにcwdを変更する
" I  隠しファイルを表示


" -------------------
" fzf.vim ファイル検索
" -------------------
" ctrl + p でファイル検索を開く
" ctrl + g でgrep検索を開く
" ;r       でカーソル位置の単語をファイル検索する
" ;fr      で選択した単語をファイル検索する
" ;b       でバッファ検索を開く
" ;i       で開いているファイルの文字列検索を開く
" ;h       でファイル閲覧履歴検索を開く
" ;c       でコミット履歴検索を開く
" ;gs      でgit statusのファイル一覧を表示する
" ;f       でカレントディレクトリ以下のファイル一覧を表示する


" --------------------
" 'osyo-manga/vim-over 置換機能
" --------------------
" 全体置換
" space + o で全体置換起動
" space + c でyes or noで確認していきながら置換
" 範囲選択置換（ビジュアルモードで）
" space + o 選択範囲を置換
" space + c 選択範囲をyes or noで確認していきながら置換
" カーソルしたの単語置換
" sb でカーソル下の単語を全て置換
" sc でカーソルしたの単語をyes or noで確認していきながら置換


" --------------------
" vim-gitgutte git関連
" --------------------
" g] で前の変更箇所へ移動する
" g[ で次の変更箇所へ移動する
" gh で差分をハイライトする
" gp でカーソル行のdiffを表示する


" --------------------
" vim-fugitive git関連
" --------------------
" ,ga   でgit addを表示
" ,gs   でgit statusを表示
" ,gd   でgit diffを表示
" ,gbla でgit blameを表示


" ---------------------
"tpope/vim-surround 記号置換
" ---------------------
" cs"' でカーソル位置の外側の括弧を変更
" "Hello world!"
" ↓cs"'
" 'Hello world!'
"
" ds" でカーソル位置の外側の記号を削除
" "Hello world!"
" ↓ds"
" Hello world!


" ---------------------
" tomtom/tcomment_vim コメントアウト・解除機能
" ---------------------
" gcc                               現在のコメント・コメント解除を切り替え
" visualモードで複数選択したのちgc  選択範囲のコメント・コメント解除を切り替え


" --------------------
" mattn/emmet-vim HTML補完
" --------------------
" http://motw.mods.jp/Vim/emmet-vim.html
"
" インサートモードでdivと入力した後にCtrl-v + , で <div></div>になる
"
" インサートモードでhtml:5と入力した後にCtrl-v + , で 下記を生成してくれる
" <!DOCTYPE html>
" <html lang="en">
" <head>
"   <meta charset="UTF-8">
"   <title></title>
" </head>
" <body>
"
" </body>
" </html>
"
" インサートモードでdiv>ul>liと入力した後にCtrl-v + , で 下記を生成してくれる
" <div>
"   <ul>
"     <li></li>
"   </ul>
" </div>"
"
" div>ul>li*3とした場合は下記を生成してくれる（* + 数字 でその数字分要素を作成する
" <div>
"   <ul>
"     <li></li>
"     <li></li>
"     <li></li>
"   </ul>
" </div>"


" ' ---------------------
" その他
" ---------------------
" :bd                 で現在開いているバッファを削除
" lf + 1 or 2文字入力 でその場所に飛べる


" --------------------
" 各種設定
" --------------------
set number            " 画面左端に行番号を表示
set laststatus=2      " 画面最下部に常にステータスラインを表示
set cmdheight=2       " 画面最下部(ステータス行より下)のメッセージ表示欄を2行にする
set showtabline=2     " タブ毎に常にタブラインを表示
set tabstop=2         " タブを2文字分にする
set expandtab         " タブの代わりに半角スペースを使用
set shiftwidth=2      " インデントを半角スペース2文字にする
set smartindent       " 新しい行追加時に自動でインデントを追加
set directory=~/.vim/tmp " swpファイルの出力先を指定
set helplang=ja,en " helpを日本語化
set backspace=indent,eol,start
set hlsearch " 検索文字をハイライト
set clipboard& " クリップボードにコピー
set clipboard+=unnamed
set tags+=gems.tags " タグの設定
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set mouse=a " マウスを有効にする
set noswapfile " spawファイルを作成しない
set cursorline " カーソルラインを有効にする
set ttyfast " ターミナル接続の高速化
let mapleader = "," " Leaderキー
" jjでノーマルモードに切り替え
inoremap <silent> jj <ESC>
" タブ切り替えのコマンド
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l
nnoremap <silent><C-h> <C-w>h


" -------------------
" jsonを整える
" -------------------
command! Jq %!jq '.'


" --------------------
" プラグインマネージャー この中に追加したいプラグインを記載した後 :PlugInstall を実行
" --------------------
call plug#begin('~/.vim/plugged')
  Plug 'vim-jp/vimdoc-ja' " vimのhelpを日本語化
  Plug 'tpope/vim-endwise' " def..endを自動補完
  Plug 'preservim/nerdtree' " ファイルツリー表示
  Plug 'lambdalisue/glyph-palette.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " ファイルを曖昧検索
  Plug 'junegunn/fzf.vim' " ファイルを曖昧検索
  Plug 'airblade/vim-gitgutter' "gitの差分を表示する
  Plug 'Xuyuanp/nerdtree-git-plugin' " NERDTree のファイルとフォルダーの Git ステータス フラグを表示
  Plug 'easymotion/vim-easymotion' " カーソル爆速
  Plug 'ryanoasis/vim-devicons' " ファイルアイコン設定
  Plug 'NLKNguyen/papercolor-theme' "カラースキーム
  Plug 'arcticicestudio/nord-vim'
  Plug 'tomasr/molokai' " カラースキーム
  Plug 'simeji/winresizer' " 画面リサイズ
  Plug 'whatyouhide/vim-gotham' " カラースキーム gotham
  Plug 'osyo-manga/vim-over' " 一斉置換
  Plug 'preservim/nerdcommenter' " コメントアウト
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSPを入れるためのプラグイン、補完やメソッドジャンプなど
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails' " railsのためのプラグイン　対応するspecファイルを開いたりできる
  Plug 'tpope/vim-rbenv'
  Plug 'tpope/vim-bundler'
  Plug 'morhetz/gruvbox' " カラースキーム
  Plug 'altercation/vim-colors-solarized' " カラースキーム
  Plug 'joshdick/onedark.vim' " カラースキーム
  Plug 'jiangmiao/auto-pairs' " カッコ閉じ
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'dense-analysis/ale' " 非同期でエラー箇所をハイライトしてくれる
  Plug 'tpope/vim-fugitive' " git操作
  Plug 'tpope/vim-surround' " 記号置換
  Plug 'tomasr/molokai' " カラースキーム
  Plug 'soramugi/auto-ctags.vim' " タグを勝手に更新してくれる
  Plug 'tomtom/tcomment_vim' " コメントアウト機能
  Plug 'mattn/emmet-vim' " HTMLのためのプラグイン
call plug#end()


" --------------------
" mattn/emmet-vimに関する設定
" --------------------
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'filters' : 'html',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'extends' : 'html',
      \   'filters' : 'html',
      \ },
      \}
augroup EmmitVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
augroup END


" --------------------
" terryma/vim-multiple-cursorsに関する設定
" --------------------
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key = '<leader><leader>' " 複数行選択開始
let g:multi_cursor_quit_key = '<C-q>' " 複数行選択終了


" --------------------
" vim-fugitiveの設定
" --------------------
nnoremap <leader>ga :Git add %:p<Enter>
nnoremap <leader>gd :Git diff<Enter>
nnoremap <leader>gbla :Git blame<Enter>


" --------------------
" dense-analysis/aleに関する設定
" --------------------
" coc.nvimとaleを連携するために必要
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1
" Linterにrubocopを指定
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}
" 指定したlinter以外は実行しないように
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
" 下記のgemをinstallする必要がある
" gem install rubocop
" gem install rubocop-rails
" gem install rubocop-rspec
" gem install rubocop-thread_safety


" --------------------
" vim-airlineに関する設定
" --------------------
" 上部にタブを表示する
let g:airline#extensions#tabline#enabled = 1
" タブに番号を表示
let g:airline#extensions#tabline#buffer_idx_mode = 1
" 番号のフォーマット設定
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}
" タブの区切り文字を変更
let g:airline#extensions#tabline#left_sep = '\'
let g:airline#extensions#tabline#left_alt_sep = '/'
" ステータスバーのフォント設定
let g:airline_powerline_fonts = 1
" ステータスバーのテーマ
" https://github.com/vim-airline/vim-airline-themes/tree/master/autoload/airline/themes
" 下記を定義することで、gruvbox色のairlineテーマを設定できる
let g:airline_theme='gruvbox'
" モード切り替えを早くする
set ttimeoutlen=50


" --------------------
" coc.nvimに関する設定
" --------------------
" 補完設定
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" autocomplete
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"
inoremap <silent><expr> <Esc> coc#pum#visible() ? coc#pum#cancel() : "\<Esc>"
inoremap <silent><expr> <C-h> coc#pum#visible() ? coc#pum#cancel() : "\<C-h>"

" <Tab>で次、<S+Tab>で前
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>" " "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable

" delays and poor user experience.
" set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')



" --------------------
" fzf.vimに関する設定
" --------------------
let g:fzf_action = {
  \ 'ctrl-s': 'split' }
let g:fzf_buffers_jump = 1
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! FZFFileList call fzf#run(fzf#wrap({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
            \ 'down': '40%'}))
" Ctrl+pでファイル検索を開く
nnoremap <C-p> :FZFFileList<CR>
nnoremap <C-g> :Rg<CR>
" ;rでカーソル位置の単語をファイル検索する
nnoremap ;r vawy:rg <c-r>"<cr>
" ;frで選択した単語をファイル検索する
nnoremap ;fr y:rg <c-r>"<cr>
" ;bでバッファ検索を開く
nnoremap ;b :Buffers<CR>
" ;iで開いているファイルの文字列検索を開く
nnoremap ;i :BLines<CR>
" ウィンドウ一覧から選択
nnoremap ;w :Windows<CR>
" ;mでマーク検索を開く
nnoremap ;m :Marks<CR>
" ;hでファイル閲覧履歴検索を開く
nnoremap ;h :History<CR>
" ;cでコミット履歴検索を開く
nnoremap ;c :Commits<CR>
" ;gsでgit statusのファイル一覧を表示する
nnoremap ;gs :GFiles?<CR>
" ;fでカレントディレクトリ以下のファイル一覧を表示する
nnoremap ;f :Files<CR>


" --------------------
" NERDTreeに関する設定
" --------------------
" 開くショートカット
nnoremap <silent><C-n> :NERDTreeToggle<CR>
" 開いているファイルをツリーで表示
nnoremap <silent><C-f> :NERDTreeFind<CR>
" NERDTree が最後のウィンドウの場合、Vim またはタブを自動的に閉じる
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap [nerd]   <Nop>
nmap <Space>n [nerd]
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeStatusLine = -1
" ブックマークを表示
let g:NERDTreeShowBookmarks=1
" 隠しファイルを表示
let g:NERDTreeShowHidden=1


" --------------------
" vim-gitgutte関する設定
" --------------------
" 参考: https://snyt45.com/0NYYNNE2r
"
" g]で前の変更箇所へ移動する
nnoremap g[ :GitGutterPrevHunk<CR>
" g[で次の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>
" ghでdiffをハイライトする
nnoremap gh :GitGutterLineHighlightsToggle<CR>
" gpでカーソル行のdiffを表示する
nnoremap gp :GitGutterPreviewHunk<CR>
" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete ctermfg=red
" 常に左側のサイン列を表示させる
set signcolumn=yes
" ファイルを変更してサイン列を表示させるまでにかかる時間を100msにする
set updatetime=100
" GitGutter styling to use · instead of +/-
nmap ]g :GitGutterNextHunk<CR>
nmap [g :GitGutterPrevHunk<CR>
" サイン列の背景と記号の色を設定している
augroup vimrc_vim_gitgutter
  autocmd!
  " sign column bg color
  autocmd VimEnter,ColorScheme * highlight SignColumn guibg=bg ctermbg=bg
  " sign column color
  autocmd VimEnter,ColorScheme * highlight GitGutterAdd guifg=#000900 ctermfg=2
  autocmd VimEnter,ColorScheme * highlight GitGutterChange guifg=#bbbb00 ctermfg=3
  autocmd VimEnter,ColorScheme * highlight GitGutterDelete guifg=#ff2222 ctermfg=1
augroup END


" --------------------
" vim-easymotionに関する設定
" --------------------
" ff入力後、飛びたい部分の文字を一文字入力するとそこに飛べる
map ff <Plug>(easymotion-bd-f2)
nmap ff <Plug>(easymotion-overwin-f2)


" --------------------
" 空白文字をハイライトする
" --------------------
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END


" ----------------------------------------------------------------------------
" Color Scheme
" ----------------------------------------------------------------------------
" gotham
" colorscheme gotham256
" let g:lightline = { 'colorscheme': 'gotham256' }

" gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set t_Co=256
let g:ligthline = { 'colorscheme': 'gruvbox' }
" gruvboxの色をより鮮やかにする（参考: https://github.com/morhetz/gruvbox/wiki/Terminal-specific)
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" 背景色を黒にする

" colorscheme onedark
" syntax on
" colorscheme molokai
" iTerm2で半透明にしているが、vimのcolorschemeを設定すると背景も変更されるため
" highlight Normal ctermbg=none
" syntax enable
" set background=dark
" colorscheme solarized

" ----------------------------------------------------------------------------
" specファイルのパスをクリップボードにコピーする関数
" ----------------------------------------------------------------------------
function! CopySpecPath()
  let absolute_path = expand("%:p")
  let @* = absolute_path[stridx(absolute_path, "spec/"):]
endfunction
nnoremap cps :call CopySpecPath()<CR>


" ----------------------------------------------------------------------------
" testファイルのパスをクリップボードにコピーする関数
" ----------------------------------------------------------------------------
function! CopyTestPath()
  let absolute_path = expand("%:p")
  let @* = absolute_path[stridx(absolute_path, "test/"):]
endfunction
nnoremap cpt :call CopyTestPath()<CR>


" ----------------------------------------------------------------------------
" appファイルのパスをクリップボードにコピーする関数
" ----------------------------------------------------------------------------
function! CopyPath()
  let absolute_path = expand("%:p")
  let @* = absolute_path[stridx(absolute_path, "app/"):]
endfunction
nnoremap cp :call CopyPath()<CR>


" ----------------------------------------------------------------------------
" 'osyo-manga/vim-overの設定
" ----------------------------------------------------------------------------
" 簡単に置換ができる
" 全体置換
nnoremap <silent> <Space>o :OverCommandLine<CR>%s//g<Left><Left>
nnoremap <silent> <Space>c :OverCommandLine<CR>%s//gc<Left><Left><Left>
" 選択範囲置換
vnoremap <silent> <Space>o :OverCommandLine<CR>s//g<Left><Left>
vnoremap <silent> <Space>c :OverCommandLine<CR>s//gc<Left><Left><Left>
" カーソルしたの単語置換
nnoremap sb :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
nnoremap sc :OverCommandLine<CR>%s/<C-r><C-w>//gc<Left><Left><Left>


" タグを </ が入力されたときに自動的に補完するようにする
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END


" ------------------
" 編集行ハイライト
" -----------------
hi CursorLine term=bold ctermfg=159
