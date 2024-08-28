vagrant up
./set_passwd_less_ssh.sh
ansible-playbook -i hosts.ini k8s-setup.yml
ansible-playbook -i hosts.ini k8s-master.yml
ansible-playbook -i hosts.ini k8s-workers.yml
