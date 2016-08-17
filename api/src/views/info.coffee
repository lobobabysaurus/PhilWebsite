express = require 'express'

Info = require '../models/info'


module.exports = express.Router()

  .get '/', (req, res) ->
    Info.find (err, models) ->
      if err
        res.status(500).send(err)
      else
        res.json models

  .post '/', (req, res) ->
    new Info(req.body).save (err, model) ->
      if err
        res.status(500).send(err)
      else
        res.json model
