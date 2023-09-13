# 1. Mengunduh base image Node.js versi 14 Alpine dari Docker Hub
FROM node:14-alpine

# 2. Membuat working directory bernama app pada container
WORKDIR /app

# 3. Menyalin semua konten direktori saat ini ke container working directory
COPY . .

# 4. Menentukan variabel environment
ENV NODE_ENV=production DB_HOST=item-db

# 5. Install dependency dan menjalankan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# 6. Ekspos port 8080 sebagai port di mana apikasi berlajan
EXPOSE 8080

# 7. Menlajankan perintah npm start pada saat container diluncurkan
CMD ["npm", "start"]