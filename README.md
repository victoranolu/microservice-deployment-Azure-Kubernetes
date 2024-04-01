# Sock Shop microservice deployment on Azure Kubernetes
Using Iac Terraform and Github Action to CI/CD microservice deployment to AKS.

Sock shop is an polyglot architectural pattern developed by [weaveworks](https://www.getweave.com/weave-works/) to demonstrate a microservices based deployment. There are a number of technologies that are implemented (SpringBoot, Go, REDIS, MYSQL, MongoDB, etc.). We will be using this application set to demonstrate various use cases on top of AKS (Azure Kubernetes Service). The GitHub repository of the Sock Shop microservice can be gotten here  https://github.com/ocp-power-demos/sock-shop-demo

In this demonstration I have made a few assumption, one of it is that the root default active directory of the Azure account has created a user or a group with the privileges and security measures needed for the user/group account to deploy the neccessary resoures for the deployment account. However, I have a folder (Active Directory) in where you can create a user account under the root default active directory, enabled with Container and Kubernetes services permissions and roles which can use OICD authentication method to deploy the resources. If you have done it manually, you can skip the folder.

## Prerequistes

- A grasp of Microsoft Azure and Kubernetes fundamentals

- Terraform cli and Azure cli installed locally

Let's begin.

### Purpose

The purpose of this application is to use a reference microservices demo to show a real-life multiarchitecture compute.


### Git Strategy

Trunk-based development is the development methodology used. It is focused on keeping a single source of truth for the code repository, often referred to as the “trunk”, or “main” in the Git ecosystem. One important reason for this choice is that this master branch is always considered ready for deployment to production, without depending on other branches of other developers working new features. This strategy is perfect for CI/CD automation, setup testing with staging environment while using feature flags. In this project, the naming convention for git branch;

- Surname

- Name of the what you want to do. For example, if you want to add another Azure resource, anolu/blobstorage, is an acceptable branch name.


Every pull request and squashing of merge conflict must require a review before merging conflict can be resolved.


### Monitoring and Logging

Both monitoring and logging have a different file to deploy. A workspace resource is dpeloyed, one each for monitoring and logging. The `monitoring.tf` has a metric alert resource with the Azure Kubernetes on its scope, checking up every possible metric.


### Network

The Kubernetes uses an `azure` managed network plugin and mode while the CNI is managed by `cilium`. A virtual network is resourced with a private subnet and a public subnet. Channeling through a NAT gateway under a security group rule listening at HTTPS port. 

A DNS zone and domain is resourced to have a readable domain name URL to the microservice application. This is achieved using a Public IP address linked to the A-record of the DNS zone. This Public IP is the external load balancer IP of the AKS because it is http-proxy-enabled.