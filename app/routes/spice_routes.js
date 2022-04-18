const express = require('express')
const passport = require('passport')

// const Example = require('../models/example')
const Spice = require('../models/spice')

const customErrors = require('../../lib/custom_errors')

const handle404 = customErrors.handle404
const requireOwnership = customErrors.requireOwnership

const removeBlanks = require('../../lib/remove_blank_fields')
const requireToken = passport.authenticate('bearer', { session: false })

const router = express.Router()

// CREATE
router.post('/spice-mix', requireToken, (req, res, next) => {
  console.log(req.body)
  req.body.spice.owner = req.user.id

  Spice.create(req.body.spice)
    .then((spice) => {
      res.status(201).json({ spice_list: spice.toObject() })
    })
    .catch(next)
})

// INDEX
router.get('/spice-mix', requireToken, (req, res, next) => {
  Spice.find()
  .then(spice => {
    return spice.filter(spice => { return spice.owner == req.user.id })
  })
    .then((spice) => {
      return spice.map((spice) => spice.toObject())
    })
    .then((spice) => res.status(200).json({ spice_list: spice }))
    .catch(next)
})

// SHOW
router.get('/spice-mix/:id', requireToken, (req, res, next) => {
  Spice.findById(req.params.id)
    .then(handle404)
    .then((spice) => res.status(200).json({ spice_list: spice.toObject() }))
    .catch(next)
})

// UPDATE
router.patch('/spice-mix/:id', requireToken, removeBlanks, (req, res, next) => {
  delete req.body.spice.owner

  Spice.findById(req.params.id)
    .then(handle404)
    .then((spice) => {
      requireOwnership(req, spice)

      return spice.updateOne(req.body.spice)
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

// DESTROY
router.delete('/spice-mix/:id', requireToken, (req, res, next) => {
  Spice.findById(req.params.id)
    .then(handle404)
    .then((spice) => {
      requireOwnership(req, spice)
      spice.deleteOne()
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

module.exports = router
