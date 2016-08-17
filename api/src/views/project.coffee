express = require 'express'

Project = require '../models/project'


module.exports = express.Router()

  .get '/', (req, res) ->
    Project.find (err, models) ->
      if err
        res.status(500).send(err)
      else
        res.json models

  .post '/', (req, res) ->
    new Project(req.body).save (err, model) ->
      if err
        res.status(500).send(err)
      else
        res.json model
