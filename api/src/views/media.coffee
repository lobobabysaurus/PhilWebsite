express = require 'express'

Media = require '../models/media'


module.exports = express.Router()

  .get '/', (req, res) ->
    Media.find (err, models) ->
      if err
        res.status(500).send(err)
      else
        res.json models

  .post '/', (req, res) ->
    new Media(req.body).save (err, model) ->
      if err
        res.status(500).send(err)
      else
        res.json model
