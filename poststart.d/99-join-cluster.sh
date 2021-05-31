#!/bin/bash

# Maybe join to a cluster
if [[ -z "$($RIAK_ADMIN cluster status | egrep $COORDINATOR_NODE_HOST)" && "$COORDINATOR_NODE_HOST" != "$HOST" ]]; then
  # Not already in this cluster, so join
  echo "Connecting to cluster coordinator $COORDINATOR_NODE"
  riak-admin cluster join $CLUSTER_NAME@$COORDINATOR_NODE
  riak-admin cluster plan
  riak-admin cluster commit
fi
