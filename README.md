# ETL-Bash-Script
Proyek ini merupakan percobaan ETL (Extract, Transform, Load) sederhana menggunakan Bash Script dan PostgreSQL.
Data log server yang terkompresi (.gz) diekstrak, ditransformasi, lalu dimuat ke dalam database PostgreSQL untuk kemudian dapat di-query.

## Alur ETL
1. **Extract**
  - File log dikompresi (web-server-access-log.txt.gz)
  - Diekstrak menjadi file .txt
  - Mengambil kolom tertentu dari data

2. **Transform**
  - Mengubah delimiter dari # menjadi ,
  - Menghasilkan file .csv

3. **Load**
  - Membuat tabel PostgreSQL jika belum ada
  - Memuat data CSV ke dalam tabel database
  - Menampilkan isi tabel sebagai verifikasi