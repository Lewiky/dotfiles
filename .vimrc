set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

colorscheme monokai
set mouse=a
set shiftwidth=2               " use indents of 2 spaces
set expandtab " tabs are spaces, not tabs
set tabstop=2 " an indentation every two columns
set softtabstop=2 " let backspace delete indent
set number
let python_highlight_all = 1
