# Automating the deployment of react app to AWS with monitoring and logging
*Repository forked from [Udacity](https://github.com/udacity/cdond-c3-projectstarter).*
*This project's objective was for learning purpose and [instructions](https://github.com/udacity/cdond-c3-projectstarter/tree/master/instructions) can be found*

## What was accomplished with this repository:
1. Designed and configured CI/CD tool to automate change delivery of a React app.
2. Utilised Configuration Management tool to accomplish deployment to AWS EC2 Instances.
3. Set up  monitoring and logging for diagnosis and configured alerts.

## Project was built with:
- CircleCI - CI/CD service
- Amazon AWS - Cloud Services
- AWS CLI - Command-line tool for AWS
- CloudFormation - Infrastructure as code tool
- Ansible - Configuration management tool
- Prometheus - Monitoring tool
- Grafana - Visualizer for Prometheus
- Terraform - Infrastructure as code tool (for building required infrastructure before task start)

To try this project, fork [Udacity](https://github.com/udacity/cdond-c3-projectstarter) and follow [instructions](https://github.com/udacity/cdond-c3-projectstarter/tree/master/instructions) and check [screenshots](https://github.com/udacity/cdond-c3-projectstarter/tree/master/instructions/screenshots).
You can also refer to my [repo](https://github.com/Onyankupon/cicd-practiceproject) for reference.

## Prerequisites:
- CircleCI account already set up. If not then *[signup]*(https://circleci.com/signup/).
- AWS account with:
    - Running database
    - An S3 bucket
    **Note**: If you don't have this set up use *[Pre-task]*(pre-task/) where you can see Terraform files for quick temporary deployment and easy teardown. [instructions](https://github.com/udacity/cdond-c3-projectstarter/tree/master/instructions) is to do it manually but its easier to tear down later with Terraform.