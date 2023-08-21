# -*- mode: ruby -*-
# vi: set ft=ruby :
###================================================   Script   ==================================================###
$hostname = "node1"

$script = <<-SCRIPT
# set molecule to password.
echo molecule | passwd --stdin root
mkdir /root/.ssh
chmod 700 /root/.ssh
touch /root/.ssh/authorized_keys

# setup docker repository.
cat <<'EOF' > /etc/yum.repos.d/docker-ce.repo
[docker-ce-stable]
name=Docker CE Stable - $basearch
baseurl=https://download.docker.com/linux/centos/\$releasever/\$basearch/stable
enabled=1
gpgcheck=1
gpgkey=https://download.docker.com/linux/centos/gpg
EOF

# Install docker.
dnf install -y docker-ce docker-ce-cli containerd.io
systemctl enable --now docker
SCRIPT

###================================================   Main   ==================================================###
Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/8"

  config.vm.provider "qemu" do |qe|
    qe.arch = "x86_64"
    qe.machine = "q35"
    qe.cpu = "max"
    qe.net_device = "virtio-net-pci"
  end
  config.vm.define :node1 do |node1|
    node1.vm.hostname = $hostname
    end ###--- End Provider
  config.vm.provision "shell", inline: $script
  config.trigger.after :destroy do |trigger|
    trigger.name = "Kill quemu process"
    trigger.info = "Clean up qemu proccess"
    trigger.run = {inline: "ps -ef |grep qemu |grep $hostname |awk '{print $2}' |xargs -I% -t kill -9 %"}
  end
end #    EOF
