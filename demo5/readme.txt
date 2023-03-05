Learning: Terraform State
# After deployment is finished terraform create a state file to keep track of current state of the infrastructure
# Terraform uses this file to compare "current state in azure" with "desired state"
# A file with the name terraform.tfstate will be created in your working directory
# Save tfstate file remotely to avoid accidental delete or corrupt

1. terraform init
2. terraform plan -var-file terraform.tfvars -out="dev.plan"
4. terraform show dev.plan  #to check what is going to be created
3. terraform apply dev.plan



