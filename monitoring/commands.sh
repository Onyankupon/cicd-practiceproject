sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl restart prometheus
sudo systemctl enable alertmanager
sudo systemctl start alertmanager

# Use "sudo systemctl status *service*" to check if they are running.