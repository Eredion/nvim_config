
call plug#begin('~/.config/nvim/plugged')
	"Conquer of completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"File navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
	"Auto-brackets
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
	"Color theme
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'


if (empty($TMUX))
	call plug#end()
	  if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	  if (has("termguicolors"))
	    set termguicolors
	  endif
endif

syntax on
":source ~/.config/nvim/plugged/onedark.vim/colors/onedark.vim
colorscheme onedark

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set nu
set smartcase
set noswapfile
set nobackup
set incsearch

"Window splitting/movement
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
	    if (match(a:key,'[jk]'))
	       wincmd v
	    else
	       wincmd s
	    endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

set colorcolumn=80

"fzf
map ; :Files<CR>

"Coc configuration
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
