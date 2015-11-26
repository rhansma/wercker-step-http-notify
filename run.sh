#!/bin/sh

if [ ! -n "$DEPLOY" ]; then
  export WERCKER_HTTP_NOTIFY_TYPE="build"
else
  export WERCKER_HTTP_NOTIFY_TYPE="deploy"
fi

# Default to request method to GET
if [ ! -z "$WERCKER_HTTP_NOTIFY_METHOD" ]; then
  WERCKER_HTTP_NOTIFY_METHOD="GET"
fi

# If headers defined send them, else dont send headers
if [ -z "$WERCKER_HTTP_NOTIFY_HEADER" ]; then
  curl -X $WERKCER_HTTP_NOTIFY_METHOD \
       -H $WERCKER_HTTP_NOTIFY_HEADER \
       -d "result=$WERCKER_RESULT" \
       -d "type=$WERCKER_HTTP_NOTIFY_TYPE" \
       -d "application_owner_name=$WERCKER_APPLICATION_OWNER_NAME" \
       -d "application_name=$WERCKER_APPLICATION_NAME" \
       -d "git_branch=$WERCKER_GIT_BRANCH" \
       -d "started_by=$WERCKER_STARTED_BY" \
       -d "build_url=$WERCKER_BUILD_URL" \
       $WERCKER_HTTP_NOTIFY_URL
else 
curl   -X $WERKCER_HTTP_NOTIFY_METHOD \
       -d "result=$WERCKER_RESULT" \
       -d "type=$WERCKER_HTTP_NOTIFY_TYPE" \
       -d "application_owner_name=$WERCKER_APPLICATION_OWNER_NAME" \
       -d "application_name=$WERCKER_APPLICATION_NAME" \
       -d "git_branch=$WERCKER_GIT_BRANCH" \
       -d "started_by=$WERCKER_STARTED_BY" \
       -d "build_url=$WERCKER_BUILD_URL" \
       $WERCKER_HTTP_NOTIFY_URL
fi
