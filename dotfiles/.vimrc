"""
""" Useful links/inspirations: https://github.com/amix/vimrc
"""

" Use color scheme
colorscheme desert

" Use mouse
set mouse=a

" Don't wrap by default
set nowrap

" Use 4 spaces for indenting
set expandtab
set shiftwidth=4
set softtabstop=4

" Always  set auto indenting on
set autoindent

" Select when using the mouse
set selectmode=mouse

" Set status line
"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

" Powerline
"
" Also useful to install  powerline fonts: https://github.com/powerline/fonts
"
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
set showtabline=2
set noshowmode
set t_Co=256
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
