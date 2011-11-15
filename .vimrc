" Set history of 1007 lines
set history=1000

" Enable syntax hightlighting
syntax on

" Expand tabs to spaces
set expandtab

" Expand tab to 2 spaces
set tabstop=2
set shiftwidth=2

" Show line numbers
set nu 

" Set scroll off to 7, vim starts scrolling 7 lines from the bottom
set so=7

" Always show current position
set ruler 

" Autoread when file is changed from outside
set autoread

" Turn on WiLd menu
set wildmenu 

" Make wildmenu behave like bash
set wildmode=list:longest,full

"The commandbar height ??
set cmdheight=2 

"Change buffer - without saving ??
set hid 

" Set backspace config ??
set backspace=eol,start,indent

" No idea ??
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase 
set smartcase

" Highlight search things
set hlsearch 

" Make search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros 
set nolazyredraw 

"Set magic on, for regular expressions
set magic 

" Show matching bracets when text indicator is over them
set showmatch 

"How many tenths of a second to blink
set mat=2 

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" No backup, never use it anyway
set nobackup
set nowb
set noswapfile

" Indenting
set smarttab
set anti

set lbr
set tw=500

"Auto indent
set ai 

"Smart indet
set si 

"Wrap lines
set wrap 

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Folding stuff
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Enable filetype plugin
filetype plugin on
filetype indent off


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\\"
let g:mapleader = "\\"

" Fast saving
nmap <leader>w :w!<cr>
map <leader>e :e! ~/.vimrc<cr>
map <leader>q :q!<cr>

" Tabs
map <leader>tn :tabnew<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>n  <Esc>gt 

" Change dir
map <leader>cd :cd %:p:h<cr>

" Cope
map <leader>cc :botright cope<cr>


" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Search stuff
map <space> /
map <C-space> ?
map <silent> <leader><cr> :noh<cr>

" Bash like stuff
cnoremap <C-A>	  0	
cnoremap <C-E>	  $	

" Bash like keys for the command line
map <C-K>	  0dd	

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

map <C-V> <Esc>:vsp<cr><C-l>
map <C-H> <Esc>:sp<cr><C-j>

" cnoremap <C-S> <Esc>:w<cr>
" map <C-Q> <Esc><Esc>:qall! <cr>

map 0 ^


"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" PHP related
map <leader>pi <Esc>0iinclude "";<Esc>hi
map <leader>pr <Esc>0irequire "";<Esc>hi

" Perl related
map <leader>pu <Esc>0iuse ;<Esc>hi
map <leader>pp <Esc>0ipackage ;<Esc>hi


" JavaScript Related
map <leader>jl <Esc>0iconsole.log( );<Esc>hhi

" Paste and cd
" map <leader>pp :setlocal paste!<cr>
map <leader>bb :cd ..<cr>
inoremap <C-n> <C-x><C-o>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType rb set omnifunc=rubycomplete#Complete




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FIXME: more abbreviations
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab <?p    <?php <cr>?><Esc>ko
iab <?=    <?php print  ?><Esc>hhhi


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>




" Set font according to system
if has("mac")
  set gfn=Menlo:h14
  set shell=/bin/bash
elseif has("windows")
  set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif has("linux")
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif


if has("gui_running")
  set guioptions-=T 
  set guioptions-=M 
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme peaksea
else
  colorscheme zellner
  set background=dark
endif


set encoding=utf8
try
    lang en_US
catch
endtry


"Persistent undo
try
    if has("windows")
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.vim/undodir
    endif
    
    set undofile
catch
endtry






func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if has("linux") || has("mac")
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if has("linux") || has("mac")
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif   
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set guitablabel=%t



""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH






