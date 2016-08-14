express = require 'express'
router  = express.Router()

Project = require '../models/project'


router.get '/', (req, res) ->
  project = new Project name: "test"
  project.save (err, model) ->
    if err then console.error err else res.send model

module.exports = router
