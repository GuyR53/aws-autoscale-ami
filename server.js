const randomInt = require('random-int');
const os = require('os');
const app = require('express')();
const port = 8000

app.get('/', (req, res) => {
    seed = Math.random()
    hostname = os.hostname()
    res.status(200).send(JSON.stringify({ "hostname": hostname, "seedRemoveME": seed }))
})

app.get('/api/metric', (req, res) => {
    res.status(200).send((randomInt(1, 100)).toString())
})

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
