set -e

echo "Create vagrant cluster"
vagrant up

echo "Setup password less ssh with virtual hosts"
./set_passwd_less_ssh.sh

echo "Setup k8s on cluster" 
ansible-playbook -i hosts.ini k8s-setup.yml
ansible-playbook -i hosts.ini k8s-master.yml
ansible-playbook -i hosts.ini k8s-workers.yml
ansible-playbook -i hosts.ini install-helm.yml

# Get kubeconfig from master.
echo "Setup kubeconfig"
rm /tmp/kubeconfig
sshpass -pvagrant scp vagrant@192.168.1.101:/home/vagrant/.kube/config /tmp/kubeconfig
source ./set_kubeconfig.sh

echo "Creating NATS cluster"
pushd ./nats_cluster
./create.sh
popd
