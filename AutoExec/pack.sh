#!/bin/bash

# 把 diagnose.sh 加密为 diagnose.enc，密码在 encrypt.key 文件中
openssl enc -e -aes-256-cbc -md sha256 -salt -in diagnose.sh -out diagnose.enc -pass "file:encrypt.key"

# 用私钥 private.pem 对 diagnose.enc 进行签名，生成数字签名 diagnose.sig
openssl dgst -sha256 -sign private.pem -out diagnose.sig diagnose.enc

tar -cvf diagnose.mpk diagnose.enc diagnose.sig
