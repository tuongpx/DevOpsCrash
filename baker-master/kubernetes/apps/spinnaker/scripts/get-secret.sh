
echo > spin-secret.yaml

for s in $(kubectl get secrets -o name); do
    kubectl get $s -o yaml | ksd >> spin-secret.yaml;
    echo "---" >> spin-secret.yaml
done
