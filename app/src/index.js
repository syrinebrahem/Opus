import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';

const app = express();
const port = 3000;


const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);


app.use(express.static(path.join(__dirname, 'frontend')));


app.get('/api/message', (req, res) => {
  const now = new Date().toLocaleTimeString();
  res.json({
    message: `Le temps réel à Torshavn : il est ${now}`,
  });
});


app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'frontend', 'index.html'));
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Serveur en ligne sur http://0.0.0.0:${port}`);
});
