#!/bin/sh

# 1. Membuat Docker Image berdasarkan Dockerfile
echo "\n1) Build Docker Image\n"
docker build -t ghcr.io/mfikriam/karsajobs-ui:latest .

# 2. Login ke GitHub Container Registry
echo "\n\n4) Login ke GitHub Container Registry\n"
echo $CR_PAT | docker login ghcr.io -u mfikriam --password-stdin

# 5. Mengunggah image ke GitHub Container Registry
echo "\n\n5) Mengunggah image ke GitHub Container Registry\n"
docker push ghcr.io/mfikriam/karsajobs-ui:latest

echo "\n\nSelesai~"