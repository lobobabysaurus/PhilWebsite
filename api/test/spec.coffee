process.env.NODE_ENV = 'test'

config        = require 'config'
mochaMongoose = require 'mocha-mongoose'
modulePath    = require 'app-module-path'
path          = require 'path'

server = require '../src/server'


require('chai').should()

modulePath.addPath(path.join(__dirname, '..', 'src'))
modulePath.addPath(__dirname);

before ->
  server.then (state) =>
    @app = state.app
    @db  = state.db
    @clearDB = mochaMongoose(config.get('db'))

beforeEach (done) ->
  @clearDB(done)

after ->
  @app.close()
  @db.disconnect()
