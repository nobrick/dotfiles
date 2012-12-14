call pathogen#infect()
if has("cscope")
	set csprg=/usr/local/bin/cscope
	set csto=0
	" set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif
	nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nmap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* before the search type does a vertical
	" split instead of a horizontal one

	nmap <C-\><C-\>s
		\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\><C-\>g
		\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\><C-\>c
		\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\><C-\>t
		\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\><C-\>e
		\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\><C-\>i
		\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\><C-\>d
		\:vert scs find d <C-R>=expand("<cword>")<CR><CR>

syntax on
set showcmd
set ruler

filetype plugin indent on

set incsearch
set smartcase
set autoread		" auto read when file is changed from outside
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set gfn=Monaco:h14

set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
au FileType Makefile set noexpandtab
au BufRead words.txt setlocal spell

let mapleader="\\" 
" <Leader>t already used for Command T plugin

map z1 :NERDTreeToggle<CR>
map z2 :Tlist<CR>
map z3 :GundoToggle<CR>

map <Leader>j :NERDTreeToggle<CR>
map <Leader>k :Tlist<CR>
map <Leader>u :GundoToggle<CR>

map <C-s> :mks!$HOME/Session.vim<CR>
map <C-\>l :so $HOME/Session.vim<CR>

map <Leader><Leader>c :cs find 
map <Leader><Leader>s :cs find s 
map <Leader><Leader>g :cs find g 
map <Leader><Leader>a :cs add cscope.out<CR>

map <C-h> gT
imap <C-h> <ESC>gT
map <C-l> gt
imap <C-l> <ESC>gt

map <C-t><C-t> :tabnew<CR>
map <C-t>t :tabnew<CR>

map <C-t><C-c> :tabclose<CR>
map <C-t>c :tabclose<CR>

map <C-t><C-s> :tab split<CR>
map <C-t>s :tab split<CR>

map <Space> <C-f>


set mouse=a
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set guioptions=egmrLt
colorscheme peaksea

"set path+=~/gccLab/gcc-4.6.2/gcc/,~/gccLab/test101/,~/gccLab/gcc-4.6.2/research/,~/Dropbox/notes/
set path+=~/Dropbox/notes/

cmap cd. lcd %:p:h
cmap <C-a> <Home>

map <C-y> "*y
map <M-d> "*d
map <C-m><C-,> :map j gj<CR>:map k gk<CR>:map $ g$<CR>:map 0 g0<CR>:map ^ g^<CR>
map <C-m>, :map j gj<CR>:map k gk<CR>:map $ g$<CR>:map 0 g0<CR>:map ^ g^<CR>
map <C-m><C-.> :map j j<CR>:map k k<CR>:map $ $<CR>:map 0 0<CR>:map ^ ^<CR>
map <C-m>. :map j j<CR>:map k k<CR>:map $ $<CR>:map 0 0<CR>:map ^ ^<CR>

imap <C-e> <C-o>$
imap <C-a> <C-o>^
imap <C-k> <C-o>D
imap <C-t> <ESC>Xpa
imap <C-f> <Right>
imap <C-b> <Left>

if has("gui_macvim")
    set invmacmeta
    map <M-f> w
    map <M-b> b

    map <M-j> gj
    map <M-k> gk

    imap <M-f> <C-o>w
    imap <M-b> <C-o>b

    imap <M-j> <C-o>gj
    imap <M-k> <C-o>gk


    let g:EasyMotion_mapping_f = '<D-f>'
    let g:EasyMotion_mapping_F = '<D-d>'
    let g:EasyMotion_mapping_j = '<D-j>'
    let g:EasyMotion_mapping_k = '<D-k>'

    let macvim_hig_shift_movement = 1
endif

set noimd
if has("gui_running")
    set imactivatekey=C-space
    "inoremap <ESC> <ESC>:set iminsert=2<CR>
endif

set display=lastline

set undodir=/Volumes/AC/.vim_undos
set undolevels=1000
set undofile

let g:EasyMotion_keys = '1234567890abcdefghijklmnopqrstuvwxyz[\],-/.=;'
let g:EasyMotion_leader_key = '9'
hi link EasyMotionShade  Comment


set wildignore+=*.mp3,*.mp4,*.dmg,*.jpg,*.zip,*.gz,*.rar,*.png,*.pdf,*.gif,*.doc,*.ppt,*.docx,*.exe,*.plist,*.pptx,*.rtf,*.part,*.flv,*.jar,*.js,*.css,*.key,*.graffle,*.xls,*.mobi
let g:CommandTMaxCachedDirectories=4
let g:CommandTMaxDepth=4

cd ~/Dropbox
