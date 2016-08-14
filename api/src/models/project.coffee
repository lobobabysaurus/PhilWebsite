mongoose = require 'mongoose'


module.exports = mongoose.model 'Project', mongoose.Schema
  name:         String
  description:  String
  started:      Date
  url:          String
  github:       String
  modifiedDate: {type: Date, default: Date.now}
