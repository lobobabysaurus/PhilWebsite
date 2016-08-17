process.env.NODE_ENV = 'test'

config        = require 'config'
mochaMongoose = require 'mocha-mongoose'
require('chai').should()

server = require '../src/server'


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
