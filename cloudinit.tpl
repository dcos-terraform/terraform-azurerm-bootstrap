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
- echo "firewalld.service disabled"
- systemctl stop firewalld.service
- echo "firewalld.service stopped"
- while [ "$(systemctl is-enabled docker 2>/dev/null)" != "disabled" ] && [ "$(systemctl is-enabled docker 2>/dev/null)" != "enabled" ]; do echo "waiting for docker-ce being installed"; sleep 10; done
- systemctl enable docker.service
- systemctl is-enabled docker
- if [ "$(systemctl is-active docker)" != "active" ]; then systemctl start --no-block docker.service; fi
- systemctl is-active docker
- setenforce 0
- echo "setenforce 0 set"
