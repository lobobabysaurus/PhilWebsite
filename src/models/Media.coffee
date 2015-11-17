Backbone = require('backbone')

module.exports = Backbone.Model.extend(
  defaults :
    site : '',
    link : '',
    image : '',
    modifiedDate:  Date.now,
    info_text : ''
)
