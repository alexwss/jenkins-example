const express = require('express');
const app = express();

app.use(express.json());

app.post('/test', (req, res) => {
  console.log(req.body);
  console.log(req.body?.test);
  res.json({ name: "alex", surname: "silva" });
});

const PORT = 8090;
app.listen(PORT, () => console.log(`Server  running on port ${PORT}.`));
