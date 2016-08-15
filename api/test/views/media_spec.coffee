require '../spec'

request = require 'supertest'


describe 'Media View', ->

  it 'should have a get endpoint', ->
    request(@app)
      .get('/media')
      .expect(200)
