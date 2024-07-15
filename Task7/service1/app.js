const express = require('express');
const app = express();
const axios = require('axios');

app.get('/', (req, res) => {
  res.send('Hello from Service 1!');
});

app.get('/service2', async (req, res) => {
  try {
    const response = await axios.get('http://service2:3000/');
    res.send(`Service 2 says: ${response.data}`);
  } catch (error) {
    res.status(500).send('Error communicating with Service 2');
  }
});

app.listen(3000, () => {
  console.log('Service 1 is running on port 3000');
});
