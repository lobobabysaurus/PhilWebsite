require '../spec'

request = require 'supertest'


describe 'Project View', ->

  it 'should have a get endpoint', ->
    request(@app)
      .get('/project')
      .expect(200)
