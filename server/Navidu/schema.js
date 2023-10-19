const mongoose = require("mongoose");

const msgschema = new mongoose.Schema({
    message: {
       type: String,
       required: true, 
    }
});

const Message = mongoose.model('Message', msgschema);
module.exports = Message;