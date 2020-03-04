#!/bin/bash

# 生成一个 1024 位的随机数，以 base64 编码输出到文件
openssl rand -base64 -out encrypt.key 1024 

# 生成 4096 位的私钥
openssl genrsa -out private.pem 4096  

# 生成公钥
openssl rsa -in private.pem -pubout -out public.pem  

