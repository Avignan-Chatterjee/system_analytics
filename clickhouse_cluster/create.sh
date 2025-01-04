set -e

echo "Creating clickhouse installation CRD"
kubectl apply -f clickhouse-operator-install-bundle.yaml

echo "Creating clickhouse namespace"
kubectl apply -f clickhouse-namespace.yaml

#echo "Creating clickhous pvs"
#kubectl apply -f clickhouse-pv.yaml

echo "Creating clickhous cluster"
kubectl apply -f clickhouse-cluster.yaml

echo "Creating clickhous db and table"
kubectl apply -f clickhouse-job.yaml

echo "Creating clickhouse nodeport service"
kubectl apply -f clickhouse-service-nodeport.yaml