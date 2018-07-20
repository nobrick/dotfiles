set nocompatible
set noballooneval

call plug#begin()
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'

Plug 'wincent/command-t', {
      \ 'do': 'cd ruby/command-t/ext/command-t && make clean && ruby extconf.rb && make' }

Plug 'Valloric/YouCompleteMe', {
      \ 'do': './install.py' }

Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'

Plug 'vim-scripts/matchit.zip'
"Plug 'Yggdroot/indentLine' # Improperly handling quotation marks in .json files.
Plug 'vim-scripts/indent-motion'
Plug 'lukaszb/vim-web-indent'

Plug 'plasticboy/vim-markdown'
Plug 'slim-template/vim-slim'
Plug 'kchmck/vim-coffee-script'

Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'keith/rspec.vim'
"Plug 'thoughtbot/vim-rspec'

Plug 'davidhalter/jedi-vim'

Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
"Plug 'larrylv/ycm-elixir'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'jbmorgado/vim-pine-script'
call plug#end()

" Use old compatible regex engine
"set regexpengine=1

"let $PYTHONHOME="/opt/local/Library/Frameworks/Python.framework/Versions/2.7"

"let g:ruby_path=system('/Users/tornado/.rvm/rubies/ruby-2.0.0-p247')
"let g:ruby_path = system('echo $HOME/.rbenv/shims')
"let g:ruby_path = system('/Users/tornado/.rbenv/versions/2.1.0/bin')

"syntax on
set showcmd

filetype plugin indent on

