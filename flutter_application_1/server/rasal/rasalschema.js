const mongoose = require("mongoose");

const userdetailschema = new mongoose.Schema({
    goal: {
        type: String,
        required: true,
    },

    age: {
        type: Number,
        required : true,
    },

    height: {
        type: Number,
        required: true,
    },

    weight: {
        type: Number,
        required: true,
    }
});

const UserDetails = mongoose.model('UserDetails', userdetailschema);
module.exports = UserDetails;