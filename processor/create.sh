set -e

echo "Creating data processor service"
kubectl apply -f processor-pod.yaml
