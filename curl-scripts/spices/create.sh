#!/bin/bash

NAME="huehueuhue sauce"
IMPACT="hue doesn't want more huehue in their life?"
TOKEN="2f384e15708ebabfdb05fb04e86ef831"

API="http://localhost:4741"
URL_PATH="/spice-mix"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "spice": {
      "name": "'"${NAME}"'",
      "impact": "'"${IMPACT}"'"
    }
  }'

echo