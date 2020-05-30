#!/bin/bash
kubectl get pods --all-namespaces -o json | jq -c  '.items[] | 
select(.spec.volumes[].persistentVolumeClaim.claimName != null ) | 
del(.spec.volumes[] | select (.persistentVolumeClaim.claimName == null)) |
{
  name: .metadata.name,
  namespace: .metadata.namespace,
  claimName: .spec.volumes[].persistentVolumeClaim.claimName,
  volumeName: .spec.volumes[].name, 
  volumeMounts: .spec.containers[].volumeMounts[]
} | 
select(.volumeName == .volumeMounts.name) ' | while IFS= read line; do
[ -z "$FIRST_LINE" ] && echo -e "NAMESPACE|ClaimeName|USAGE|MOUNTPATH|CAPACITY" 
echo -n "$line" | jq -c -r '.namespace,"|",.claimName,"|"' | tr -d '\n'; 
kubectl exec $(echo "$line" | jq -r '.name') -n $(echo "$line" | jq -r '.namespace') -- du -h -d0 $(echo "$line" | jq -r '.volumeMounts.mountPath') | sed -e 's/\s\+/|/g' |tr -d '\n';
kubectl get pvc $(echo "$line" | jq -r '.claimName') -n $(echo "$line" | jq -r '.namespace')  -o json | jq -r '"|",.status.capacity.storage' | tr -d '\n';
echo -e "\n"
FIRST_LINE="false"
done | column -s '|' -t