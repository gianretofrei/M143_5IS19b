cd /home/ubuntu
wget -0 - https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz | tar xzf -
sudo bash
cat << EOF > /etc/systemd/system/node-exporter.service
[Unit]
Description=Prometheus Node Exporter

[Service]
Restart=always
ExecStart=/home/ubuntu/node_exporter-1.3.1.linux-amd64/node_exporter

[Install]
WantedBy=multi-user.target
EOF
exit
sudo systemctl daemon-reload
sudo systemctl enable node-exporter
sudo systemctl start node-exporter
