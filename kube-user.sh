name=ram
sudo openssl genrsa -out $name.key 2048
sudo openssl req -new -key $name.key -out $name.csr -subj "/CN=$name/O=learning"
sudo openssl x509 -req -in $name.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out $name.crt -days 365
sudo kubectl config set-credentials $name --client-certificate=$name.crt --client-key=$name.key
sudo kubectl config set-context $name-context --cluster=kubernetes --user=$name
