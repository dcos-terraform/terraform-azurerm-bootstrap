#cloud-config
yum_repos:
  docker-ce:
    name: docker-ce
    description: Docker CE Repository
    baseurl: "https://download.docker.com/linux/centos/7/$basearch/stable"
    enabled: yes
    gpgcheck: yes
    gpgkey: https://download.docker.com/linux/centos/gpg
runcmd:
- yum install -y docker-ce
- systemctl disable firewalld.service
- systemctl stop firewalld.service
- systemctl enable docker.service
- systemctl start --no-block docker.service
- setenforce 0
