bodyParser = require 'body-parser'
express    = require 'express'
mongoose   = require 'mongoose'
mongoose.Promise = Promise

InfoResource     = require './resources/InfoResource'
MediaResource    = require './resources/MediaResource'
ProjectResource  = require './resources/ProjectResource'
RamblingResource = require './resources/RamblingResource'


url = "mongodb://localhost:27017/PersonalSiteDB"
mongoose.connect url

db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.on 'open', (callback) ->
  app = express()
  app.use bodyParser.urlencoded(extended: true)
  app.use bodyParser.json()

  app.use '/info', InfoResource
  app.use '/media', MediaResource
  app.use '/project', ProjectResource
  app.use '/rambling', RamblingResource

  port = 8080
  app.listen port, ->
    console.log "Backend Server Started"
