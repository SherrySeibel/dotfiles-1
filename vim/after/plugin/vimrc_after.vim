" This loads after the yadr plugins so that plugin mappings can
" be overwritten.

if filereadable(expand("~/.yadr/vim/after/.vimrc.after"))
  source ~/.yadr/vim/after/.vimrc.after
endif

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif


set textwidth=80        " Wrap lines at 80 characters
set showmatch           " highlight matching [{()}]

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Auto indent using `,i`
vmap ,i gg=G
nnoremap ,i gg=G

set mouse=a            " Enable the mouse

" From https://nvie.com/posts/how-i-boosted-my-vim/
" Lets mouse work in terminal mode
fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Lets you do ;w to save instead of :w
nnoremap ; :

" When you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts).
" This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

" From https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
set encoding=utf-8  " Use an encoding that supports unicode

set confirm         " Display a confirmation dialog when closing an unsaved file.

" https://stackoverflow.com/questions/164847/what-is-in-your-vimrc
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific pluginsj

" Make cursor move as expected with wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

set formatoptions=tcrql         " t - autowrap to textwidth
                                " c - autowrap comments to textwidth
                                " r - autoinsert comment leader with <Enter>
                                " q - allow formatting of comments with :gq
                                " l - don't format already long lines

set expandtab                   " expand <Tab>s with spaces; death to tabs!
set preserveindent              " save as much indent structure as possible
filetype plugin indent on       " load filetype plugins and indent settings
set ruler                       " show the cursor position all the time

set clipboard=unnamed           " Allows for copy/paste across tmux https://robots.thoughtbot.com/how-to-copy-and-paste-with-tmux-on-mac-os-x

" =============== git-messenger mappings ==================
nmap <Leader>gm <Plug>(git-messenger)

function! s:setup_git_messenger_popup() abort
    " Set go back/forward history to <C-o>/<C-i>
    nmap <buffer><C-o> o
    nmap <buffer><C-i> O
endfunction
autocmd FileType gitmessengerpopup call <SID>setup_git_messenger_popup()

let g:git_messenger_close_on_cursor_moved="false"    " You can move your curser without closing the window
let g:git_messenger_always_into_popup="true"         " Will always open in a popup
let g:git_messenger_include_diff="current"           " Will show the current git diff

" ============== Coc Ruby completing ======================
let g:coc_global_extensions = ['coc-solargraph']

" Coc popup configurations
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" =============== Color Scheme ===========================
set t_Co=256   " This is may or may not needed.

set background=dark
colorscheme PaperColor

let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }
let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
