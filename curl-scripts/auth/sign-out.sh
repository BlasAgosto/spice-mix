#!/bin/bash

TOKEN="fabdd1d313df761ab96814dbff5a85e1"

API="http://localhost:4741"
URL_PATH="/sign-out"

curl "${API}${URL_PATH}/" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
