const mongoose = require('mongoose');

// https://mongoosejs.com/docs/guide.html
const dataSchema = new mongoose.Schema({
    name: {
        required: true,
        type: String
    },
    age: {
        required: true,
        type: Number
    },
    hobbies: {
        required: true,
        type: Array
    }
})

module.exports = mongoose.model('Data', dataSchema)
