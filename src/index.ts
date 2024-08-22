import express, { Request, Response } from "express";
import cors from "cors";
import dotenv from 'dotenv'
import morgan from 'morgan'
dotenv.config()
const app = express();

app.use(cors());
app.use(morgan('dev'))
app.use(express.json());




app.listen(`${Number(process.env.PORT)||3003}`, () => {
    console.log(`Servidor rodando na porta ${process.env.port}`);
});