# Description
This project allows you to quickly create your own OpenVPN server in the yandex cloud provider. Terraform is used to work with the provider, and ansible is used to configure the instance.

Instructions for setting up an OpenVPN server were taken from the digitalocean manual. Links to original pages below:

- https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-on-ubuntu-22-04

- https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-an-openvpn-server-on-ubuntu-22-04


# How to use
To deploy all the necessary infrastructure in the Yandex cloud, you must perform the following steps:

1. (Optional) For convenient Yandex cloud management, I recommend installing the Yandex Cloud CLI package. The YC CLI commands will be shown below to get the necessary information from your terminal.
   
   Link to instructions: https://cloud.yandex.com/en/docs/cli/operations/install-cli

2. Get the cloud id, folder id and the name of the availability zone in which the infrastructure will be deployed. This can be done in the Yandex cloud web console.
   
3. Get the default network id. If you are using the YC CLI, then this can be done with the command:

   ```console
   yc vpc network list
   ```

4. Get the default subnet id for the selected availability zone. If you are using the YC CLI, then this can be done with the command:
   ```console
   yc vpc subnet list
   ```

5. Install terraform to automatically deploy resources in the cloud.
   
   Link to instructions: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

6. For terraform to work with your cloud, you need to create a file with credentials in the format:
   ```console
   export YC_CLOUD_ID="xxxxxxx"
   export YC_TOKEN="xxxxxxx"
   export YC_FOLDER_ID="xxxxxxx"
   ```
   You can get a temporary token with the command:
   ```console
   yc iam create-token
   ```
   You can apply the credentials with the command:
   ```console
   source /path-to-created-file
   ```

7. Check the `./terraform/terraform.tfvars` file, and change the values of the variables if you need it.
   
8. Run command:
   ```console
   terraform plan
   ```
   and check that all required resources will be correctly created.

9. If everything is correct, run command:
   ```console
   terraform apply
   ```

After that, the required infrastructure is deployed.

To be continued...