#!/bin/bash
set -e

keyvalut_name="echen-example-keyvault"

path="$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"
playbook="${path}/virtual-machine.yml"
tf_path="$(cd -- "${path}/../tf/deployments/virtual-machine" >/dev/null 2>&1 ; pwd -P)"

cat << EOF
"deployments path = ${path}"
"playbook = ${playbook}"
"terraform path = ${tf_path}"
EOF

cd "${tf_path}"
# terraform output the public ip
vm_ip=$(terraform output -raw "public_ip")
echo "vm ip = ${vm_ip}"
# get vm admin credentials from key vault
sshuser=$(az keyvault secret show --name "sshuser-name" --vault-name "${keyvalut_name}" --query value)
sshuser_pw=$(az keyvault secret show --name "sshuser-password" --vault-name "${keyvalut_name}" --query value)

# create ansible inventory file
inventory="${path}/inventory_vm"
cat << EOF > "${inventory}"
[all]
vm_instance ansible_host=${vm_ip} ansible_connection=ssh ansible_user=${sshuser} ansible_password=${sshuser_pw}
EOF

# run ansible playbook to install the agent on vm instance
ansible-playbook -i "${inventory}" "${playbook}" -e "src_path=${path}/scripts token=CSG_\$h4p3#7e"

# remove the inventory file
rm -rf "${inventory}"