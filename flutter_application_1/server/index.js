const express = require("express");
const bodyParser = require('body-parser');
const mongoose = require("mongoose");
const dhanishrouter = require("./dhanish/routes/auth");
const navidurouter = require("./Navidu/msg_req_res");
const rasalrouter = require("./rasal/userdetails_req_res");
const yasirurouter = require("./yasiru/notes_req_res")

mongoose.set("strictQuery", false);

const PORT = 5000;
const app = express();

app.use(express.json());
app.use(dhanishrouter);
app.use(navidurouter);
app.use(rasalrouter);
app.use(yasirurouter);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const DB =
"mongodb+srv://rasaljay:Rasal2002@cluster0.vvmpq3c.mongodb.net/?retryWrites=true&w=majority";

mongoose
  .connect(DB)
  .then(() => {
    console.log("DB Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, () => {
  console.log(`connected at port ${PORT}`);
});
