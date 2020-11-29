  "--- Basic settings ---"
set number 
set cursorline
set mouse=a
set mouse=r
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set encoding=utf-8
set showmatch
set sw=2
set laststatus=2
set relativenumber
"set noshowmode
autocmd Filetype javascript setlocal tabstop=2
autocmd Filetype python setlocal tabstop=4

"--- Pluggins & Theme ---"
call plug#begin('~/.vim/plugged')
"Theme
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'phanviet/vim-monokai-pro'
"Pluggins
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator' 
Plug 'mattn/emmet-vim'
Plug 'ms-jpq/chadtree'
Plug '907th/vim-auto-save'
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end() 

" -- Theme settings -- "
set termguicolors
"colorscheme monokai_pro
colorscheme palenight
set background=dark


"--- My own keymapping & shortcuts ---"
let mapleader=" "
let NERDTreeQuitOnOpen=1
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_leader_key=','
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"
let g:palenight_terminal_italics=1


nmap <leader>s <Plug>(easymotion-s2)
nmap <leader>nt :NERDTreeFind<CR> 
nmap <leader>w :w<CR> 
nmap <leader>q :q<CR> 
nmap <leader>wq :wq<CR> 
nmap <leader>t :below terminal<CR>
nmap <leader>q1 :q!<CR>
nmap <leader>pi :PlugInstall<CR>
nmap <leader>zs :AutoSaveToggle<CR>
nmap <leader>codi :Codi<CR>
nmap <leader>tw :tabnew<CR>
nmap <leader>tn :tabn<CR>
nmap <leader>tb :tabp<CR>
imap ii <Esc>
nnoremap j k
nnoremap k j 

"--- Colorblind (Mode + color with the change) ---"
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
    elseif a:mode == 'v'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

