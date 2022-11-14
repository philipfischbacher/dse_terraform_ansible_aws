# Terraform and Ansible Automation Script
## For creating a DSE testing environment on AWS.

## AWS
### Prerequisites

#### Create a SSH Key .pub file
1. Create and download a pem file private key from AWS.
```
ssh-keygen -y -f PRIVATE_KEY.pem > PUBLIC_KEY.pub
```

2. Extract the public key from the private key.
```
ssh-keygen -y -f PRIVATE_KEY.pem > PUBLIC_KEY.pub
```
3. Place the PUBLIC\_KEY.pub file in the ./credentials directory
4. Update the config.tfvars files _ssh\_key\_filename_ field with the ssh key file name.


## Terraform
Update the `config_sample.tfvars` file with your desired values and save as `config.tfvars`. Don't forget to include the ssh public key.

#### Run the _terraform plan_ command
This can help check to see if the terraform configuration is ok.
```
terraform plan -var-file=config.tfvars
```

#### Run the _terraform apply_ command
This will actually create the infrastructure
```
terraform apply -var-file=config.tfvars
```


#### Delete and clean up
This will delete all the infrastructure resources created with Terraform
```
terraform destroy -var-file=config.tfvars
```

## Ansible
#### Copy the hosts file from Terraform
Copy the `hosts` file created by Terraform from the `terraform/ansible/` directory into the `ansible` directory
```
cp ./terraform/ansible/hosts ./ansible
```

#### Update the variables
Edit the `./group_vars/all` file and set the variables as needed.

#### Generate the SSL certificates
Run the ansible playbook to generate the SSL certificates.
```
ansible-playbook ./playbooks/generate_certs.yaml
```

#### Install DSE
Run the ansible playbook to install DSE.
```
ansible-playbook ./playbooks/install_dse.yaml
```
