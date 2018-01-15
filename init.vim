" dein from: https://qiita.com/hanaclover/items/f45250b55e2298c4ac5a {{{
" dein 自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み & キャッシュ作成
let s:dein_toml = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:dein_lazy_toml = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
" プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" 設定 {{{
let python3_path = system('which python3')
if !v:shell_error
  let g:python3_host_prog = system('which python3 | tr -d "\n"')
endif
" }}}
