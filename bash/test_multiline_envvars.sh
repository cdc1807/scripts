#!/bin/bash

# env | while IFS='=' read var value; do
#   case "$var" in
#     app_*)
#       cf set-env "$standbyApp" "${var#app_}" "$value" || exit 1
#       ;;
#     both_*)
#       cf set-env "$standbyApp" "${var#both_}" "$value" || exit 1
#       ;;
#     *)
#       ;;
#   esac
# done
# (we prefix broker with app_)


# set env vars
export app_user=chris
export app_pass=pass1234
export both_pipeline=yes
read -d '' both_idk << EOF
some from line 1
and something else for line 2
EOF
export both_idk2=$both_idk

echo "all env vars being set:"
echo "app_user: $app_user"
echo "app_pass: $app_pass"
echo "both_pipeline: $both_pipeline"
echo "both_idk: $both_idk"
echo "both_idk2: $both_idk2"
echo "--------------------------------------------"


multiline=""
printenv | while IFS='=' read var value; do
        # if value == "" and var doesn't contain =
        #       add line to multiline
        case "$var" in
                app_*)
                        echo "app var: $var, value: $value"
                        echo "${var#app_}"
                        ;;
                both_*)
                         echo "both var: $var, value: $value"
                         echo "${var#both_}"
                         ;;
                *)
                        echo "* var: $var, value: $value"
                        ;;
        esac
done
