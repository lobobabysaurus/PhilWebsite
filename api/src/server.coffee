bodyParser = require 'body-parser'
express    = require 'express'
mongoose   = require 'mongoose'
mongoose.Promise = Promise

InfoView     = require './views/info'
MediaView    = require './views/media'
ProjectView  = require './views/project'
RamblingView = require './views/rambling'


url = "mongodb://localhost:27017/PersonalSiteDB"
mongoose.connect url

mongoose.connection
  .on 'error', console.error.bind(console, 'connection error:')
  .on 'open', (callback) ->
    app = express()
    app.use bodyParser.urlencoded(extended: true)
    app.use bodyParser.json()

    app.use '/info', InfoView
    app.use '/media', MediaView
    app.use '/project', ProjectView
    app.use '/rambling', RamblingView

    port = 8080
    app.listen port, ->
      console.log "Backend Server Started"
