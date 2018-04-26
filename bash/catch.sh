#!/bin/bash

{
    # script
    set -e
    echo hello world
    # ash
    pwd
} 2>&1 | tee -a log
exit ${PIPESTATUS[0]}
# } || {
#     # catch
#     echo here
#     exit 1
# }

# cat log
# rm log

