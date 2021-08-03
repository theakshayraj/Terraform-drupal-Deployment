
<img align="left" alt="Drupal Logo" src="https://www.drupal.org/files/Wordmark_blue_RGB.png" height="60px">
<img align="right" alt="Terraform" src="https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg"  width="300">
<p align="center"><img align="middle" width="160" height="96" alt="AWS" src="https://user-images.githubusercontent.com/42437393/126828661-63749f56-2bd4-4447-9225-f41dd737025b.png"></p>
<br>

# Drupal Deployment on AWS using Terraform 

<p align="center">
<a href="https://img.shields.io/badge/drupal-v9.2.2-009cde">
<img src="https://img.shields.io/badge/drupal-v9.2.2-009cde" /></a>
  
<a href="https://img.shields.io/badge/aws-v3.37.0-FF9900">
<img src="https://img.shields.io/badge/aws-v3.37.0-FF9900" /></a> 
  
<a href="https://img.shields.io/badge/terraform-v0.15.0-844FBA">
<img src="https://img.shields.io/badge/terraform-v0.15.0-844FBA" /></a>

</p>
<br/>

**DRUPAL** :- Drupal is an open source content management platform supporting a variety of
websites ranging from personal weblogs to large community-driven websites. 

**TERRAFORM**:-Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.

**AWS**:- Deploying Drupal on AWS makes it easy to use AWS services to further enhance the performance and extend functionality of your content management framework.

**PACKER**:-Packer is a tool for building identical machine images for multiple platforms from a single source configuration.


The goal of this project is to host Drupal site on AWS via Terraform  it's a cross-platform, extensible tool that codifies APIs into declarative configuration files that can be shared amongst team members, treated as code, edited, reviewed, and versioned.


## What are we trying to implement?

A virtual private cloud (VPC) that is configured across two Availability Zones. For each Availability Zone, this Quick Start provisions one public subnet and one private subnet, according to AWS best practices.

In the public subnets, Linux bastion hosts in an AWS Auto Scaling group to provide secure access to allow inbound Secure Shell (SSH) access to Amazon EC2 instances in the private subnets.

In the public subnets, managed network address translation (NAT) gateways to provide outbound internet connectivity for instances in the private subnets.

In the private subnets, a web server instance (Amazon Machine Image, or AMI) in an AWS Auto Scaling group to host the Drupal servers and Amazon Aurora database instances.

AWS Auto Scaling, which allows the Drupal cluster to add or remove servers based on use.
Integration of AWS Auto Scaling with Elastic Load Balancing, which automatically adds and removes instances from the load balancer. The default installation sets up low and high CPU-based thresholds for scaling the instance capacity up or down.

An AWS Identity and Access Management (IAM) role to enable AWS resources created through the Quick Start to access other AWS resources when required.

Out-of-box integration with load balancing and performance monitoring to be able to tune for cost/performance.




#### The different areas taken into account involves:
-  Application Load Balancer with Autoscaling 
-  MySql Database
-  Monitoring using Prometheus and Grafana

Also, a dedicated module named Network aims to provide desired information to implement all combinations of arguments supported by AWS and latest stable version of Terraform

## Requirements

- Sign up for AWS 
- Make 
```bash
  yum install make
```
- Packer
```bash
  yum install https://releases.hashicorp.com/packer/1.5.1/packer_1.5.1_linux_amd64.zip
```
- Terraform
```bash
  yum install https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip
```

## AMI
If you run AWS EC2 instances in AWS, then you are probably familiar with the concept of pre-baking Amazon Machine Images (AMIs).
Herein , AMI has been built using Packer wherein PHP and Nginx are preconfigured.
That is, preloading all needed software and configuration on an EC2 instance, then creating an image of that. The resulting image
can then be used to launch new instances with all software and configuration pre-loaded. This process allows the EC2 instance to come 
online and be available quickly. It not only simplifies deployment of new instances but is especially useful when an instance is part of 
an Auto Scaling group and is responding to a spike in load. If the instance takes too long to be ready, it defeats the purpose of dynamic scaling.

## DRUPAL
Drupal login page installed using composer and drush.

#### Composer 
can be used to manage Drupal and all dependencies (modules, themes, libraries).
#### Drush 
Drush is a command line shell and Unix scripting interface for Drupal.


## MODULE WORKFLOW

- `make fix`:- This list down the errors and one may fix them via the file designed in a particular format
- `make validate`:- used to validate the syntax and configuration of a template. 
- `make build`:- takes a template and runs all the builds within it in order to generate a set of artifacts.
- `make init`:- used to initialize a working directory containing Terraform configuration files.
- `make plan`:- used to creates an execution plan. 
- `make apply`:- command executes the actions proposed in a Terraform plan.
- `make destroy`:- command is a convenient way to destroy all remote objects managed by a particular Terraform configuration.

## MAKE Command: 
`make` command is used in order to "tell what to do". 
Herein we've been using `make` to running all commands with a single tool. Detailed usage is listed in the Makefile.

## Summary of Resources
-  3 Security Groups
-  2 Running Instance in ASG
-  1 RDS(Primary)

## Contributors

|  Feature           | Contributor                                   |
| :------------- | :-------------------------------------------- |
| Drupal Installation | [Digam Jain](https://github.com/digamjain), [Akshay Raj](https://github.com/theakshayraj) |
| AMI Generation | [Manan Jain](https://github.com/manan3349), [Aahan Sharma](https://github.com/mkd63) |
| Monitoring module integration | [Aahan Sharma](https://github.com/mkd63) |
| IAM Policies and Roles | [Aahan Sharma](https://github.com/mkd63), [Manan Jain](https://github.com/manan3349) |
| DB module integration | [Akshay Raj](https://github.com/theakshayraj), [Digam Jain](https://github.com/digamjain) |
| Secret Manager Integration | [Akash Raturi](https://github.com/nutsbrainup), [Aahan Sharma](https://github.com/mkd63) |
| ASG module Integration | [Akshay Raj](https://github.com/theakshayraj), [Akash Raturi](https://github.com/nutsbrainup), [Digam Jain](https://github.com/digamjain) |
| Network module Integration | [Akshay Raj](https://github.com/theakshayraj) |
| Documentation | [Digam Jain](https://github.com/digamjain), [Silky](https://github.com/silky2001), [Riya Shrivastava](https://github.com/riyas2327) |



