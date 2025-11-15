import express from "express";
const app = express();
const port = process.env.PORT || 4000;

app.get("/healthz", (req, res) => res.send(" Backend activo"));
app.listen(port, () => console.log(`Servidor backend escuchando en puerto ${port}`));
