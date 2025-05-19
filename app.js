const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello from Node.js App running in Docker on EC2!');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
