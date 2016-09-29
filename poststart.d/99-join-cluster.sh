#!/bin/bash

# Maybe join to a cluster
if [[ -z "$($RIAK_ADMIN cluster status | egrep $COORDINATOR_NODE_HOST)" && "$COORDINATOR_NODE_HOST" != "$HOST" ]]; then
  # Not already in this cluster, so join
  echo "Connecting to cluster coordinator $COORDINATOR_NODE"
  curl -sSL $HOST:8098/admin/control/clusters/default/join/riak@$COORDINATOR_NODE_HOST
fi
