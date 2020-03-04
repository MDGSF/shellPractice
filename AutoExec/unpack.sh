#!/bin/bash

tar -xf diagnose.mpk

# 用公钥 public.pem 和 diagnose.sig 对 diagnose.enc 进行验证
openssl dgst -sha256 -verify public.pem -signature diagnose.sig diagnose.enc

# 把 diagnose.enc 解密为 diagnose.sh
openssl enc -d -aes-256-cbc -md sha256 -in diagnose.enc -out diagnose.sh -pass "file:encrypt.key"

