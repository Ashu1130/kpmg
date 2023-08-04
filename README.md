
# 3-Tier AWS Architecture with Private RDS

This repository contains Terraform code to create a 3-tier AWS architecture with a load balancer, EC2 instances for the web tier, and an RDS database in a private subnet.

## Infrastructure Overview

The infrastructure consists of the following components:

1. Virtual Private Cloud (VPC) - A dedicated network environment in AWS to launch resources.
2. Internet Gateway (IGW) - A gateway that enables communication between instances in the VPC and the internet.
3. Public Subnet - A subnet with a route to the Internet Gateway, containing the Application Load Balancer (ALB).
4. Private Subnet - A subnet with no direct route to the internet, containing the RDS database.
5. An Application Load Balancer (ALB) - Public-facing load balancer to distribute traffic to EC2 instances in the web tier.
6. EC2 Instances (Web Tier) - Instances running Apache web servers in a public subnet.
7. NAT Gateway - A network address translation (NAT) gateway in a public subnet to allow EC2 instances in the private subnet to access the internet.
8. RDS Database - A MySQL database running on Amazon RDS, placed in a private subnet, accessible only by EC2 instances in the private subnet via the NAT Gateway.
9. Security Groups - Configured to control inbound and outbound traffic to EC2 instances and the RDS database.
## Prerequisites

Before deploying this infrastructure, you need to have the following prerequisites:

1. Terraform installed on your local machine.
2. AWS CLI configured with appropriate credentials.

## Getting Started

To deploy the infrastructure, follow these steps:

1. Clone this repository to your local machine.
2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Review the variables in `variables.tf` and provide appropriate values in `terraform.tfvars` or via environment variables.
4. Plan the infrastructure:

   ```bash
   terraform plan
   ```

5. Deploy the infrastructure:

   ```bash
   terraform apply
   ```

6. After deployment, the outputs will display the ALB DNS name, which you can use to access your web application.

## Clean Up

To destroy the infrastructure and release all AWS resources, run:

```bash
terraform destroy
```

Please be cautious while running the destroy command as it will remove all resources created by this Terraform configuration.

## Notes

- The RDS database is placed in a private subnet and can only be accessed by the EC2 instances in the private subnet through the NAT Gateway.
- Security groups are applied to control inbound and outbound traffic to EC2 instances and the RDS database.

## Authors

- [Ashutosh](https://github.com/Ashu1130)

