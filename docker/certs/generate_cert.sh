passphrase="ibm-team"
ys1_ip=10.120.208.8
localhost=127.0.0.1

openssl genrsa -out server-key.pem -passout pass:$passphrase 4096
openssl req -subj "/CN=pipeline-worker-1" -sha256 -new -key server-key.pem -out server.csr -passin pass:$passphrase
echo subjectAltName = IP:$ys1_ip > extfile.cnf
openssl x509 -req -days 36500 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf -passin pass:$passphrase
