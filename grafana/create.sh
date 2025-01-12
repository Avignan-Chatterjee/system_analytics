set -e

echo "Creating grafana NodePort service"
kubectl apply -f grafana-service-nodeport.yaml
