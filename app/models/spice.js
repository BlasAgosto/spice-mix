const mongoose = require('mongoose')

const spiceSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  impact: {
    type: String,
    required: true
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true
})

module.exports = mongoose.model('Spice', spiceSchema)
