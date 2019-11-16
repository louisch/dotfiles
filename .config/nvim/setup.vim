" Plugin installation
" Specify a directory for plugins
" - For vim: '~/.vim/plugged'
" - For Neovim: '~/.local/share/nvim/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-swap'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'rhysd/devdocs.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'altercation/vim-colors-solarized'
Plug 'blueyed/vim-diminactive'
Plug 'itchyny/lightline.vim' | Plug 'mengelbrecht/lightline-bufferline'
Plug 'lifepillar/vim-solarized8'
Plug 'ltlollo/diokai'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'cocopon/lightline-hybrid.vim'

Plug 'gregsexton/MatchTag'
Plug 'sheerun/vim-polyglot'
Plug 'adriaanzon/vim-emmet-ultisnips'
Plug 'maksimr/vim-jsbeautify'
call plug#end()
