#!/bin/sh

if [ ! -n "$DEPLOY" ]; then
  export WERCKER_HTTP_NOTIFY_TYPE="build"
else
  export WERCKER_HTTP_NOTIFY_TYPE="deploy"
fi

curl -X $WERKCER_HTTP_NOTIFY_METHOD \
     -H "Accept: application/json" \
     -H "$WERCKER_HTTP_NOTIFY_HEADER" \
     $WERCKER_HTTP_NOTIFY_URL
