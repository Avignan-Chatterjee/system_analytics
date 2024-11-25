set -e

echo "Creating Setup"
pushd ./3node_cluster 
./setup.sh
popd

echo "Creating NATS cluster"
pushd ./nats_cluster
./create.sh
popd

echo "Creating Zookeeper cluster"
pushd ./zookeeper_cluster
./create.sh
popd

echo "Creating ClickHouse cluster"
pushd ./clickhouse_cluster
./create.sh
popd
