thumbnail-psd
================
```thumbnail-psd``` module for Node.js. generate thumbnial for psd and other images.
生成psd和一些图片格式的缩略图。

## Note!
thumbnail-psd depend software ```imagemagick``` , so you should install ```imagemagick```.
How to install imagemagick? see http://www.imagemagick.org/

## Install
```shell
npm install thumbnail-psd --save
```

## How to use

```js
  _thumbnail = require('thumbnail-psd')
  _thumbnail(sourceFile, destFile[, options], callback)
```

## options [optional]
  a json object. default: {width: 100, height: 80}

### optiosn.width [optional]
  the width of thumbnail . default: 100

### options.height
  the heigth of thumbnail. default: 80
  
  
for example:

```js
  _thumbnail = require('thumbnail-psd');
  _thumbnail('test/a.psd', 'test/a.thumbnail.png', function(err) {
    if (err) {
      console.log(err);
    }else{
      console.log('complete a.psd');
    }
  });
  _thumbnail('test/d.png', 'test/d.thumbnail.png', {width: 400, height: 300}, function(err) {
    if (err) {
      console.log(err);
    }else{
      console.log('complete d.png');
    }
  });
```

## Test

```shell
npm test
```

## Support
JPEG, PNG, JPG, GIF, PSD

## LICENSE
MIT
see https://github.com/huyinghuan/grunt-file2head/blob/master/LICENSE-MIT