#!/bin/bash
echo "Creating prometheus user"
sudo useradd --no-create-home prometheus
sudo mkdir /var/lib/prometheus

echo "Installing prometheus"
sudo wget https://github.com/prometheus/prometheus/releases/download/v2.19.0/prometheus-2.19.0.linux-amd64.tar.gz
sudo tar xvfz prometheus-2.19.0.linux-amd64.tar.gz

sudo cp prometheus-2.19.0.linux-amd64/prometheus /usr/local/bin
sudo cp prometheus-2.19.0.linux-amd64/promtool /usr/local/bin/
sudo cp -r prometheus-2.19.0.linux-amd64/consoles /etc/prometheus
sudo cp -r prometheus-2.19.0.linux-amd64/console_libraries /etc/prometheus

sudo cp prometheus-2.19.0.linux-amd64/promtool /usr/local/bin/
sudo rm -rf prometheus-2.19.0.linux-amd64.tar.gz prometheus-2.19.0.linux-amd64

echo "Prometheus self monitoring"
sudo touch /etc/prometheus/prometheus.yml
sudo chmod 777 /etc/prometheus/prometheus.yml
sudo echo "global:
  scrape_interval: 1s
  evaluation_interval: 1s

rule_files:
 - /etc/prometheus/rules.yml

alerting:
  alertmanagers:
  - static_configs:
    - targets:
      - localhost:9093

scrape_configs:
  - job_name: 'node_exporter'
    ec2_sd_configs:
      - region: us-east-1
        access_key: AKIAT4DYF6O3T3A5YTVY
        secret_key: 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
        port: 9100" > /etc/prometheus/prometheus.yml

sudo touch /etc/systemd/system/prometheus.service
sudo chmod 777 /etc/systemd/system/prometheus.service
sudo echo "[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \;
    --config.file /etc/prometheus/prometheus.yml \;
    --storage.tsdb.path /var/lib/prometheus/ \;
    --web.console.templates=/etc/prometheus/consoles \;
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/prometheus.service

echo "Changing permissions"
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus

echo "Install Alertmanager"
sudo wget https://github.com/prometheus/alertmanager/releases/download/v0.21.0/alertmanager-0.21.0.linux-amd64.tar.gz
sudo tar xvfz alertmanager-0.21.0.linux-amd64.tar.gz

sudo cp alertmanager-0.21.0.linux-amd64/alertmanager /usr/local/bin
sudo cp alertmanager-0.21.0.linux-amd64/amtool /usr/local/bin/
sudo mkdir /var/lib/alertmanager

sudo rm -rf alertmanager*

sudo touch /etc/prometheus/alertmanager.yml
sudo chmod 777 /etc/prometheus/alertmanager.yml
echo "Alertmanager config"
echo "route:
  group_by: [Alertname]
  receiver: email-me

receivers:
- name: email-me
  email_configs:
  - to: olapadew30@gmail.com
    from: boluw9tife@gmail.com
    smarthost: smtp.gmail.com:587
    auth_username: boluw9tife@gmail.com
    auth_identity: boluw9tife@gmail.com
    auth_password: emmywizzi" > /etc/prometheus/alertmanager.yml

sudo touch /etc/systemd/system/alertmanager.service
sudo chmod 777 /etc/systemd/system/alertmanager.service
echo "[Unit]
Description=Alert Manager
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=prometheus
Group=prometheus
ExecStart=/usr/local/bin/alertmanager \;
  --config.file=/etc/prometheus/alertmanager.yml \;
  --storage.path=/var/lib/alertmanager

Restart=always

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/alertmanager.service

sudo touch /etc/prometheus/rules.yml
sudo chmod 777 /etc/prometheus/rules.yml
echo "groups:
- name: Down
  rules:
  - alert: InstanceDown
    expr: up == 0
    for: 3m
    labels:
      severity: 'critical'
    annotations:
      summary: 'Instance  is down'
      description: ' of job  has been down for more than 3 minutes.'" > /etc/prometheus/rules.yml

echo "configure systemd"
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl restart prometheus
sudo systemctl enable alertmanager
sudo systemctl start alertmanager