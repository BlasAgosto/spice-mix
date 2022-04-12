#!/bin/bash

TOKEN="2f384e15708ebabfdb05fb04e86ef831"
ID="625579a86eb0a91f6c23ad1f"
NAME="Chili Powder"
IMPACT="Makes food a little more chiliy than usual"

API="http://localhost:4741"
URL_PATH="/spice-mix"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "spice": {
      "name": "'"${NAME}"'",
      "impact": "'"${IMPACT}"'"
    }
  }'

echo
