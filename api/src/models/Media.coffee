mongoose = require 'mongoose'

module.exports = mongoose.model 'Media', mongoose.Schema(
  site : String,
  link : String,
  image : String,
  modifiedDate: { type: Date, default: Date.now},
  info_text : String
)
