#!/bin/sh

# 1. Membuat Docker Image berdasarkan Dockerfile
echo "\n1) Build Docker Image\n"
docker build -t item-app:v1 .

# 2. Menampilkan daftar image
echo "\n\n2) Daftar image:\n"
docker images

# 3. Mengubah nama image sesuai dengan format GitHub Container Registry
echo "\n\n3) Mengubah nama image sesuai dengan format GitHub Container Registry\n"
docker tag item-app:v1 ghcr.io/mfikriam/item-app:v1
echo "ghcr.io/mfikriam/item-app:v1"

# 4. Login ke GitHub Container Registry
echo "\n\n4) Login ke GitHub Container Registry\n"
echo $CR_PAT | docker login ghcr.io -u mfikriam --password-stdin

# 5. Mengunggah image ke GitHub Container Registry
echo "\n\n5) Mengunggah image ke GitHub Container Registry\n"
docker push ghcr.io/mfikriam/item-app:v1

echo "\n\nSelesai~"