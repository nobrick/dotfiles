set nocompatible

" Use old compatible regex engine
set regexpengine=1

"let g:ruby_path=system('/Users/tornado/.rvm/rubies/ruby-2.0.0-p247')
"let g:ruby_path = system('rvm current')

let g:ruby_path = system('echo $HOME/.rbenv/shims')

let g:pathogen_disabled = []
if !has('gui_running')
    call add(g:pathogen_disabled, 'YouCompleteMe')
    "call add(g:pathogen_disabled, 'Command-T')
endif

call pathogen#infect()

syntax on
set showcmd
set ruler

filetype plugin indent on

set incsearch
set smartcase
set autoread		" auto read when file is changed from outside
set wildmenu            " wild char completion menu
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc
set wildignore+=*.mp3,*.mp4,*.dmg,*.jpg,*.zip,*.gz,*.rar,*.png,*.pdf,*.gif,*.doc,*.ppt,*.docx,*.exe,*.pptx,*.rtf,*.part,*.flv,*.jar,*.graffle,*.xls,*.mobi,*.doentry,*.swp
set wildignore+=tmp/*

"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set gfn=Monaco:h16

set smartindent

set expandtab
au FileType Makefile set noexpandtab

set tabstop=2
set softtabstop=2
set shiftwidth=2

fu SetTabStop2()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
endf
au BufRead,BufNewFile *.rb,*.yml,*.erb call SetTabStop2()

au BufRead words.txt,COMMIT_EDITMSG setlocal spell


let mapleader="\\" 
" <Leader>t,b already used for Command T plugin
map <C-Enter> <Leader>b

noremap z1 :NERDTreeToggle<CR>
noremap z2 :TagbarToggle<CR>
noremap z3 :GundoToggle<CR>

noremap <Leader>j :NERDTreeToggle<CR>
noremap <Leader>k :TagbarToggle<CR>
noremap <Leader>u :GundoToggle<CR>

noremap <C-s> :mks!$HOME/Session.vim<CR>
noremap <C-\>l :so $HOME/Session.vim<CR>

noremap <C-h> gT
inoremap <C-h> <ESC>gT
noremap <C-l> gt
inoremap <C-l> <ESC>gt

noremap <C-t><C-t> :tabnew<CR>
noremap <C-t>t :tabnew<CR>
noremap <C-t><C-c> :tabclose<CR>
noremap <C-t>c :tabclose<CR>
noremap <Space> <C-f>

set mouse=a
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set guioptions=egmrLt
set guioptions=egt
colorscheme peaksea

"set path+=~/gccLab/gcc-4.6.2/gcc/,~/gccLab/test101/,~/gccLab/gcc-4.6.2/research/,~/Dropbox/notes/
set path+=~/Dropbox/notes/

inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-k> <C-o>D
inoremap <C-f> <Right>
inoremap <C-b> <Left>

set display=lastline

set undodir=~/.vim_undos
set undolevels=1000
set undofile

let g:EasyMotion_keys = '1234567890abcdefghijklmnopqrstuvwxyz[\],-/.=;'
let g:EasyMotion_leader_key = '9'
hi link EasyMotionShade  Comment

"let g:CommandTMaxCachedDirectories=3
let g:CommandTMaxDepth=4

cd ~/Dropbox


"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"inoremap < <><Left>
"inoremap " ""<Left>
noremap <C-f> <Right>

set noimd
if has("gui_running")
    set noshowmode
    set imactivatekey=C-space
    set imsearch=0
    set iminsert=0
endif

if has("gui_macvim")
    set invmacmeta
    "noremap <D-f> w
    "noremap <D-b> b
    "noremap <D-j> gj
    "noremap <D-k> gk

    "inoremap <D-f> <C-o>w
    "inoremap <D-b> <C-o>b
    "inoremap <D-j> <C-o>gj
    "inoremap <D-k> <C-o>gk

    noremap <M-f> w
    noremap <M-b> b
    inoremap <M-f> <C-o>w
    inoremap <M-b> <C-o>b

    "imap <M-f> <ESC><M-f>
    "imap <M-d> <ESC><M-d>
    
    inoremap <M-j> <C-o>8j
    inoremap <M-k> <C-o>8k
    noremap <M-j> 8j
    noremap <M-k> 8k

    inoremap <M-h> <C-o>H
    inoremap <M-m> <C-o>M
    inoremap <M-l> <C-o>L
    noremap <M-h> H
    noremap <M-m> M
    noremap <M-l> L

    inoremap <D-d> <C-o>zz
    noremap <D-d> <C-d>

    let macvim_hig_shift_movement = 1
endif

noremap <C-e> <C-u>

cmap cd. lcd %:p:h<CR>
cmap <C-a> <Home>
cmap cdd cd ~/Dropbox/
cmap cdr cd ~/my_rails/
cmap cdp cd ~/p/
"cmap w. w !sudo tee

noremap <C-m>. :lcd %:p:h<CR>

"noremap <C-m>g :cd ~/gitRepos/<CR>
noremap <C-m>p :cd ~/p<CR>
noremap <C-m>r :cd ~/my_rails/depot<CR>
noremap <C-m>d :cd ~/Dropbox/notes/<CR>
noremap <C-m><C-m> :CommandT<CR>
noremap <Leader>t :CommandTTag<CR>

map <Leader>\ <Leader>c<Space>

map <C-y> "*y

set linebreak

"omni
"inoremap <C-o> <C-x><C-o>

"not compatible with pry + youcompleteme, set disabled
let g:rubycomplete_buffer_loading = 0 "cause code execution, at risk

let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_use_bundler = 1
let g:rubycomplete_rails = 1
set omnifunc=syntaxcomplete#Complete

let g:ycm_completion_confirm_key = '<enter>'
let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"au BufRead life.en let g:ycm_auto_trigger = 0

fu YcmToggle()
  if g:ycm_auto_trigger
    let g:ycm_auto_trigger = 0
    echo "Auto Trigger Off"
  else
    let g:ycm_auto_trigger = 1
    echo "Auto Trigger On"
  endif
endfu
nnoremap <Leader>y :call YcmToggle()<CR>

nnoremap <M-d> :Dash<CR>

"let g:ycm_key_invoke_completion = '<C-/>'

"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_disable_auto_complete = 0
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_fuzzy_completion = 1
"inoremap <C-n> <C-x><C-u>

set cryptmethod=blowfish

set nobackup
set noswapfile

set nolinebreak

autocmd BufReadPost,BufNewFile *_spec.rb set syntax=rspec

let g:vim_markdown_folding_disabled=1

set noballooneval

let g:UltiSnipsListSnippets = '<C-tab>'
let g:UltiSnipsEditSplit = 'vertical'
if has("gui_macvim")
  let g:UltiSnipsExpandTrigger = '<D-f>'
  let g:UltiSnipsJumpForwardTrigger = '<D-j>'
  let g:UltiSnipsJumpBackwardTrigger = '<D-u>'
endif
