#!/bin/bash

set -e

RIAK_HOME=${RIAK_HOME:-/usr/lib/riak}
ETC_DIR=/etc/riak
DATA_DIR=/var/lib/riak
LOG_DIR=/var/log/riak

# Make sure dirs exist
for d in $DATA_DIR $LOG_DIR; do
  mkdir -p $d
done

# Use a global /etc dir
ln -s $RIAK_HOME/etc $ETC_DIR

# Patch config file to point to installed paths
sed -i -r "s#platform_bin_dir = (.*)#platform_bin_dir = $RIAK_HOME/bin#g" $ETC_DIR/riak.conf
sed -i -r "s#platform_data_dir = (.*)#platform_data_dir = $DATA_DIR#g" $ETC_DIR/riak.conf
sed -i -r "s#platform_etc_dir = (.*)#platform_etc_dir = $RIAK_HOME/etc#g" $ETC_DIR/riak.conf
sed -i -r "s#platform_lib_dir = (.*)#platform_lib_dir = $RIAK_HOME/lib#g" $ETC_DIR/riak.conf
sed -i -r "s#platform_log_dir = (.*)#platform_log_dir = $LOG_DIR#g" $ETC_DIR/riak.conf
