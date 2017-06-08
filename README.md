# infrastructure

# Software Used

## Cloud Infrastructure
Create Network and Server infrastructure
* Terraform
* Packer

## Security
Provide security services for encryption, secret storage
- Vault

## Workflow Automation
- Jenkins
- CircleCI

## Binary Repository
- Artifactory

## Deployment Platform
- Docker

## Automated Testing
- ??

# Design Decisions

* Terraform to create infrastructure within our chosen cloud provider. Packer to create custom server images to be used by Terraform.
* Use immutable infrastructure. Use packer/docker to build images/containers for deployment.
* Use vendor hosted systems vs. hosting our own in the cloud.

# Implementation Roadmap
1. Use Terraform and Ansible to create Vault cluster
1. Use Terraform and Ansible to create Docker Swarm
2. Deploy artifact repository to Docker
2. Deploy Jenkins cluster to Docker Swarm
3. 
