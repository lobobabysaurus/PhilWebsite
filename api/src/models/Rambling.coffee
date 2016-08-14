mongoose = require 'mongoose'


module.exports = mongoose.model 'Rambling', mongoose.Schema
  name:         String
  description:  String
  created:      Date
  content:      String
  modifiedDate: {type: Date, default: Date.now}
