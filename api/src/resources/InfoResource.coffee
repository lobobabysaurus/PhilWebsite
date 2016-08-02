express = require 'express'
router = express.Router()

Info = require '../models/Info'

# define the home page route
router.get '/', (req, res) ->
  info = new Info({name :"test"})
  info.save (err, info) ->
    if err
      return console.error(err)
    res.send(info)

module.exports = router
