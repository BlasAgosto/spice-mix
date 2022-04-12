#!/bin/sh

TOKEN="2f384e15708ebabfdb05fb04e86ef831"
ID="625579a86eb0a91f6c23ad1f"

API="http://localhost:4741"
URL_PATH="/spice-mix"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
