#!/bin/bash

ID="6255840442a2b8269b644b70"
TOKEN="2f384e15708ebabfdb05fb04e86ef831"

API="http://localhost:4741"
URL_PATH="/spice-mix"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
