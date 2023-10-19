const mongoose = require("mongoose");

const noteschema = new mongoose.Schema({
    note: {
        type: String,
        required: true,
    }
})

const Notes = mongoose.model('Notes', noteschema);
module.exports = Notes;