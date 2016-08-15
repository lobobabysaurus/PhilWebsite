bodyParser = require 'body-parser'
config     = require 'config'
express    = require 'express'
mongoose   = require 'mongoose'
mongoose.Promise = Promise

InfoView     = require './views/info'
MediaView    = require './views/media'
ProjectView  = require './views/project'
RamblingView = require './views/rambling'


module.exports = new Promise (resolve) ->
  db = mongoose.connect config.get('db')
  db.connection
    .on 'error', -> console.error.bind(console, 'connection error:')
    .on 'open', ->
      app = express()

      app.use bodyParser.urlencoded(extended: true)
      app.use bodyParser.json()

      app.use '/info', InfoView
      app.use '/media', MediaView
      app.use '/project', ProjectView
      app.use '/rambling', RamblingView

      port = config.get('port')
      running = app.listen port, ->
        console.log "Server Started on Port #{port}"

      resolve
        app: running
        db: db
