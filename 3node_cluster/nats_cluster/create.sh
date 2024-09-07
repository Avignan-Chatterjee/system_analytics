set -e

echo "Creating nats namespace"
kubectl apply -f nats-namespace.yaml

echo "Creating nats config"
kubectl apply -f nats-config.yaml

echo "Creating nats headless service"
kubectl apply -f nats-service.yaml

echo "Creating nats pvs"
kubectl apply -f nats-pv.yaml

echo "Creating nats statefulset"
kubectl apply -f nats-statefulset.yaml
