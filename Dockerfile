# Usa Node oficial com Chromium via apt
FROM node:18-slim

# Instala dependências do Chromium
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    libgbm-dev \
    chromium \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Cria diretório da aplicação
WORKDIR /app

# Copia arquivos de dependências
COPY package*.json ./

# Instala dependências Node
RUN npm install

# Copia o restante da aplicação
COPY . .

# Expõe a porta usada pelo servidor
EXPOSE 3000

# Comando para iniciar
CMD ["node", "index.js"]


