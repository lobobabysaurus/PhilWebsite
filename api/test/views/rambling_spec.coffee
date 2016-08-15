require '../spec'

request = require 'supertest'


describe 'Rambling View', ->

  it 'should have a get endpoint', ->
    request(@app)
      .get('/rambling')
      .expect(200)
