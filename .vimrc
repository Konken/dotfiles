"#####�\���ݒ�#####
set number "�s�ԍ���\������
set title "�ҏW���̃t�@�C������\��
set showmatch "���ʓ��͎��̑Ή����銇�ʂ�\��
syntax on "�R�[�h�̐F����
set tabstop=4 "�C���f���g���X�y�[�X4���ɐݒ�
set smartindent "�I�[�g�C���f���g

"#####�����ݒ�#####
set ignorecase "�啶��/�������̋�ʂȂ���������
set smartcase "����������ɑ啶�����܂܂�Ă���ꍇ�͋�ʂ��Č�������
set wrapscan "�������ɍŌ�܂ōs������ŏ��ɖ߂�

set clipboard=unnamed,autoselect

" neobundle settings {{{
if has('vim_starting')
  set nocompatible
  " neobundle ���C���X�g�[�����Ă��Ȃ��ꍇ�͎����C���X�g�[��
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim ����R�}���h�Ăяo���Ă��邾�� neobundle.vim �̃N���[��
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath �̒ǉ��͕K�{
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end �̊Ԃɓ�������v���O�C�����L�ڂ��܂��B
NeoBundleFetch 'Shougo/neobundle.vim'
" ������Ȋ�������{�̏�����
NeoBundle 'nanotech/jellybeans.vim'

" vimrc �ɋL�q���ꂽ�v���O�C���ŃC���X�g�[������Ă��Ȃ����̂��Ȃ����`�F�b�N����
NeoBundleCheck
call neobundle#end()
filetype plugin indent on
" �ǂ��������� jellybeans �J���[�X�L�[�}���g���Ă݂܂��傤
set t_Co=256
syntax on
colorscheme jellybeans

NeoBundle 'Shougo/unite.vim'
" unite {{{
let g:unite_enable_start_insert=1
nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <ESC><ESC> q
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q
" }}}
"
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \ }
endif

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}
NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}

" vimshell {{{
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
" }}}
NeoBundle 'Townk/vim-autoclose'

"processing-?                                                              
NeoBundle "sophacles/vim-processing"?
au BufNewFile,BufRead *.pde setf processing?

set backspace=indent,eol,start

source $VIMRUNTIME/mswin.vim

NeoBundle 'w0ng/vim-hybrid'

colorscheme dracula


highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

if has('mac')
  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
elseif has('win32')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win32.dll'
elseif has('win64')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win64.dll'
endif

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\       'windows' : 'tools\\update-dll-mingw 32',
\       'unix' : 'make -f make_unix.mak',
\   },
\ }
