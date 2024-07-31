2const express = require('express')
const app = express()
const cors = require('cors')
require('dotenv').config()
const bodyParser = require("body-parser");
const mongoose = require('mongoose');

mongoose.connect(process.env.URI)
  .then(() => console.log('Connected!'))
  .catch(err => console.log(err));
console.log(mongoose.connection.readyState);

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

const userSchema = new mongoose.Schema({
  username: String,

})

const exerciseSchema = new mongoose.Schema({
  description: String,
  userId: String,
  username: String,
  duration: Number,
  date: String,
})


const User = mongoose.model("User", userSchema)
const Exercise = mongoose.model("Exercise", exerciseSchema)

// parse application/json
app.use(bodyParser.json())

app.use(cors())
app.use(express.static('public'))
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html')
});



app.post("/api/users", async (req, res) => {
  const { username } = req.body;
  try {
    const user = new User({ username });
    const saveUser = await user.save();
    res.json(saveUser);
  } catch (error) {
    console.log(error)
  }
})

app.get('/api/users', async (req, res) => {
  try {
    const users = await User.find({});
    console.log(users)
    res.json(users)
  } catch (error) {
    console.log(error)
  }
})

app.post('/api/users/:_id/exercises', async (req, res) => {
  const _id = req.params._id;
  let { description, duration, date } = req.body;
  if (!date) date = new Date().toISOString().substring(0, 10);
  try {
    let user = await User.findById(_id);
    const exercise = new Exercise({ description, duration, date, userId: _id, username: user.username })
    const saveExercise = await exercise.save();
    console.log(user)
    res.json({
      username: user.username,
      description: exercise.description,
      duration: exercise.duration,
      date: new Date(exercise.date).toDateString(),
      _id: user._id,
    });
  } catch (error) {
    console.log(error)
  }
})

app.get("/api/users/:_id/logs", async (req, res) => {
  const { _id } = req.params;
  const from = req.query.from || new Date(0).toISOString().substring(0, 10);
  const to = req.query.to || new Date(Date.now()).toISOString().substring(0, 10);
  const limit = Number(req.query.limit) || 0;
  try {
    const user = await User.findById(_id);
    const exercises = await Exercise.find({ userId: _id, date: { $gte: from, $lte: to } })
      .select('description duration date')
      .limit(limit)
      .exec()
    console.log(exercises)
    res.json({
      _id: _id,
      username: user.username,
      count: exercises.length,
      log: exercises.map(ele => {
        return {
          description: ele.description,
          duration: ele.duration,
          date: new Date(ele.date).toDateString()
        }
      })
    })
  } catch (error) {
    console.log(error)
  }
})


const listener = app.listen(process.env.PORT || 3000, () => {
  console.log('Your app is listening on port ' + listener.address().port)
})
