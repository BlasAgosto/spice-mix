#!/bin/sh
TOKEN="2f384e15708ebabfdb05fb04e86ef831"

API="http://localhost:4741"
URL_PATH="/spice-mix"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
