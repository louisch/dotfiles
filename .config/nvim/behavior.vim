let nvimdir = "/home/louis/.config/nvim"


" Behavior

" Filetype recognition
filetype on
filetype plugin indent on

"" Syntax highlighting
syntax enable

"" Show line and column number
set ruler

"" Omnicompletion
set omnifunc=syntaxcomplete#Complete

"" Indentation
set expandtab
set tabstop=4
set shiftwidth=4

" After opening file, check whether tabs or spaces should be used
autocmd BufReadPost * call has#TabsOrSpaces()

"" Windows
set splitright
set splitbelow

"" Search
set ignorecase
set smartcase

"" Folds
set nofoldenable

"" Disable swap
set noswapfile

"" Keybindings
let mapleader = "\<space>"
nnoremap <leader>vs :execute 'source' nvimdir . '/init.vim'<CR>
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>x :close<CR>
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader>w :Bw<CR>
noremap <C-t> :tabnew split<CR>
nnoremap <leader>ds :%s/\s*$//<CR>:nohlsearch<CR>
nnoremap zz :nohlsearch<CR>
"" Window navigation
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
"" Identify syntax highlighting group used under cursor
nnoremap <leader>is :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"" Prompt to create directory if it does't exist
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

"" Source these files when saving them
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"" Filetype
autocmd FileType
      \ vim,
       \sh,
       \html,css,javascript,
       \scss,
       \typescript,
       \vue,
       \json,
       \php,
       \yaml
      \ setlocal shiftwidth=2 tabstop=2
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
" filetypes for chezmoi templates
autocmd Filetype *.tmpl set filetype=ignored
autocmd Filetype javascript set filetype=javascript.jsx

"" Minimum amount of lines syntax will look backwards to
autocmd BufEnter * :syntax sync minlines=200

"" incremental search/replace
set incsearch
set inccommand=nosplit

"" Persistent very magic
nnoremap / /\v
vnoremap / /\v
cnoremap sss s/\v

"" Reduce update time (mainly for gitgutter)
set updatetime=100

"" Do not redraw while executing macros
set lazyredraw

"" Persistent undo
set undofile
