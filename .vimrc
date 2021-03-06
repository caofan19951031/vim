"新路径
set runtimepath+=~/.vim

"自动补全
set completeopt=preview,menu

"用空格代替制表符
set expandtab

"为C程序提供自动缩进
set smartindent

"继承前一行的缩进方式
set autoindent

"高亮显示匹配的括号
"set showmatch

"配色
syntax enable
set background=dark
colorscheme solarized

"语法高亮 
syntax enable
syntax on

"显示行号
set number

"缩进统一为4
set tabstop=4
set softtabstop=4
set shiftwidth=4

"设定编码
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

"开启Normal或Visual模式下Backspace键，空格键，左方向键，右方向键，Insert或replace模式下左方向键，右方向键跳行的功能
set whichwrap=b,s,<,>,[,]

"可以在任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"编译
map <F4> : call Compile()<CR>
func! Compile()
  if expand("%:e") == "cpp"
    exec "w"
    exec "!g++ % -o %< -O2 -Wall -std=c++0x"
  endif"
  
  if expand("%:e") == "c"
    exec "w"
    exec "!gcc % -o %< -O2 -Wall -std=gnu89 -static -lm -g"
  endif
  
  if expand("%:e") == "java"
    exec "w"
    exec "!javac % -encoding UTF-8 -sourcepath . -d ."
  endif
endfunc

"运行
map <F5> : call Run()<CR>
func! Run()
  if expand("%:e") == "cpp"
    exec "w"
    exec "!time ./%<"
  endif
 
  if expand("%:e") == "c"
    exec "w"
    exec "!time ./%<"
  endif
  
  if expand("%:e") == "java"
    exec "w"
    exec "!time java %<"
  endif
  
  if expand("%:e") == "py"
    exec "w"
    exec "!time python3 %"
  endif
endfunc

"自动插入头文件
autocmd BufNewFile *.cpp,*.py,*.java exec ":call SetTitle()"
func SetTitle()
	if expand("%:e") == "py"
		call setline(1,"#")
		call append(line("."), "#") 
		call append(line(".")+1, "# Author : ZiP_fan <caofan1031@gmail.com>") 
		call append(line(".")+2, "#") 
		call append(line(".")+3, "# Time : ".strftime("%a %d %b %Y")) 
		call append(line(".")+4, "#") 
		call append(line(".")+5, "")
		call append(line(".")+6,"path = \"~/Documents/\"")
	else
		call setline(1, "/*") 
		call append(line("."), " *") 
		call append(line(".")+1, " * Author : ZiP_fan <caofan1031@gmail.com>") 
		call append(line(".")+2, " *") 
		call append(line(".")+3, " * Time : ".strftime("%A %b.%d.%Y")) 
		call append(line(".")+4, " *")
		call append(line(".")+5, " */")
	endif

	if expand("%:e") == "cpp"
		call append(line(".")+6,"#include <iostream>")
		call append(line(".")+7,"#include <cstring>")
		call append(line(".")+8,"#include <cstdio>")
		call append(line(".")+9,"#include <cmath>")
		call append(line(".")+10,"#include <string>")
		call append(line(".")+11,"#include <queue>")
		call append(line(".")+12,"#include <map>")
		call append(line(".")+13,"#include <vector>")
		call append(line(".")+14,"#include <algorithm>")
		call append(line(".")+15,"#include <fstream>")
		call append(line(".")+16,"using namespace std;")
		call append(line(".")+17,"")
		call append(line(".")+18,"int main()")
		call append(line(".")+19,"{")
		call append(line(".")+20,"	freopen(\"/Users/zip/in.txt\",\"r\",stdin);")
		call append(line(".")+21,"")
		call append(line(".")+22,"	return 0;")
		call append(line(".")+23,"}")
		call append(line(".")+24,"")
	endif
endfunc
