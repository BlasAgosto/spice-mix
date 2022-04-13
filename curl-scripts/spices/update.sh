#!/bin/bash

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
