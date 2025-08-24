const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const db = require('./db');
const port = process.env.PORT || 3000;
const app = express();
const apiRouter = require('./routes')

app.use(cors());
app.use(bodyParser.json());
app.use('/api', apiRouter);
app.get('/', (req, res) => {
    res.send('Hello World!!');
});
/*
db.authenticate()
    .then(() => {
        console.log('Connection has been established successfully.');
        return db.sync();
    })
    .then(() => {
        console.log('All models were synchronized successfully.');
        app.listen(port, () => {
            console.log(`Server running on port ${port}`);
        });
    })
    .catch(err => {
        console.error('Unable to connect to the database:', err);
    });
*/
async function startServer() {
    try {
        await db.authenticate();
        console.log('Connection has been established successfully.');

        await db.sync();
        console.log('All models were synchronized successfully.');

        app.listen(port, () => {
            console.log(`Server running on port ${port}`);
        });

    } catch (err) {
        console.error('Unable to connect to the database:', err);
    }
}

startServer().then();