set incsearch
set smartcase
set autoread		" auto read when file is changed from outside
set wildmenu            " wild char completion menu
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc
set wildignore+=*.mp3,*.mp4,*.dmg,*.jpg,*.zip,*.gz,*.rar,*.png,*.pdf,*.gif,*.doc,*.ppt,*.docx,*.exe,*.pptx,*.rtf,*.part,*.flv,*.jar,*.graffle,*.xls,*.mobi,*.doentry,*.swp,*.beam,node_modules,_build
set wildignore+=tmp/*

"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set macligatures
set guifont=Fira\ Code:h17
"set guifont=Hack:h16
"set guifont=Monaco:h16
"set guifont=Fira\ Code\ Retina:h17

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

noremap z1 :NERDTreeToggle<CR>
noremap z2 :TagbarToggle<CR>
noremap z3 :GundoToggle<CR>

noremap <Leader>j :NERDTreeToggle<CR>
noremap <Leader>k :TagbarToggle<CR>
noremap <Leader>u :GundoToggle<CR>

let g:NERDTreeMapQuit="<Nop>"

"noremap <C-s> :mks!$HOME/Session.vim<CR>
"noremap <C-\>l :so $HOME/Session.vim<CR>

set mouse=a
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set guioptions=egmrLt
set guioptions=egt
colorscheme peaksea_nobold
"colorscheme slate

set path+=~/Dropbox/notes/

inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-k> <C-o>D

set display=lastline

set undodir=~/.vim_undos
set undolevels=1000
set undofile

let g:EasyMotion_keys = '1234567890abcdefghijklmnopqrstuvwxyz[\],-/.=;'
let g:EasyMotion_leader_key = '-'
hi link EasyMotionShade  Comment

"let g:CommandTMaxCachedDirectories=3
let g:CommandTMaxDepth=6

"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"inoremap < <><Left>
"inoremap " ""<Left>

set noimd
if has("gui_running")
    set noshowmode
    set imactivatekey=C-space
    set imsearch=0
    set iminsert=0
endif

if has("gui_macvim")
    set invmacmeta
    noremap <M-f> w
    noremap <M-b> b
    inoremap <M-f> <C-o>w
    inoremap <M-b> <C-o>b

    "imap <M-f> <ESC><M-f>
    "imap <M-d> <ESC><M-d>
    
    "inoremap <M-j> <C-o>8j
    "inoremap <M-k> <C-o>8k
    "noremap <M-j> 8j
    "noremap <M-k> 8k

    "inoremap <M-h> <C-o>H
    inoremap <M-m> <C-o>M
    "inoremap <M-l> <C-o>L
    "noremap <M-h> H
    noremap <M-m> M
    "noremap <M-l> L

    "inoremap <D-d> <C-o>zz
    inoremap <D-d> <Space>do<CR>end<Esc>O
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

map <Leader>\ <Leader>c<Space>

map <C-y> "*y
map <C-y><C-y> "*yy

set linebreak

"omni
"inoremap <C-o> <C-x><C-o>

"not compatible with pry + youcompleteme, set disabled
"let g:rubycomplete_buffer_loading = 0 "cause code execution, at risk

"let g:rubycomplete_classes_in_global = 0
"let g:rubycomplete_load_gemfile = 0
"let g:rubycomplete_use_bundler = 0
"let g:rubycomplete_rails = 0
"set omnifunc=syntaxcomplete#Complete

let g:ycm_completion_confirm_key = '<enter>'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 0
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
autocmd FileType ruby set omnifunc=

let g:vim_markdown_folding_disabled=1

let g:UltiSnipsListSnippets = '<C-tab>'
let g:UltiSnipsEditSplit = 'vertical'
if has("gui_macvim")
  let g:UltiSnipsExpandTrigger = '<D-f>'
  let g:UltiSnipsJumpForwardTrigger = '<D-j>'
  let g:UltiSnipsJumpBackwardTrigger = '<D-k>'
endif

set noballooneval
set number relativenumber
hi Search guibg=LightBlue

nnoremap <C-m>. :lcd %:p:h<CR>
nnoremap <C-m>s :cd ~/elixir/scalpel<CR>
nnoremap <C-m>b :cd ~/elixir/reborn<CR>
nnoremap <C-m>m :cd ~/elixir/mario_hedge<CR>
nnoremap <C-m>t :cd ~/elixir/tempest<CR>
nnoremap <C-m>r :cd ~/my_rails/ruby-china<CR>
nnoremap <C-m>k :cd ~/my_rails/kano<CR>

nnoremap <C-t><C-t> :tabnew<CR>
nnoremap <C-t>t :tabnew<CR>
nnoremap <C-t><C-c> :tabclose<CR>
nnoremap <C-t>c :tabclose<CR>

nnoremap <D-F1> <C-w>t
nnoremap <D-F2> <C-w>t<C-w>w
nnoremap <D-F3> <C-w>t<C-w>w<C-w>w
nnoremap <D-F4> <C-w>t<C-w>w<C-w>w<C-w>w
nnoremap <D-F5> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w
nnoremap <D-F6> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w
nnoremap <D-F7> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w
nnoremap <D-F8> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w
nnoremap <D-F9> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w
nnoremap <D-1> <C-w>t<C-w>_
nnoremap <D-2> <C-w>t<C-w>w<C-w>_
nnoremap <D-3> <C-w>t<C-w>w<C-w>w<C-w>_
nnoremap <D-4> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>_
nnoremap <D-5> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w<C-w>_
nnoremap <D-6> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>_
nnoremap <D-7> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>_
nnoremap <D-8> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>_
nnoremap <D-9> <C-w>t<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>w<C-w>_
nnoremap <M-F1> <C-w>b
nnoremap <M-F2> <C-w>b<C-w>W
nnoremap <M-F3> <C-w>b<C-w>W<C-w>W
nnoremap <M-F4> <C-w>b<C-w>W<C-w>W<C-w>W
nnoremap <M-F5> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>W
nnoremap <M-F6> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W
nnoremap <M-F7> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W
nnoremap <M-F8> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W
nnoremap <M-F9> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W
nnoremap <M-1> <C-w>b<C-w>_
nnoremap <M-2> <C-w>b<C-w>W<C-w>_
nnoremap <M-3> <C-w>b<C-w>W<C-w>W<C-w>_
nnoremap <M-4> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>_
nnoremap <M-5> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>W<C-w>_
nnoremap <M-6> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>_
nnoremap <M-7> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>_
nnoremap <M-8> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>_
nnoremap <M-9> <C-w>b<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>W<C-w>_
noremap <C-h> gT
inoremap <C-h> <ESC>gT
noremap <C-l> gt
inoremap <C-l> <ESC>gt

nnoremap qJ <C-w>j<C-w>_
nnoremap qK <C-w>k<C-w>_
nnoremap qH <C-w>h<C-w>_
nnoremap qL <C-w>l<C-w>_

nnoremap q<C-j> <C-w>J
nnoremap q<C-k> <C-w>K
nnoremap q<C-h> <C-w>H
nnoremap q<C-l> <C-w>L

"nnoremap qu <C-w>l<C-w>j
"nnoremap qm <C-w>h<C-w>j
"nnoremap qi <C-w>l<C-w>k
"nnoremap q, <C-w>h<C-w>k
"nnoremap qU <C-w>l<C-w>j<C-w>_
"nnoremap qM <C-w>h<C-w>j<C-w>_
"nnoremap qI <C-w>l<C-w>k<C-w>_
"nnoremap q< <C-w>h<C-w>k<C-w>_

nnoremap qm 1<C-w>_

nnoremap q<Space> <C-w>_
nnoremap q; <C-w>p
nnoremap <D-CR> :resize<CR>:vertical resize<CR>

nnoremap qg <C-w>10k
nnoremap qG <C-w>10j

nnoremap q` <C-w>t
nnoremap q/ <C-w>b
nnoremap qz <C-w>t<C-w>10j
nnoremap q[ <C-w>b<C-w>10k
nnoremap q~ <C-w>t<C-w>_
nnoremap q? <C-w>b<C-w>_
nnoremap qZ <C-w>t<C-w>10j<C-w>_
nnoremap q{ <C-w>b<C-w>10k<C-w>_

nnoremap q' <C-w>19_
nnoremap q" <C-w>28_
nnoremap q <C-w>
nnoremap Q q

nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_

nnoremap <Leader>t :CommandTTag<CR>
nnoremap <C-m><C-m> :CommandT<CR>
nnoremap <S-Enter><S-Enter> <C-w>_:CommandT<CR>
nnoremap q<Enter> <C-w>s<C-w>_:CommandT<CR>
nnoremap <Tab> :CommandTBuffer<CR>
nnoremap <S-Tab> <C-w>_:CommandTBuffer<CR>
nnoremap q<Tab> <C-w>s<C-w>_:CommandTBuffer<CR>

" Make <C-i> independent of <Tab> through Karabiner (which maps it into <C-\>)
nnoremap <C-\> <C-i>

set noequalalways
"set notimeout
"set nottimeout
set timeoutlen=500
set ruler
set rulerformat=%25(%{strftime('%H:%M')}\ %7l,%-6(%c%V%)\ %P%)
set scrolloff=1
set hlsearch

let g:alchemist_tag_disable = 1
let g:alchemist_tag_map = 0
let g:alchemist_tag_stack_map = 0

let g:indentLine_color_gui = '#DCEAD5'
let g:indentLine_char = '│'

let g:AutoPairsFlyMode = 1
let g:AutoPairsMapCh = 0
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutFastWrap = '<M-w>'
let g:AutoPairsShortcutBackInsert = ''
" Mapped to Cmd-p by Karabiner
let g:AutoPairsShortcutToggle = '<D-b>'

autocmd FileType elixir nnoremap K :call alchemist#exdoc()<CR><C-w>p
nnoremap <D-u> <C-w>p<C-w>q
nnoremap gt :Tabularize 
vnoremap gt :Tabularize 
nnoremap g/ :Tabularize /
vnoremap g/ :Tabularize /
nnoremap <silent> gn :noh<CR>
nnoremap gi :IndentLinesToggle<CR>
inoremap wj <Space>when<Space>
cd ~/elixir

" FZF settings
set rtp+=~/.fzf
let g:fzf_command_prefix = 'Fzf'

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_buffers_jump = 1

let g:fzf_files_options =
  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'
"let g:fzf_launcher = '/usr/local/bin/fzf_launch %s'

nnoremap <C-Enter> :FzfFiles<CR>
nnoremap <Leader>a :Ack<Space>
nnoremap <D-f> :FzfLines<CR>
nnoremap gs :FzfGFiles?<CR>
nnoremap <Space> <C-f>
nnoremap <Tab> :FzfBuffers<CR>

nnoremap gf :FzfBLines<CR>
nnoremap <C-f> :CommandTLine<CR>

let g:ackprg = "ag --vimgrep"
nnoremap ga :Ack<Space>

"inoremap pj <Space>\|><Space>
"inoremap nj <CR>\|><Space>
inoremap <C-f> <Space>\|><Space>
inoremap <C-j> <CR>\|><Space>
inoremap <C-d> <Space>=><Space>

set nofoldenable
let g:vim_markdown_conceal = 0

nnoremap <C-m> <Nop>


" <C-c> to cd to recent directories
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'cd' fnameescape(path)
  endif
endfunction
nnoremap <C-c> :Z<Space>
