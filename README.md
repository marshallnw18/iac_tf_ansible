# Infrastructure as Code: Terraform and Ansible
This repository contains Terraform and Ansible deployments that can be used to stand up a sample Jenkins CI/CD environment on AWS across a multi-region, load-balanced network. 

The Terraform configuration files included in this repo will stand up two VPCs in separate regions -- us-east-1 and us-west-2. The VPC in us-east-1 serves as the location for hosting the Jenkins master EC2 instance in one of its public subnets. The VPC in us-west-2 serves to host the Jenkins worker EC2 nodes in its public subnet. The two VPCs are then connected through a VPC peering connection to enable communication between the Jenkins master and worker nodes. 

After the configuration files are deployed, users can access the Jenkins master node via a Route53 domain that hits an application load balancer for handling traffic. 

## Network Architecture
![Network Architecture](./docs/architecture.png)

## Deploying the Infrastructure
After setting up AWS CLI and Terraform... 
TODO: Make note on RSA 2048 Keypair generation. This Terraform plan assumes that the users already has an OpenSSH compatible keypair in place (see instances.tf) that will be used to login to their Jenkins EC2 instances. 
1. Clone Repository
2.  Change directories to the cloned git repository: `cd ../deploy_iac_tf_ansible/`
3.  Initialize the Terraform backend: `terraform init`
4.  Run Terraform's validate command to ensure that the code is valid: `terraform validate`
5.  Run Terraform's plan command to see and validate the infrastructure that will be deployed: `terraform plan`
6.  Run Terraform's apply command to deploy the infrastructure to your AWS environment: `terraform apply`

## Removing and Cleaning Up the Infrastructure
1. Run `terraform destroy` while inside the cloned IAC Repository