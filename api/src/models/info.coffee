mongoose = require 'mongoose'


module.exports = mongoose.model 'Info', mongoose.Schema
  name:         String
  age:          Number
  modifiedDate: {type: Date, default: Date.now}
  info_text:    String
