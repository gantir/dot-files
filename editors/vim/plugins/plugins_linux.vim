call plug#begin('~/.vim-plug')

source ~/.vim/plugins_shared.vim

Plug 'magicmonty/sonicpi.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-ruby/vim-ruby'

call plug#end()

if has('nvim')
	let g:deoplete#enable_smart_case = 1
	let g:deoplete#enable_at_startup = 1

	inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function() abort
  		return deoplete#close_popup() . "\<CR>"
	endfunction
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endif
