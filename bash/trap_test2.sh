#!/bin/bash
cat > _pipeline_script.sh << 'EOF_PIPELINE_SCRIPT'
#!/bin/bash
set -e
echo "Pipeline pre-customer script actions"

cat > _customer_script.sh << 'EOF_CUSTOMER_SCRIPT'
#!/bin/bash
echo "I'm the customer script and I'm awesome."
echo "Running tests....expecting a failure...."
exit 1
EOF_CUSTOMER_SCRIPT
source _customer_script.sh

echo "Pipeline post-customer script actions"
EOF_PIPELINE_SCRIPT

chmod +x _pipeline_script.sh
./_pipeline_script.sh
PIPELINE_EXIT_CODE=$?
set +e
echo "Pipeline finally actions"
exit $PIPELINE_EXIT_CODE