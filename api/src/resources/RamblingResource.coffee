express = require 'express'
router  = express.Router()

Rambling = require '../models/Rambling'


router.get '/', (req, res) ->
  rambling = new Rambling name: "test"
  rambling.save (err, model) ->
    if err then console.error err else res.send model

module.exports = router
