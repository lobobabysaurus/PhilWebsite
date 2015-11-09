Info = require('./models/Info.js');
Media = require('./models/Media.js');

var info = new Info({name: "test"});
var media = new Media({link: "tesat2"});
alert(info.get('name') + media.get('link'));
