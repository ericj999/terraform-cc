#!/bin/bash
# az login before running this script
set -e
usage() {
	echo "Usage: $0 <plan|apply|destroy> [env]"
	exit 1
}

env="dev"
[ "$2" != "" ] && env=$2

path="$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
tf_path="$(cd -- "${path}/../tf" >/dev/null 2>&1 ; pwd -P)"
tf_ws="${tf_path}/deployments/virtual-machine"
var_file="${tf_path}/environments/${env}.tfvars"

cat << EOF
"path = ${path}"
"tf_path = ${tf_path}"
"tf_ws = ${tf_ws}"
"var_file = ${var_file}"
EOF

cd "${tf_ws}"
echo "Initializing terraform..."
terraform init
echo "Running Terraform $1 action..."
if [ "$1" == "apply" ]; then
    terraform validate
    echo "Starting applying..."
    terraform $1 -auto-approve -var-file="${var_file}"
elif [ "$1" == "plan" ]; then
    terraform validate
    echo "Starting planning..."
    terraform $1 -var-file="${var_file}"
elif [ "$1" == "destroy" ]; then
    terraform $1 -var-file="${var_file}"
else
    usage
fi

echo "Done"
