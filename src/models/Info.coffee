Backbone = require('backbone')

module.exports = Backbone.Model.extend(
  defaults :
    name : '',
    age  : 0,
    modifiedDate: Date.now,
    info_text :''
)
