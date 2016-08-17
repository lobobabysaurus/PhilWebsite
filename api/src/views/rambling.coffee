express = require 'express'

Rambling = require '../models/rambling'


module.exports = express.Router()

  .get '/', (req, res) ->
    Rambling.find (err, models) ->
      if err
        res.status(500).send(err)
      else
        res.json models

  .post '/', (req, res) ->
    new Rambling(req.body).save (err, model) ->
      if err
        res.status(500).send(err)
      else
        res.json model
