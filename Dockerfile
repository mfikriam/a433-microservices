# Mengunduh base image Node.js versi 18 Alpine dari Docker Hub
FROM node:18-alpine  

# Membuat working directory bernama app pada container
WORKDIR /app

# Menyalin semua konten direktori saat ini ke container working directory
COPY . .

# Menginstall bash
RUN apk add --no-cache bash

# Mengunduh file wait-for-it.sh dan menyimpannya pada folder /bin
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Mengubah hak akses wait-for-it.sh agar dapat dieksekusi
# Shell script wait-for-it.sh berfungsi untuk memastikan RabbitMQ server telah berjalan terlebih dahulu
RUN chmod +x /bin/wait-for-it.sh

# Install dependency aplikasi
RUN npm install

# Ekspos port 3001 sebagai port di mana apikasi berlajan
EXPOSE 3001

# Menjalankan perintah npm start pada saat container diluncurkan
CMD [ "npm", "start" ] 