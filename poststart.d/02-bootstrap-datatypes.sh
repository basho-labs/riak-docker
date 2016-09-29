#!/bin/bash

# Create KV bucket types
echo "Looking for datatypes in $SCHEMAS_DIR..."
for f in $(find $SCHEMAS_DIR -name *.dt -print); do
  BUCKET_NAME=$(basename -s .dt $f)
  BUCKET_DT=$(cat $f)
  $RIAK_ADMIN bucket-type create $BUCKET_NAME "{\"props\":{\"datatype\":\"$BUCKET_DT\"}}"
  $RIAK_ADMIN bucket-type activate $BUCKET_NAME
done
