express = require 'express'
router  = express.Router()

Media = require '../models/Media'


router.get '/', (req, res) ->
  media = new Media link: "test"
  media.save (err, model) ->
    if err then console.error err else res.send model

module.exports = router
