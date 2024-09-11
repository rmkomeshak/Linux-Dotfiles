set nocompatible
filetype off
syntax on
set number
set tabstop=3
set shiftwidth=3
set expandtab

set incsearch
set hlsearch

set termwinsize=12x0
set splitbelow
set mouse=a
set signcolumn=yes
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins
call vundle#begin('~/.vim/plugged')

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'sainnhe/everforest'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tpope/vim-dispatch'

call vundle#end()

" autopairs configuration
let g:AutoPairsShortcutToggle = '<C-P>'

" youcompleteme configuration
let g:ycm_key_list_stop_completion = ['<C-x>'] " Mapping to close the completion menu (default <C-y>)
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 } " Set filetypes where YCM will be turned on
let g:ycm_autoclose_preview_window_after_insertion = 1 " Close preview window after completing the insertion
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_confirm_extra_conf = 0                 " Don't confirm python conf
let g:ycm_always_populate_location_list = 1      " Always populate diagnostics list
let g:ycm_enable_diagnostic_signs = 1            " Enable line highligting diagnostics
let g:ycm_open_loclist_on_ycm_diags = 1          " Open location list to view diagnostics
let g:ycm_max_num_candidates = 20                " Max number of completion suggestions 
let g:ycm_max_num_identifier_candidates = 10     " Max number of identifier-based suggestions
let g:ycm_auto_trigger = 1                       " Enable completion menu
let g:ycm_show_diagnostic_ui = 1                 " Show diagnostic display features
let g:ycm_error_symbol = '>>'                    " The error symbol in Vim gutter
let g:ycm_enable_diagnostic_signs = 1            " Display icons in Vim's gutter, error, warnings
let g:ycm_enable_diagnostic_highlighting = 1     " Highlight regions of diagnostic text
let g:ycm_echo_current_diagnostic = 1            " Echo line's diagnostic that cursor is on

" nerdtree configuration
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = "left"     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31 columns

" tagbar configuration
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'botright vertical'

" ctrlsf configuration
let g:ctrlsf_backend = 'ack' " Use the ack tool as the backend
let g:ctrlsf_auto_close = { "normal":0, "compact":0 } " Auto close the results panel when opening a file
let g:ctrlsf_auto_focus = { "at":"start" } " Immediately switch focus to the search window
let g:ctrlsf_auto_preview = 0 " Don't open the preview window automatically
let g:ctrlsf_case_sensitive = 'smart' " Use the smart case sensitivity search scheme
let g:ctrlsf_default_view = 'normal' " Normal mode, not compact mode
let g:ctrlsf_regex_pattern = 0 " Use absoulte search by default
let g:ctrlsf_position = 'right' " Position of the search window
let g:ctrlsf_winsize = '46' " Width or height of search window
let g:ctrlsf_default_root = 'cwd' " Search from the current working directory

" color scheme
set background=dark
colorscheme everforest

" Mapping
nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <C-F> <Plug>CtrlSFPrompt
xmap <C-F>f <Plug>CtrlSFVwordPath
xmap <C-F>F <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Open vim-dispatch window and scroll to bottom
nnoremap    <C-m>m    :Copen<CR> <bar> G

" Build debug and release targets
nnoremap <C-m>bd   :Dispatch! make -C build/Debug<CR>
nnoremap <C-m>br   :Dispatch! make -C build/Release<CR>

" Temporary... change to be more dynamic in the future
nnoremap <F6> :Start ~/Repositories/TextEditor/bin/Debug/TextEditor <CR>

function SetBinaryDebug(filename)
      let bpath = getcwd() . "/bin/Debug/" . a:filename
      execute "nnoremap <F6> :Start "
         \ bpath
         \ . " <CR> <bar> :Copen<CR>"
      echo "<F6> will run: " . bpath
endfunction

function SetBinary(filename)
      let bpath = getcwd() . "/bin/Debug/" . a:filename
      execute "nnoremap <F6> :Copen <CR> <bar> :Start "
         \ bpath
         \ . " <CR>"
      echo "<F6> will run: " . bpath
endfunction

function SetBinaryRelease(filename)
      let bpath = getcwd() . "/bin/Release/" . a:filename
      execute "nnoremap <F7> :Dispatch "
         \ bpath
         \ . " <CR> <bar> :Copen<CR>"
      echo "<F7> will run: " . bpath
endfunction


filetype plugin indent on
