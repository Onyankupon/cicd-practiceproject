# Automating the deployment of react app to AWS with monitoring and logging
*Repository forked from [Udacity](https://github.com/udacity/cdond-c3-projectstarter).*
*This project's objective was for learning purpose and [instructions](https://github.com/udacity/cdond-c3-projectstarter/tree/master/instructions) can be found in the Repository*.

## What was accomplished with this repository:
1. Deployed Infrastructure as code using Terraform
2. Designed and configured CI/CD tool to automate change delivery of a React app.
3. Utilised Configuration Management tool to accomplish deployment to AWS EC2 Instances.
4. Set up  monitoring and logging for diagnosis and configured alerts.

## Project was built with:
- CircleCI - CI/CD service
- Amazon AWS - Cloud Services
- AWS CLI - Command-line tool for AWS
- CloudFormation - Infrastructure as code tool
- Ansible - Configuration management tool
- Prometheus - Monitoring tool
- Grafana - Visualizer for Prometheus
- Terraform - Infrastructure as code tool

To try this project, fork *[Udacity](https://github.com/udacity/cdond-c3-projectstarter)* and follow *[instructions](https://github.com/udacity/cdond-c3-projectstarter/tree/master/instructions)* and check *[screenshots](https://github.com/udacity/cdond-c3-projectstarter/tree/master/instructions/screenshots).*
You can also use my *[repo](https://github.com/Onyankupon/cicd-practiceproject)* for reference.

## Prerequisites:
- CircleCI account already set up. If not then *[signup](https://circleci.com/signup/).*
- AWS account with:
    - Running database - required for setting up Project Environment Variables to allow access during runtime.
    - An S3 bucket.
    - Active Cloudfront distribution: setting this up before running config on CircleCI reduces setup-time for the cloudfront. *[InitialStack](https://github.com/Onyankupon/cicd-practiceproject/tree/master/pre-task/initial-stack.txt)*

#### Note: If you don't have this set up use *[Pre-task](https://github.com/Onyankupon/cicd-practiceproject/tree/master/pre-task)* where you can see Terraform files for a quick temporary deployment and easy teardown.

## Steps
Follow the *[Instruction](https://github.com/udacity/cdond-c3-projectstarter/tree/master/instructions)* on the original Repo.

**[Config.yml](https://github.com/Onyankupon/cicd-practiceproject/blob/master/.circleci/config.yml)** already populated save for some careful edits needed.

### Since the backend and frontend were already provided (with errors), I only configured the config.yml file to make automation possible and configured for monitoring and logging. I also made sure that it became easy to spin up and pull down infrastructures by utilising Terraform and CloudFormation as Infrastructure as code tool.

# Note
**I used Terraform to configure Infrastructures that needed to be manually set-up because I wanted to be able to destroy the Infrastructures easily.**