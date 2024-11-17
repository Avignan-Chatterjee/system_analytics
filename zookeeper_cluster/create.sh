set -e

#echo "Creating zookeeper pvs"
kubectl apply -f zk-pv.yaml

#kubectl apply -f https://k8s.io/examples/application/zookeeper/zookeeper.yaml
kubectl apply -f zookeeper.yaml

