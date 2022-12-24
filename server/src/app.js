require("dotenv").config();

const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const morgan = require("morgan");

const app = express();
app.use(morgan("combined"));
app.use(bodyParser.json());
app.use(cors());

const db = require("./middleware/db");
const routePeople = require("./routes/people");

app.get("/", (req, res) => {
  res.send(
    "<h1 style='text-align:center'>Halo, Namaku Syahril Syahputra<br> Ini Adalah API Untuk Data Yang Akan Digunakan Untuk Test Javan</h1>"
  );
});

app.use("/people", db, routePeople);

const port = process.env.API_PORT;
app.listen(port, () => console.log(`Server started, listening port: ${port}`));
