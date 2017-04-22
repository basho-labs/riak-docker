#!/bin/bash

# Create KV bucket types
echo "Looking for datatypes in $SCHEMAS_DIR..."
for f in $(find $SCHEMAS_DIR -name *.dt -print); do
  BUCKET_NAME=$(basename -s .dt $f)
  BUCKET_DT=$(cat $f)
  if ! [ riak-admin bucket-type list | grep -q $BUCKET_NAME ] ; then
    $RIAK_ADMIN bucket-type create $BUCKET_NAME "{\"props\":{\"datatype\":\"$BUCKET_DT\"}}"
    $RIAK_ADMIN bucket-type activate $BUCKET_NAME
  fi
done
