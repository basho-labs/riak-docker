#!/bin/bash

RING_SIZE=$(awk -F'=' '/ring_size/{print $2}' $RIAK_CONF | sed 's/[ ]//')
CLUSTER_CONVERGENCE=${CLUSTER_CONVERGENCE:-standard}

if [[ "fast" == "$CLUSTER_CONVERGENCE" && ! -e $RIAK_ADVANCED_CONF ]]; then
cat <<END >$RIAK_ADVANCED_CONF
[
  {riak_core, [
    {vnode_parallel_start, $RING_SIZE},
    {forced_ownership_handoff, $RING_SIZE},
    {handoff_concurrency, $RING_SIZE}
  ]}
].
END
fi
