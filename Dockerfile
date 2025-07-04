# Imagem base com Chrome e Node
FROM ghcr.io/puppeteer/puppeteer:latest

# Diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala as dependências
RUN npm install

# Porta que será exposta
EXPOSE 3000

# Comando para iniciar
CMD ["node", "index.js"]
