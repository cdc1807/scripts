#!/bin/bash

# need to replace file name
# need to replace SHA value with commit before where the sensitive data was added

git filter-branch --index-filter \
'git update-index --remove fyre_env_vars.sh' 5ca3a794cd8f61ea71db70797e886967dc64f62c..HEAD
git push --force --verbose --dry-run
# git push --force

# git diff 9c033c179e8de8ad5b3c4ac381a9f6ff9927e5ee..aba38f13f0b547f6bf56f96854b190c4e7288fce
