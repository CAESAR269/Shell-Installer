# docker and cri install
sudo apt-get update -y
curl -sSL https://get.docker.com/ | sh
sudo usermod -a -G docker node
sudo usermod -a -G docker udai1729
sudo usermod -a -G docker ubuntu
sudo chmod 777 /var/run/docker.sock
wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.3.4/cri-dockerd_0.3.4.3-0.ubuntu-jammy_amd64.deb
sudo dpkg -i cri-dockerd_0.3.4.3-0.ubuntu-jammy_amd64.deb
sudo systemctl daemon-reload
sudo systemctl enable --now cri-docker.socket
sudo apt-get update

# apt-transport-https may be a dummy package; if so, you can skip that package
# kubeadm kubelet and kubectl intall
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.26/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.26/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# kubeadm initialization
sudo kubeadm init --pod-network-cidr=100.200.0.0/16 --cri-socket=unix:///var/run/cri-dockerd.sock
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
