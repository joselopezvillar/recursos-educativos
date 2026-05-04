import express from "express";          // Framework para crear o servidor
import cors from "cors";                // Permite comunicación entre frontend e backend
import jsonServer from "json-server";   // Simula unha API REST a partir dun JSON
import path from "path";                // Xestión de rutas de ficheiros
import { fileURLToPath } from "url";    // Necesario para ES Modules

const app = express();                  // Creamos a aplicación Express
const PORT = 3000;                      // Porto onde se executa o servidor

// -------------------------------------------------
// Adaptación para ES Modules (non existe __dirname)
// -------------------------------------------------
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// -------------------------------------------------
// Middleware básico
// -------------------------------------------------
app.use(cors()); 
// Permite que o frontend (por exemplo Vite en localhost:5173)
// poida facer peticións ao backend (localhost:3000)

// -------------------------------------------------
// json-server: crea a API a partir de db.json
// -------------------------------------------------
const router = jsonServer.router(
  path.join(__dirname, "../db/db.json")
);
// Converte o ficheiro db.json nunha API REST completa
// (GET, POST, PUT, DELETE)

// Middlewares propios de json-server (logger, estáticos, etc.)
const middlewares = jsonServer.defaults();

app.use(middlewares);
// Aplica os middlewares internos de json-server

// -------------------------------------------------
// Montaxe da API
// -------------------------------------------------
app.use(router);
// Expón directamente as rutas:
// /usuarios
// /tarefas
// sen prefixos adicionais para evitar conflitos

// -------------------------------------------------
// Arranque do servidor
// -------------------------------------------------
app.listen(PORT, () => {
  console.log(`API simulada en http://localhost:${PORT}`);
});
// Inicia o servidor no porto indicado