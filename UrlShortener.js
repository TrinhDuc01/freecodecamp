require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const bodyParser = require('body-parser')
const fs = require('fs')
const dns = require('dns');

//create a file in folder public with []

const renderRandomNumber = () => {
  return new Date().valueOf();
}

const renderShortUrl = async (url) => {
  let data
  try {
    // parse JSON string to JSON object
    data = JSON.parse(fs.readFileSync(__dirname + '/public/data.json', 'utf8'));
  } catch (err) {
    console.log(`Error reading file from disk: ${err}(don't have this file)`);
  }
  const checkUrl = data.find(ele => ele.original_url === url)
  let newData
  if (!checkUrl) {
    newData = {
      original_url: url,
      short_url: renderRandomNumber()
    }
    data.push(newData);
  }
  else {
    console.log('checkUrl', checkUrl)
    return checkUrl
  }
  try {
    // convert JSON object to a string
    const data1 = JSON.stringify(data, null, 4);
    // write file to disk
    fs.writeFileSync(__dirname + '/public/data.json', data1, 'utf8');
    console.log(`File is written successfully!`);
    console.log('newdata:', newData)
    return newData;

  } catch (err) {
    console.log(`Error writing file: ${err}`);
  }
}

const getUrlFormShortUrl = (short_url) => {
  let data
  try {
    // parse JSON string to JSON object
    data = JSON.parse(fs.readFileSync(__dirname + '/public/data.json', 'utf8'));
  } catch (err) {
    console.log(`Error reading file from disk: ${err}`);
  }
  // console.log(data)
  const checkUrl = data.find(ele => ele.short_url == short_url)
  // console.log(checkUrl)
  return checkUrl
}
// getUrlFormShortUrl('1722414766108')
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json
app.use(bodyParser.json());
// Basic Configuration
const port = process.env.PORT || 3000;

app.use(cors());

app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', function (req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function (req, res) {
  res.json({ greeting: 'hello API' });
});

app.post("/api/shorturl", (req, res, next) => {
  const regex = /https:\/\/.+/g;
  if (req.body.url === '' || !regex.test(req.body.url)) {
    res.json({ error: 'invalid url' });
  }
  next();
}, async (req, res) => {
  let url = await renderShortUrl(req.body.url)
  res.json(url)

  console.log('url', url)
})

app.get('/api/shorturl/:short_url', (req, res) => {
  console.log(req.params)
  const { short_url } = req.params
  const checkUrl = getUrlFormShortUrl(short_url)
  console.log(checkUrl)
  if (checkUrl) {
    res.redirect(checkUrl.original_url)
  }
  else {
    res.json({
      error: "Wrong format",
    })
  }
})


app.listen(port, function () {
  console.log(`Listening on port ${port}`);
});
