set exrc
set nocompatible
set termguicolors
set showtabline=2
set laststatus=2
set includeexpr=substitute(v:fname,'\\.','/','g')
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'valloric/YouCompleteMe'
	Plugin 'rdnetto/YCM-Generator'
	Plugin 'scrooloose/nerdtree'
	Plugin 'Badacadabra/vim-archery'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'vim-syntastic/syntastic'
	Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()

filetype plugin indent on
syntax on
colorscheme archery

augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.cc,*.cpp,*.h,*.hpp set filetype=cpp
augroup END

let &path='include'

" YouCompleteMe
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_rust_src_path='~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline
let g:airline_theme = 'archery'
let g:airline_powerline_fonts = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ctrlp
let g:ctrlp_root_markers = ['pom.xml', 'build.gradle', 'Makefile', 'requirements.txt', 'cargo.toml']
let g:ctrlp_custom_ignore = {
			\ 'dotdir': '\v[\/]\.(git|hg|svn)$',
			\ 'dir': '\v(obj|bin|build|target)$',
			\ 'file': '\v\.(exe|so|dll|o)$',
			\ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*.tar.gz
