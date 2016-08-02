express = require 'express'
router = express.Router()

Media = require '../models/Media'

router.get '/', (req, res) ->
  media = new Media({link :"test"})
  media.save (err, media) ->
    if err
      return console.error(err)
    res.send(media)

module.exports = router
