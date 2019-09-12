#!/bin/bash

file=/home/huangjian/eventlog/2019-09-10/2019-09-10_0001.log.tar.gz

echo ""
echo "原始字符： $file"
echo "删除第一个 / 及其左边的字符： ${file#*/}" # home/huangjian/eventlog/2019-09-10/2019-09-10_0001.log.tar.gz
echo "删除最后一个 / 及其左边的字符： ${file##*/}" # 2019-09-10_0001.log.tar.gz
echo "删除第一个 . 及其左边的字符： ${file#*.}" # log.tar.gz
echo "删除最后一个 . 及其左边的字符： ${file##*.}" # gz

echo "删除最后一个 / 及其右边的字符： ${file%/*}" # /home/huangjian/eventlog/2019-09-10
echo "删除第一个 / 及其右边的字符： ${file%%/*}" # 空值
echo "删除最后一个 . 及其右边的字符： ${file%.*}" # /home/huangjian/eventlog/2019-09-10/2019-09-10_0001.log.tar
echo "删除第一个 . 及其右边的字符： ${file%%.*}" # /home/huangjian/eventlog/2019-09-10/2019-09-10_0001

echo "从第 0 个字节开始连续取 5 个字节： ${file:0:5}" # /home
echo "从第 0 个字节开始连续取 15 个字节： ${file:0:15}" # /home/huangjian
echo "从第 5 个字节开始连续取 10 个字节： ${file:5:10}" # /huangjian

echo "把第一个 09 替换为 AA： ${file/09/AA}" # /home/huangjian/eventlog/2019-AA-10/2019-09-10_0001.log.tar.gz
echo "把第所有 09 替换为 AA： ${file//09/AA}" # /home/huangjian/eventlog/2019-AA-10/2019-AA-10_0001.log.tar.gz

echo ""

