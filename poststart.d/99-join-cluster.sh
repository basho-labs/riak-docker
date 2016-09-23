#!/bin/bash

# Maybe join to a cluster
IN_CLUSTER="$($RIAK_ADMIN cluster status --format=json | jq -r --arg coordinator $COORDINATOR_NODE_HOST '.[] | select(.type == "table") | .table[] | select(.node | contains($coordinator))')"
if [[ "$IN_CLUSTER" == "" && "$COORDINATOR_NODE_HOST" != "$HOST" ]]; then
  # Not already in this cluster, so join
  echo "Connecting to cluster coordinator $COORDINATOR_NODE"
  curl -sSL $HOST:8098/admin/control/clusters/default/join/riak@$COORDINATOR_NODE_HOST
fi
