FROM ghcr.io/puppeteer/puppeteer:latest

WORKDIR /app

# Copia apenas package.json e lock como root
COPY package*.json ./

# Instala dependências como root
RUN npm install

# Copia o restante dos arquivos
COPY . .

# Usa o usuário seguro do Puppeteer
USER pptruser

EXPOSE 3000

CMD ["node", "index.js"]

