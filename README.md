# Terraform and Ansible Automation Script
## For creating a DSE testing environment on AWS.

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


### Terraform
Update the `config.tfvars` file with your desired values. Don't forget to include the ssh public key.

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
