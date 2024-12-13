# Implementasi Infrastruktur Berbasis AWS untuk Skalabilitas OpenSID

## 📚 Deskripsi Proyek
Proyek ini bertujuan untuk membangun infrastruktur berbasis cloud menggunakan layanan AWS untuk mendukung pengelolaan data dan pelayanan masyarakat desa melalui platform OpenSID. Pendekatan ini diambil untuk mengatasi keterbatasan infrastruktur lokal, memastikan keandalan layanan, dan memanfaatkan teknologi seperti Terraform, Ansible, Docker, Kubernetes, dan GitHub Actions.

## 🚀 Tujuan Proyek
1. **Skalabilitas Dinamis**: Memanfaatkan Auto Scaling untuk memastikan sistem dapat menyesuaikan kapasitas sesuai kebutuhan.
2. **Efisiensi Infrastruktur**: Menggunakan Terraform untuk provisioning otomatis dan Ansible untuk konfigurasi server.
3. **Monitoring dan Visualisasi Real-Time**: Menggunakan CloudWatch, Prometheus, dan Grafana.
4. **Deployment Otomatis**: CI/CD pipeline melalui GitHub Actions.

## 📋 Lingkup Pekerjaan
- **Provisioning Infrastruktur**: EC2 instances, RDS, S3, Auto Scaling Group (ASG) dengan Terraform.
- **Konfigurasi Server**: Ansible untuk pengaturan server otomatis.
- **Deployment & Containerization**: Docker dan Kubernetes untuk container management.
- **Pipeline CI/CD**: GitHub Actions untuk deployment otomatis.
- **Monitoring Sistem**: Prometheus dan Grafana untuk monitoring dan visualisasi.

## 💻 Functional Requirements
- **Infrastruktur**: EC2 instances, RDS, S3, ASG.
- **Deployment Aplikasi**: Docker, Kubernetes.
- **Monitoring & Logging**: CloudWatch, Prometheus, Grafana.

## ⚙️ Non-Functional Requirements
- **Scalability**: Menangani peningkatan trafik otomatis.
- **Performance**: Waktu respons aplikasi < 2 detik.
- **Reliability**: Uptime 99.9%.
- **Maintainability**: Mudah diperbarui dan di-debug.

## 💸 Estimasi Biaya Infrastruktur AWS
| Komponen                   | Minimal (USD/Bulan) | Rekomendasi (USD/Bulan) |
|---------------------------|----------------------|--------------------------|
| EC2 Instances (Auto Scaling) | 9.72 (t2.micro)    | 70 (t3.medium, 2 instances) |
| RDS                       | 15                  | 30                      |
| S3 (Penyimpanan Statis)  | 1.15                | 2.30                    |
| CloudWatch (Monitoring)  | 3                   | 10                      |
| **Total**                | **50**              | **140**                 |

## 🔗 Perbandingan dengan Solusi Lain
| Solusi                 | Kelebihan               | Kekurangan                | Biaya     |
|----------------------|--------------------------|---------------------------|------------|
| Infrastruktur Lokal   | Tanpa biaya langganan   | Rawan gangguan, mahal    | Rp 50-200 juta  |
| Google Cloud          | Alternatif cloud lain   | Biaya penyimpanan tinggi | $150/bulan  |
| Azure                 | Layanan kompetitif      | Lebih mahal dari AWS     | $155/bulan |

## 🧑‍💻 Tim Proyek
| Nama                         | Peran                |
|-----------------------------|----------------------|
| Stefanus Mongkaren          | Project Manager     |
| Fathan Surya Azinuddin      | Programmer          |
| Aditiya Tri Kurniawan       | Programmer          |
| Melati M. Roring            | Programmer          |
| Noverain Breciano Senge     | Programmer          |
| Wima Anugrah Winanda        | DevOps              |
| Muhammad Revanza            | DevOps              |
| Samuel Rombot               | DevOps              |
| Juan Imanuel Kamasi         | DevOps              |
| Glenn Jeremy Tyovanny Karu  | Desainer            |
| Febio Tandaju               | Desainer            |

## 📄 Sumber Referensi
1. [Harian Jogja - Desa Digital](https://news.harianjogja.com/read/2024/11/30/500/1196527/75265-desa-bakal-bertransformasi-menjadi-desa-digital-pada-2025-mendatang)
2. [Times Indonesia - Target Desa Digital](https://timesindonesia.co.id/pemerintahan/520063/kemendes-targetkan-tahun-2025-semua-desa-jadi-desa-digital)

## 🛠️ Teknologi yang Digunakan
- **Infrastruktur Cloud**: AWS EC2, RDS, S3, CloudWatch
- **Provisioning**: Terraform
- **Konfigurasi Server**: Ansible
- **Containerization**: Docker, Kubernetes
- **Pipeline CI/CD**: GitHub Actions
- **Monitoring & Visualisasi**: Prometheus, Grafana

---

*Dokumentasi ini dirancang untuk memberikan gambaran umum tentang proyek. Untuk detail teknis lebih lanjut, harap merujuk pada file sumber dalam repositori ini.*

