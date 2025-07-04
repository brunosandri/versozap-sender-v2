const venom = require('venom-bot');
const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

let client = null;

venom
  .create({
    session: 'versozap',
    multidevice: true,
    headless: true
  })
  .then((cli) => {
    client = cli;
    console.log('✅ Conectado ao WhatsApp!');

    client.onMessage((message) => {
      if (message.isGroupMsg) return;
      if (!message.body.toLowerCase().startsWith('versozap')) return;
      console.log("Mensagem relevante recebida:", message.body);
    });
  })
  .catch((error) => {
    console.error('Erro ao conectar com o WhatsApp:', error);
  });

app.get('/', (req, res) => {
  res.send('VersoZap Sender está rodando!');
});

app.post('/enviar', async (req, res) => {
  const { telefone, mensagem } = req.body;

  if (!client) {
    return res.status(500).json({ erro: 'Cliente WhatsApp não conectado' });
  }

  try {
    await client.sendText(`${telefone}@c.us`, mensagem);
    return res.json({ status: 'Mensagem enviada com sucesso' });
  } catch (err) {
    return res.status(500).json({ erro: 'Erro ao enviar mensagem', detalhes: err });
  }
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`🚀 Servidor rodando em http://localhost:${port}`);
});
