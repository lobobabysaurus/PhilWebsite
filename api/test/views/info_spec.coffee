require '../spec'

request = require 'supertest'


describe 'Info View', ->

  it 'should have a get endpoint', ->
    request(@app)
      .get('/info')
      .expect(200)
