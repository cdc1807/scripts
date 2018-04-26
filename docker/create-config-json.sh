#!/bin/bash

expected="ewogICAgImF1dGhzIjogewogICAgICAgICJteWNsdXN0ZXIuaWNwOjg1MDAiOiB7CiAgICAgICAgICAgICJhdXRoIjogIllXUnRhVzQ2WVdSdGFXND0iCiAgICAgICAgfQogICAgfQp9Cgo=u"

registry="mycluster.icp:8500"
user="admin"
pass="admin"

creds=$(echo -n $user:$pass | base64)
echo "creds: $creds"

read -r -d '' CONFIG <<'EOF'
{
    "auths": {
        "$registry": {
            "auth": "$creds"
        }
    }
}
EOF
echo "config: $CONFIG"

actual=$(echo $CONFIG | base64)

echo "-actual-: $actual"
echo "expected: $expected"
