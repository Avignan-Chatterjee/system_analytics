set -e

echo "Create vagrant cluster"
vagrant up

echo "Setup password less ssh with virtual hosts"
../utils/set_passwd_less_ssh.sh

echo "Setup k8s on cluster" 
ansible-playbook -i ansible_playbooks/hosts.ini ansible_playbooks/k8s-setup.yml
ansible-playbook -i ansible_playbooks/hosts.ini ansible_playbooks/k8s-master.yml
ansible-playbook -i ansible_playbooks/hosts.ini ansible_playbooks/k8s-workers.yml
ansible-playbook -i ansible_playbooks/hosts.ini ansible_playbooks/install-helm.yml
ansible-playbook -i ansible_playbooks/hosts.ini ansible_playbooks/install-longhorn.yml
ansible-playbook -i ansible_playbooks/hosts.ini ansible_playbooks/install-grafana.yml

# Get kubeconfig from master.
FILE_PATH="/tmp/kubeconfig"
echo "Setup kubeconfig"
if [ -f "$FILE_PATH" ]; then
	rm /tmp/kubeconfig
fi
sleep 10
sshpass -pvagrant scp vagrant@192.168.1.101:/home/vagrant/.kube/config /tmp/kubeconfig
sleep 5

echo "Waiting for the file to be created: $FILE_PATH"
while [ ! -f "$FILE_PATH" ]; do
  sleep 1
done
echo "File found: $FILE_PATH"

source ../utils/set_kubeconfig.sh
