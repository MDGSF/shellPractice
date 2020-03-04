# 自解析可执行脚本

```
openssl rand -base64 -out encrypt.key 1024 //生成一个 1024 位的随机数，以 base64 编码输出到文件

//把 diagnose.sh 加密为 diagnose.enc，密码在 encrypt.key 文件中
openssl enc -e -aes-256-cbc -md sha256 -salt -in diagnose.sh -out diagnose.enc -pass "file:encrypt.key"

//把 diagnose.enc 解密为 diagnose.sh
openssl enc -d -aes-256-cbc -md sha256 -in diagnose.enc -out diagnose.sh -pass "file:encrypt.key"


//生成 4096 位的私钥
openssl genrsa -out private.pem 4096
//生成公钥
openssl rsa -in private.pem -pubout -out public.pem

//用私钥 private.pem 对 diagnose.enc 进行签名，生成数字签名 diagnose.sig
openssl dgst -sha256 -sign private.pem -out diagnose.sig diagnose.enc

//用公钥 public.pem 和 diagnose.sig 对 diagnose.enc 进行验证
openssl dgst -sha256 -verify public.pem -signature diagnose.sig diagnose.enc
```

