// Generated by CoffeeScript 1.7.1
(function() {
  var _thumbnail;

  _thumbnail = require('../lib/index');

  _thumbnail('test/a.psd', 'test/a.thumbnail.png', function(err) {
    if (err) {
      console.log(err);
    }
    return console.log('complete a.psd');
  });

  _thumbnail('test/d.png', 'test/d.thumbnail.png', function(err) {
    if (err) {
      console.log(err);
    }
    return console.log('complete d.png');
  });

  _thumbnail('test/d.png', 'test/d-400*300.thumbnail.png', {
    width: 400,
    height: 300
  }, function(err) {
    if (err) {
      console.log(err);
    }
    return console.log('complete d.png');
  });

}).call(this);