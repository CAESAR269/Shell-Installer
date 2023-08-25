sudo openssl genrsa -out devil.key 2048
sudo openssl req -new -key devil.key -out devil.csr -subj "/CN=devil/O=learning"
sudo openssl x509 -req -in devil.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out devil.crt -days 365
sudo kubectl config set-credentials devil --client-certificate=devil.crt --client-key=devil.key
sudo kubectl config set-context devil-context --cluster=kubernetes --user=devil
