const express = require("express");
const mongoose = require("mongoose");
mongoose.set("strictQuery", false);
const yasirurouter = require("./notes_req_res");
const bodyParser = require('body-parser');

const port = 5000;
const app = express();
app.use(bodyParser.json());
app.use(yasirurouter);

mongoose.connect("mongodb+srv://rasaljay:Rasal2002@cluster0.vvmpq3c.mongodb.net/?retryWrites=true&w=majority")
.then(() => {
    console.log("Connected");
});

app.listen(port, () => {
    console.log(`connected at port ${port}`)
});