set -e

echo "Creating Setup"
pushd ./3node_cluster 
./setup.sh
popd

echo "Creating NATS cluster"
pushd ./nats_cluster
./create.sh
popd
