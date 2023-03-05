Learn how to use terraform modules to deploy resources to dev,uat,prod environments

1. terraform init
2. terraform plan  
3. terraform apply --auto-approve

terraform apply --target=module.module_dev  #apply specific module

4. terraform destroy

5. terraform destroy --target=module.module_dev  #Destroy specific module