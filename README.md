# Description

This project allows you to quickly create your own OpenVPN server in the yandex cloud provider. Terraform is used to work with the provider, and Ansible is used to configure the instance. And to automate the creation of client configuration files, a bash script is used.

Instructions for setting up an OpenVPN server were taken from the digitalocean manual. Links to original pages below:

https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-on-ubuntu-22-04

https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-an-openvpn-server-on-ubuntu-22-04


# Requirements

For this to work, you will need to install Terraform and Ansible. Links to official instructions are attached below:

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# How to use

To deploy your own VPN server in Yandex Cloud, you must complete the following steps:

## Deploy infrastructure with Terraform

1.  (Optional) For convenient Yandex cloud management, I recommend installing the Yandex Cloud CLI package. The YC CLI commands will be shown below to get the necessary information from your terminal.
   
    Link to instructions: https://cloud.yandex.com/en/docs/cli/operations/install-cli

2.  Get the cloud id, folder id and the name of the availability zone in which the infrastructure will be deployed. This can be done in the Yandex cloud web console.
   
3.  Get the default network id. If you are using the YC CLI, then this can be done with the command:
    ```bash
    yc vpc network list
    ```

4.  Get the default subnet id for the selected availability zone. If you are using the YC CLI, then this can be done with the command:
    ```bash
    yc vpc subnet list
    ```

5.  Install terraform to automatically deploy resources in the cloud.
    
    Link to instructions: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

6.  For terraform to work with your cloud, you need to create a file with credentials in the format:
    ```bash
    export YC_CLOUD_ID="xxxxxxx"
    export YC_TOKEN="xxxxxxx"
    export YC_FOLDER_ID="xxxxxxx"
    ```
    You can get a temporary token with the command:
    ```bash
    yc iam create-token
    ```
    You can apply the credentials with the command:
    ```bash
    source /path-to-credentials-file
    ```

7.  Go to terraform directory:
    ```bash
    cd ./terraform
    ```
   
8.  Check the `./terraform/terraform.tfvars` file, and change the values of the variables if you need it.
   
9.  Run command:
    ```bash
    terraform plan
    ```
    and check that all required resources will be correctly created.

10. If everything is correct, run command:
    ```bash
    terraform apply
    ```

After that, the required infrastructure is deployed. In Terraform output will show the ip address of your machine. You will need it to configure and connect via ssh.

## Configuration VM with Ansible

1. Copy the ip address received from Terraform and add it to the ansible inventory file. It is convenient to do this using a regular expression:
   ```bash
   sed -i "s/xxxxxxxxxx/<your-ip-address>/g" ./ansible/hosts.txt
   ```
   You will also need to change the ip address in the client config template:
   ```bash
   sed -i "s/xxxxxxxxxx/<your-ip-address>/g" ./ansible/roles/openvpn/files/base.conf
   ```

2. Go to ansible directory:
   ```bash
   cd ./ansible
   ```

3. Run a playbook that will set up your machine and install everything you need on it:
   ```bash
   ansible-playbook -i ./hosts.txt ./playbook.yaml
   ```

After executing the playbook, your machine will be configured and the openvpn server will be started.

## Creation of client configuration files

To connect to your new OpenVPN server you will need to generate a configuration file. To do this, follow these steps:
1. Connect to your machine via ssh:
   ```bash
   ssh <username>@<your-ip-address>
   ```

2. Go to easy-rsa directory:
   ```bash
   cd ./easy-rsa
   ```

3. Run the script to create a new file, passing it the filename as an argument:
   ```bash
   ./make_client_config.sh <filename>
   ```
   The generated configuration file will be placed in a directory `~/client-configs/files`

4. It remains only to download the generated file to your computer. You can do this using the `scp` utility:
   ```bash
   scp <username>@<your-ip-address>:~/client-configs/file/<filename>.ovpn ~/Downloads/
   ```
That's all! You can use the resulting file to connect to your VPN server.