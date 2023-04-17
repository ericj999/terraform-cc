# Deploy VM in Azure and install security agent
This project contains the terraform modules and codes to deploy a VM in Azure and also install the Security Agent on the newly deployed VM. The VM deployments also create the requred resources including resource group, key vault, virtual network, subnet, network security group, public ip and admin credentials. The resources templates are defined under terraform-cc/tf/modules folder.

Project folder structures:

    terraform-cc
        ├── deployments
        |   └── scripts
        │   deploy-vm.sh
        │   install-security-agent-on-vm.sh
        │   virtual-machine.yml
        └── tf
            ├── deployments
            │   └── virtual-machine
            ├── environments
            └── modules
                ├── key_vault
                ├── network
                ├── resource_group
                └── vm 

    terraform-cc/deployments - contains the scripts to execute terraform and ansible playbook, and ansible playbook
    terraform-cc/deployments/scripts - contains the agent installation script and config file.
    terraform-cc/tf/modules - contains all the shared terraform codes for resource components.
    terraform-cc/tf/environments - contains the variable inputs for different environments, e.g. dev.tfvars
    terraform-cc/tf/deployments/virtual-machine - terraform codes for individual VM deployment  

During the VM creation, a random admin password is generated. This admin credentials will be used for security agent installation using ansible playbook.

## Prerequsites
    install Terraform
    install Ansible
    install azure-cli

## VM deployments
Create the variable input files with specific configurations for the environments in terraform-cc/tf/environments, e.g. dev.tfvars for dev environment, staging.tfvars for staging environment.
To manage the VM deployment, run the following command:
    ./deploy-vm.sh <action> [env]
    where
        action: plan|apply|destroy
        env: vev/staging/prod

## Before the deployment and installation
Run 'az login' from the command prompt before deployment. Run 'az account set ...' command to select the subscription where the resources should be created if there are multiple subscriptions in the account.

### plan the VM infrastructure without actual deployment
```bash
        cd ~/terraform-cc/deployments
        ./deploy-vm.sh plan dev
```
### deploy the VM
```bash
        cd ~/terraform-cc/deployments
        ./deploy-vm.sh apply dev
```
### remove the VM deployments completely
```bash
        cd ~/terraform-cc/deployments
        ./deploy-vm.sh destroy dev
```

When 'plan' or 'apply' parameter is specified, the script will validate the Terraform codes before performing the action.

## install security agent
```bash
    cd ~/terraform-cc/deployments
    ./install-security-agent-on-vm.sh
```
## Enhansements
Combine the terraform deployment and security agent installation into a single ansible playbook
