#!/bin/bash

sed -i -r "s#storage_backend = (.*)#storage_backend = $BACKEND#g" $RIAK_CONF
sed -i -r "s#nodename = (.*)#nodename = riak@$HOST#g" $RIAK_CONF
sed -i -r "s#distributed_cookie = (.*)#distributed_cookie = $CLUSTER_NAME#g" $RIAK_CONF
sed -i -r "s#listener\.protobuf\.internal = (.*)#listener.protobuf.internal = $HOST:8087#g" $RIAK_CONF
sed -i -r "s#listener\.http\.internal = (.*)#listener.http.internal = $HOST:8098#g" $RIAK_CONF
