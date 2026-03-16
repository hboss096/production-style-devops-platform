## Infrastructure Components

This project provisions AWS infrastructure using Terraform.

Architecture includes:

- VPC with public subnets
- EC2 instances running Nginx
- Application Load Balancer
- Security groups
- Remote Terraform state using S3
- State locking using DynamoDB

CI/CD pipeline is implemented using GitHub Actions.

Infrastructure changes are validated and planned automatically when code is pushed.
