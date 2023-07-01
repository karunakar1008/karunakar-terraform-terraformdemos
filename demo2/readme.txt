1. Configure azurerm providers
2. Create app registration in azure ad. 
3. Privide contributer access to this service priniciple at subscription level
3. Run below commands one by one

#download terraform providers
terraform init

#Prepare plan to deploy resources, Compare desired state with current instra state
terraform plan

#Based on the plan saved in terraform.tfstate apply changes to azure
terraform apply
