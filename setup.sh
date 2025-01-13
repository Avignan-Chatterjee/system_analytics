set -e

echo "Creating Setup"
pushd ./3node_cluster 
./setup.sh
popd

source utils/set_kubeconfig.sh

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

echo "Creating Grafana cluster"
pushd ./grafana
./create.sh
popd

echo "Creating Processor App"
pushd ./processor
./create.sh
popd
