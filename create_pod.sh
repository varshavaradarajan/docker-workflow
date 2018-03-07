#!/bin/bash

if [ -z $KUBE_TOKEN ]; then
  echo "FATAL: Environment Variable KUBE_TOKEN must be specified."
  exit ${2:-1}
fi

namespace=$(</var/run/secrets/kubernetes.io/serviceaccount/namespace)
curl -sSk -H "Authorization: Bearer $KUBE_TOKEN" -H "Content-Type: application/json" \
      https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/$namespace/pods \
      -X POST -d @sample-app-pod.json
