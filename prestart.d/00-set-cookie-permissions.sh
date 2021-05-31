#!/bin/sh

# Riak is sensitive to permissions on the erlang distribution cookie file.
# The ERTS requires that the cookie permissions are always 0600.
# In some environments, file permissions may change. For example, this
# can happen in kubernetes if the `fsGroup` option is used.

COOKIE_PATH="/var/lib/riak/.erlang.cookie"

if [ -e "$COOKIE_PATH" ]; then
    chmod 0600 "$COOKIE_PATH"
fi
