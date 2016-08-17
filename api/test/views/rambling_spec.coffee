require '../spec'

request = require 'supertest'

Rambling = require 'models/rambling'


describe 'Rambling View', ->

  beforeEach ->
    @model =
      name:        'Ramble'
      description: 'Not sure what to ramble about'
      content:     'I got nothing'

  it 'should support listing ramblings', ->
    new Rambling(@model).save  =>
      new Promise (resolve) =>
        request @app
          .get '/rambling'
          .expect 200
          .expect 'Content-Type', /json/
          .end (err, res) ->
            res.body.length.should.equal 1

            model = res.body[0]
            model.name.should.equal 'Ramble'
            model.description.should.equal 'Not sure what to ramble about'
            model.content.should.equal 'I got nothing'
            resolve()

  it 'should suport creating a rambling', ->
    new Promise (resolve) =>
      request @app
        .post '/rambling'
        .send @model
        .expect 200
        .expect 'Content-Type', /json/
        .end (err, res) ->
          res.body.name.should.equal 'Ramble'
          res.body.description.should.equal 'Not sure what to ramble about'
          res.body.content.should.equal 'I got nothing'
          resolve()
