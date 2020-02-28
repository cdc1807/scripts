#!/bin/bash
function upload_tests() {
    echo "uploading tests"
}

cat > _pipeline_script.sh << 'EOF_SCRIPT'
#!/bin/bash
function trap_test() {
    echo "nested trap"
}
function run_script() {
    echo "hello world!"
    #ls -e
    exit 1
}

trap trap_test EXIT
run_script
EOF_SCRIPT

#trap - EXIT
trap upload_tests EXIT

#chmod 755 _pipeline_script.sh
#./_pipeline_script.sh

source _pipeline_script.sh