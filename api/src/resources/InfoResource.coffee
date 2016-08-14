express = require 'express'
router  = express.Router()

Info = require '../models/Info'


router.get '/', (req, res) ->
  info = new Info name: "test"
  info.save (err, model) ->
    if err then console.error err else res.send model

module.exports = router
