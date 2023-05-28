// import required modules
const express  = require('express');
const mongoose = require('mongoose');
const morgan   = require('morgan');

// environment 
const uri = process.env.MONGODB_URI;
const appPort = process.env.APP_PORT || 3000;

// establish a mongodb connection
mongoose.connect(uri);
const database = mongoose.connection;

database.on('error', (error) => {
    console.log(error)
})

database.once('connected', () => {
    console.log('Database Connected');
})

const app = express();
app.use(express.json());
app.use(morgan('combined'));

const routes = require('./routes/routes');

app.use('/api', routes)

app.listen(appPort, () => {
    console.log(`Server Started at ${appPort}`)
})

