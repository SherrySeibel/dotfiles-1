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
