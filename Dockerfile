# Imagem oficial com Puppeteer + Chrome
FROM ghcr.io/puppeteer/puppeteer:latest

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia todos os arquivos do projeto para dentro do container
COPY . .

# Muda o usuário padrão de execução para o seguro
USER pptruser

# Instala as dependências
RUN npm install

# Expõe a porta 3000 para que o Railway possa acessar
EXPOSE 3000

# Comando padrão para iniciar a aplicação
CMD ["node", "index.js"]
