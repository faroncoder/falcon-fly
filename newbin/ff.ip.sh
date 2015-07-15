#!/bin/bash

curl --url http://ip-api.com/json | jq .query

exit 0

