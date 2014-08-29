_thumbnail  = require '../lib/index'

_thumbnail('test/a.psd','test/a.thumbnail.png', (err)->
  console.log err if err
  console.log 'complete a.psd'
)

_thumbnail('test/d.png','test/d.thumbnail.png', (err)->
  console.log err if err
  console.log 'complete d.png'
)

_thumbnail('test/d.png','test/d-400*300.thumbnail.png', {width: 400, height: 300},(err)->
  console.log err if err
  console.log 'complete d.png'
)