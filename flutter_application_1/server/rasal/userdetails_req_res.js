const express = require("express");
const rasalrouter = express.Router();
const UserDetails = require('./rasalschema');

// getting the userdetails from the frontend and saving to database

rasalrouter.post('/userdetails', (req, res) => {
    const userdetails = new UserDetails({
        goal: req.body.goal,
        weight: req.body.weight,
        height: req.body.height,
        age: req.body.age,
    });
    userdetails.save()
        .then(() => {
            res.status(201).json({ message: 'Data saved successfully ' });
        })
        .catch((error) => {
            res.status(400).json({ error });
        });

});



module.exports = rasalrouter;