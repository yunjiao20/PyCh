# PyCh

出于一个突发的有趣的想法而编写的小程序，可以用作一个简陋的编译器，PyCh代码类似：

    #!/bin/PyCh

    输出（‘你好！’）

    标志 = ‘运行’
    当 标志 == ‘运行’：
         名字 = 请输入（‘输入您的名字：’）
         如果 名字 == ‘’：
              输出（‘您没有输入任何信息，请重试’）
         否则 ：
              标志 = ‘停止’

    输出（f‘您的名字是：{名字}’）
    输出（f‘你好！{名字}’）

PyCh使用Python3和Bash命令实现基本功能，请确保您在对应环境运行     
PyCh使用Python逐行读取你提供的文件内容，并将翻译后的信息逐行输出到当前目录的.pych文件里（如果你未使用--output参数指定输出文件的话），然后调用Bash[python .pych]命令运行翻译后脚本，并在成功运行后删除.pych文件。它实质只是替换了一些文本，你可以在源码的最上方查看并修改替换字典。


## 快速更新

如果您希望快速的将PyCh更新成新一版（或自定义版本），并放入 /bin 目录作为默认命令的话，可以使用 install.sh

    git clone https://github.com/yunjiao20/PyCh
    cd PyCh
    bash install.sh    # 这将输出提示提示，请因为install.sh会删除此目录下的所有文件，请阅读提示信息后再做决定
    sudo bash install.sh -y

 请使用bash运行install.sh，而不是使用sh命令使用默认shell，否则可能会导致if[[]]无法被解释，导致没有输出提示信息、没有-y参数而直接运行。install.sh将会删除当前目录的所有文件（包括隐藏文件），请不要在用户默认目录下运行，这可能会导致您的用户配置被清除

## 使用及参数

- PyCh [file]    逐行替换文件内pych文本为Python代码，并运行它
- PyCh --man     输出PyCh中文文档
- PyCh --key     输出PyCh替换字典
- PyCh --help    输出PyCh帮助信息
- PyCh --output [output file] [file]    翻译[file]文件信息并输出到[output file]文件内，并运行[output file]文件。请注意，PyCh不会清空已有的[output file]文件内的信息，而只会在文件末尾追加代码。这个
特性有时会有用，但如果[output file]文件内存在错误代码，你可能要在运行PyCh前手动删除已有的[output file]文件名的文件


## 默认教程

PyCh实际上只是一个文本替换程序，将一些中文字符替换成Python关键字、函数、和英文字符，所以PyCh语法完全遵循Python语法，并可插入Python代码。因为我一些不懂Python的朋友可能需要，下面将列出默认情下PyCh的简单 
语法。PyCh也对一些中文标点做了替换，以防止频繁切换输入法。     
- 输出()    ----[替换print]输出字符串或变量     
  - 例：
    - 输出("hello")  # 输出hello     
    - 输出(sign)     # 输出变量sign的内容     
- 请输入()    ----[替换input]输出括号中的变量或字符，等待用户输入并将输入以字符串形式返回     
  - 例：
    - i = 请输入("你的名字：")    # 输出"你的名字"并将用户输入赋值给变量i     
- 从 [Python库] 包含 [函数名] 别名 [函数别名]     ----[from import as]从一个Python库包含一个函数并取别名     
  - 例：
    - 包含 pygame    # 导入pygame库     
    - 从 os 包含 system    # 导入os模块的system()函数     
    - 从 os 包含 system 别名 系统命令    #导入os模块的system()函数并为其取别名为 系统命令     
- 当 [条件]:    ----[替换while]当型循环语句，条件为True(真)时循环执行缩进行内的语句
  
其他信息暂无     


## 自定义与错误处理

PyCh实现了读取文件和逐行置换输出功能，你可以通过更改置换字典来借用PyCh的替换功能    
PyCh使用Bash[python3]来调用默认Python3运行代码，只允许您在拥有python3的Bash或类似环境下运行，且代码应遵循Python语法    
作为一个小程序，PyCh没有错误处理。如Python报错，请使用--output参数输出Python代码并检查问题     
因为使用了Bash[echo "{line}" >> {output}]来向文件写入信息，代码中存在"$"可能会导致Bash出错    
不知道还要讲些什么了，就先到这里吧(我为什么会给怎么简单的Python程序写怎么长的文档)    

## 其他

PyCh自带文档，你可以使用命令 PyCh --man | more 来查看它
