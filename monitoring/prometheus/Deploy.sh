#Dibuat untuk deploy prometheus otomatis (karena file docker compose belum ada) bisa pake ini dulu

# Update sistem
echo "Updating system..."
sudo yum update -y || sudo apt update -y

# Instalasi wget dan unzip
sudo yum install wget unzip -y || sudo apt install wget unzip -y

# Instalasi Prometheus
echo "Instal Prometheus"
cd /tmp
wget https://github.com/prometheus/prometheus/releases/download/v2.46.0/prometheus-2.46.0.linux-amd64.tar.gz
tar -xvzf prometheus-2.46.0.linux-amd64.tar.gz
sudo mv prometheus-2.46.0.linux-amd64 /usr/local/prometheus

# Buat Scrape Config
cat <<EOL | sudo tee /usr/local/prometheus/prometheus.yml
	
# Belum kosong karena belum tau mau monitor apa aja

EOL

# Jalankan Prometheus
echo "Runing Prometheus"
cd /usr/local/prometheus
nohup ./prometheus --config.file=prometheus.yml > prometheus.log 2>&1 &

# Instalasi Grafana
echo "Instal Grafana"
sudo yum install -y https://dl.grafana.com/enterprise/release/grafana-enterprise-10.2.1-1.x86_64.rpm || \
sudo apt install -y grafana-enterprise
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

echo "Setup Selesai" 
#Untuk akses Access Prometheus http://<EC2-Public-IP>:9090 dan Grafana http://<EC2-Public-IP>:3000"