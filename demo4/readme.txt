Learn how to use terraform modules to deploy resources to dev,uat,prod environments

1. terraform init #It will download neccessary plugins to interact with azure
2. terraform plan  #Its a simulation to see the changes.
3. terraform apply --auto-approve  #Creates the tfstate file to maintain the records of the current deployment

terraform apply --target=module.module_dev  #apply specific module

4. terraform destroy

5. terraform destroy --target=module.module_dev  #Destroy specific module