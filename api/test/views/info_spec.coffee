require '../spec'

request = require 'supertest'

Info = require 'models/info'


describe 'Info View', ->

  beforeEach ->
    @model =
      name:      'Phil'
      age:       25
      info_text: 'Some Dude'

  it 'should support listing info', ->
    new Info(@model).save  =>
      new Promise (resolve) =>
        request @app
          .get '/info'
          .expect 200
          .expect 'Content-Type', /json/
          .end (err, res) ->
            res.body.length.should.equal 1

            model = res.body[0]
            model.name.should.equal 'Phil'
            model.age.should.equal 25
            model.info_text.should.equal 'Some Dude'
            resolve()

  it 'should allow creating info', ->
    new Promise (resolve) =>
      request @app
        .post '/info'
        .send @model
        .expect 200
        .expect 'Content-Type', /json/
        .end (err, res) ->
          res.body.name.should.equal 'Phil'
          res.body.age.should.equal 25
          res.body.info_text.should.equal 'Some Dude'
          resolve()
