require '../spec'

request = require 'supertest'

Media = require '../../src/models/media'


describe 'Media View', ->

  beforeEach ->
    @model =
      site:      'Twitter'
      link:      'http://twitter.com/tubbycatgames'
      image:     'http://test.jpg'
      info_text: 'Game twitter'

  it 'should support listing media', ->
    new Media(@model).save  =>
      new Promise (resolve) =>
        request @app
          .get '/media'
          .expect 200
          .expect 'Content-Type', /json/
          .end (err, res) ->
            res.body.length.should.equal 1

            model = res.body[0]
            model.site.should.equal 'Twitter'
            model.link.should.equal 'http://twitter.com/tubbycatgames'
            model.image.should.equal 'http://test.jpg'
            model.info_text.should.equal 'Game twitter'
            resolve()

  it 'should support creating media', ->
    payload =
      site: 'Twitter'
      link: 'http://twitter.com/tubbycatgames'
      image: 'http://test.jpg'
      info_text: 'Game twitter'

    new Promise (resolve) =>
      request @app
        .post '/media'
        .send @model
        .expect 200
        .expect 'Content-Type', /json/
        .end (err, res) ->
          res.body.site.should.equal 'Twitter'
          res.body.link.should.equal 'http://twitter.com/tubbycatgames'
          res.body.image.should.equal 'http://test.jpg'
          res.body.info_text.should.equal 'Game twitter'
          resolve()
