#!/bin/bash

PODS=`kubectl get pods | cut -d ' ' -f1 | grep -v 'NAME'`

echo "=============================================="
for pod in $PODS; do
    echo "$pod"
done
echo "=============================================="
echo -n "Do you really want to delete these pods? [Y/n] "
read -n 1 decision
echo ""

if [ "$decision" != "n" ] && [ "$decision" != "N" ]; then
    for pod in $PODS; do
        kubectl delete pod $pod
    done
fi
