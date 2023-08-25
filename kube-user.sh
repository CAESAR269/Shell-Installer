openssl genrsa -out muthu.key 2048
openssl req -new -key muthu.key -out muthu.csr -subj "/CN=muthu/O=learning"
openssl x509 -req -in muthu.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out muthu.crt -days 365
kubectl config set-credentials muthu --client-certificate=muthu.crt --client-key=muthu.key
kubectl config set-context muthu-context --cluster=kubernetes --user=muthu
