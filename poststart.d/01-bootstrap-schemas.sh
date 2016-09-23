#!/bin/bash

if [ "$RIAK_FLAVOR" == "TS" ]; then
  # Create TS buckets
  echo "Looking for CREATE TABLE schemas in $SCHEMAS_DIR..."
  for f in $(find $SCHEMAS_DIR -name *.sql -print); do
    BUCKET_NAME=$(basename -s .sql $f)
    BUCKET_DEF=$(cat $f)
    $RIAK_ADMIN bucket-type create $BUCKET_NAME '{"props":{"table_def":"'$BUCKET_DEF'"}}'
    $RIAK_ADMIN bucket-type activate $BUCKET_NAME
  done
fi
