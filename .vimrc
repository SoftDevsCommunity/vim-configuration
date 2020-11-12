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

"--- Turning on the themes --"
set termguicolors
colorscheme monokai_pro
"set background=dark (uncomment this line if you want set a dark background in
"a theme)

let mapleader=" "
let NERDTreeQuitOnOpen=1
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

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
imap ii <Esc>
nnoremap j k
nnoremap k j 

"Colorblind (Mode + color with the change)
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

"--- Some awesome stuffs ---"
set statusline=%f
set statusline+=[%{strlen(&fenc)?&fenc:'none'},
set statusline+=%{&ff}]
set statusline+=%y
set statusline+=%h
set statusline+=%m
set statusline+=%r
set statusline+=\ %=
set statusline+=Line:%l/%L[%p%%]
set statusline+=\ Col:%c
set statusline+=\ Buf:%n
set statusline+=\ [%b][0x%B]\
