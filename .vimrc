" 针对 Makefile 和 *.mk 文件自动设置
autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4

" 显示 Tab 和空格，便于检查错误
autocmd FileType make setlocal list listchars=tab:>-,trail:~

" 可选：显示行号，便于调试 Makefile 报错
autocmd FileType make setlocal number
