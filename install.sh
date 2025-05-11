#!/bin/bash

a(){
    # 接受上一条命令返回值为第一个参数，等于0输出 done，否则输出Failure并结束程序
    if [ $1 -eq 0 ]
    then
        echo done完成
    else
        echo Failure失败
        # 接受第2个参数为错误信息，并输出
        echo -e $2
        exit
    fi
}

if [[ $1 != "-y" ]]    # 第一个参数不等于 -y
then
    # 输出提示信息并终止程序
    echo -n "程序install.sh将会把当前目录的PyCh文件移入 /bin 并删除当前目录的所"
    echo -n "有文件（包括隐藏文件，所以，请不要在用户默认目录下使用此程序），如"
    echo -n "您需要使用它实现PyCh快速更新，请使用sudo运行，并传入参数 -y"
    echo
    echo "如    sudo sh install.sh"
    exit
fi

echo -n "给予PyCh运行权限............."
sudo chmod +x PyCh
a $? "\033[31m!!!PyCh加运行权限失败!!!\033[0m\n请检查是否权限不足、是否存在PyCh文件"

echo -n "复制当前目录PyCh至/bin ......"
sudo cp PyCh /bin/
a $? "\033[31m!!!文件复制失败!!!\033[0m\n请检查是否权限不足、此磁盘是否存在/bin目录"

echo -n "删除当前目录文件............."
sudo rm -rf *
a $? "\033[31m!!!文件删除失败!!!\033[0m"

echo -n "删除当前目录隐藏文件........."
sudo rm -rf .*
a $? "\033[31m!!!隐藏目录删除失败!!!\033[0m\n此步骤只为了删掉.git目录，这可能只是因为此目录下没有隐藏文件"

echo 程序运行成功
