#!/bin/bash

_slack_url=https://ibm-cloudplatform.slack.com
_slack_api_url=$_slack_url/api
_slack_auth_url=$_slack_url/oauth/authorize

curl -v $_slack_auth_url?