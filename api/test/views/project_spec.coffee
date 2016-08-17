require '../spec'

request = require 'supertest'

Project = require 'models/project'


describe 'Project View', ->

  beforeEach ->
    @model =
      name:        'Personal Site'
      description: 'My Personal Site'
      url:         'phil-simmons.com'
      github:      'test'

  it 'should support listing projects', ->
    new Project(@model).save  =>
      new Promise (resolve) =>
        request @app
          .get '/project'
          .expect 200
          .expect 'Content-Type', /json/
          .end (err, res) ->
            res.body.length.should.equal 1

            model = res.body[0]
            model.name.should.equal 'Personal Site'
            model.description.should.equal 'My Personal Site'
            model.url.should.equal 'phil-simmons.com'
            model.github.should.equal 'test'
            resolve()

  it 'should support creating projects', ->
    new Promise (resolve) =>
      request @app
        .post '/project'
        .send @model
        .expect 200
        .expect 'Content-Type', /json/
        .end (err, res) ->
          res.body.name.should.equal 'Personal Site'
          res.body.description.should.equal 'My Personal Site'
          res.body.url.should.equal 'phil-simmons.com'
          res.body.github.should.equal 'test'
          resolve()
