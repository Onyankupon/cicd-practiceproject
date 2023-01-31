## Monitoring
**I converted the manual setup from *[codewizardly.com]*(https://codewizardly.com/prometheus-on-aws-ec2-part1/) into a Terraform format for ease.**
- Change setup of all files as required.
- *[Prometheus.tf](https://github.com/Onyankupon/cicd-practiceproject/tree/master/monitoring/prometheus/prometheus-server.tf)* - spins up an EC2 server using *[Init.sh](https://github.com/Onyankupon/cicd-practiceproject/tree/master/monitoring/prometheus/init.sh)* as userdata. Edit prometheus configuration with your prefered settings.
- Check server if all files were setup correctly (especially the ".service" files)
- Use *[commands](https://github.com/Onyankupon/cicd-practiceproject/tree/master/monitoring/commands.sh)* file to reload and restart the services.
- Access the prometheus-server using (http://"dns":9090/targets), alert using (http://"dns":9093/#/alerts).