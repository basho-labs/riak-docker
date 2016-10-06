#!/bin/bash

# Add standard config items
cat <<END >>$RIAK_CONF
nodename = riak@$HOST
distributed_cookie = $CLUSTER_NAME
listener.protobuf.internal = $HOST:$PB_PORT
listener.http.internal = $HOST:$HTTP_PORT
END

# Maybe add user config items
if [ -s $USER_CONF ]; then
  cat $USER_CONF >>$RIAK_CONF
fi