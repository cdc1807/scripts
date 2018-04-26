#!/bin/bash

token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IkFUVUI6UUtHRzpSU1lNOjZURDQ6SlRKQTpER1ZSOlZLTUM6SFdIMjpKVkVCOjJJTUU6MkhBQzpQUjNFIn0.eyJpc3MiOiJyZWdpc3RyeS10b2tlbi1pc3N1ZXIiLCJzdWIiOiIiLCJhdWQiOiIiLCJleHAiOjE1MTg1MzM3MzIsIm5iZiI6MTUxODUzMTkzMiwiaWF0IjoxNTE4NTMxOTMyLCJqdGkiOiJ6UDl1eWJGSlpoalI0aFBMIiwiYWNjZXNzIjpudWxsfQ.OTiYgeLHGDGIQ5fNtT2mS54GJYQDMkvjVVr_9GffBS1R1ynFBHwUK2jE--CLMNdxghlkr6nllQEvSNe2D4B3-ZDqi25fbJ85WkBJHAh-VqbGC9fV59qfhHDBaivKM6Odtwt05-T-FcMbp0MeyNuLXYiolpfPphVXCEzuU-s3j-hC49OXkJ2vamwzd58VCN9eykt-l5gEVSMihM7eOMgXo8q8RoNFRFVkfTUqzSq4UoJSBTk7kPvmDo2imCkheiZwRum-0eI5J7AFhcBmedXiql2_ZJkjRSxaCtZXVGrFqTY0ox9FrgttxfUla-7nnGHLkU_-FJROcXb-0VpQPx5S4g"

#curl -v -k -L -H "Content-Type: application/json" -X POST -d '{"username": "admin", "password": "admin"}' https://9.37.204.200:8443/image-manager/api/v1/auth/token

curl -v -k -H "Authorization: Bearer $token" https://9.37.204.200:8443/image-manager/api/v1/repositories


