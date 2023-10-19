const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user");
const dhanishrouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");

// Sign Up
dhanishrouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password, usertype } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      password: hashedPassword,
      name,
      usertype,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


// Admin page
// Sending user details to admin frontend
dhanishrouter.get('/api/userdetails', async (req, res) => {
  User.find()
    .then(user => {
      res.json(user);
    })
    .catch(err => {
      res.status(500).json({ error: err });
    });
});

// Sign In

/*const getUsertype = async (email) => {
  try {
    const user = await User.findOne({ email });
    if (!user) {
      throw new Error("User with this email does not exist!");
    }
    return user.usertype;
  } catch (err) {
    throw err;
  }
};*/


/*authRouter.get('/api/userType/email', async (req, res) => {
  try {
    const { email } = req.params;

    // Find the user in the database
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(404).json({ msg: 'User not found' });
    }

    res.json({ userType: user.userType });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});*/

/*async function getUserType(email) {
  try {
      const user = await User.findOne({ email });
      if (!user) {
          throw new Error("User with this email does not exist!");
      }
      return user.usertype;
  } catch (err) {
      throw new Error(`Failed to get userType: ${err.message}`);
  }
}*/





dhanishrouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password /*usertype*/ } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email does not exist!" });
    }
    
     
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password." });
    }
    
    const token = jwt.sign({ id: user._id }, "passwordKey");

    /*const userType = user.usertype*/
    res.json({ token, /*userType*/...user._doc});
    
  } 
  catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// return usertype
dhanishrouter.get("/api/getusertype", async (req, res) => {
  try {
    const user = await User.findOne({email: req.query.email});
    if(!user) {
      return res.status(400).json({msg: "User with this email does not exist"})
    }
    res.json({usertype: user.usertype});
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Deleting user as an admin

dhanishrouter.delete("/api/userdelete/:email", (req, res) => {
  User.findOneAndDelete({email: req.params.email})
    .then(user => {
        if(!user) {
            return res.status(404).json({ message: 'User not found' });
        }
        return res.status(200).json({ message: 'User deleted' });
    })
    .catch(err => {
      res.status(500).json({ error: err });
    });
});

// Editing user as an admin

dhanishrouter.patch('/api/userupdate', (req, res) => {
  const { id, email, name } = req.body;
  User.updateOne({ _id: id }, { $set: { name: name, email: email } }, (err, result) => {
    if (err) {
      return res.status(500).send({ status: 'error', message: 'Failed to update user' });
    }
    res.status(200).send({ status: 'success', message: 'User updated' });
  });
});



dhanishrouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// get user data
dhanishrouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

module.exports = dhanishrouter;
