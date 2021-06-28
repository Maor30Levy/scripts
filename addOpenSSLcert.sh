openssl genrsa 1024 > key.pem
openssl req -new -key ./key.pem  > csr.pem
openssl x509 -in csr.pem -out cert.pem -req -signkey key.pem -days 365