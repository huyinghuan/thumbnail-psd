_psd = require 'psd'
_im = require 'imagemagick'
_path = require 'path'
_async = require 'async'
_fs = require 'fs-extra'

#支持的图片类型
imageList =
  'bmp': true
  'png': true
  'jpg': true
  'jpeg': true
  'gif': true

#继承
extend = (son, father)->
  return son if not father
  son[key] = value for key, value of father

#将图片转成缩略图
covertImageToThumbnail = (filePath, savePath, options, next)->
  opt =
    srcPath: filePath
    dstPath: savePath
    width: 100
    height: 80

  #继承设置
  extend opt, options
  _im.resize opt, (err, stdout, stderr)->
    console.log err if err
    next(err, filePath) if next

#将psd转成png
covertPsdToPng = (filePath, savePath, next)->
  tmpFilePath = "#{savePath}.psd.tmp"
  _psd.open(filePath).then((psd)->
    return psd.image.saveAsPng(tmpFilePath)
  ).then(()->
    next(null, tmpFilePath, savePath)
  )

dealWithPsd = (filePath, savePath, options, cb)->
  queue = []
  #psd转png
  queue.push (next)->
    covertPsdToPng filePath, savePath, next

  #png缩小
  queue.push (filePath, savePath, next)->
    covertImageToThumbnail(filePath, savePath, options, next)

  queue.push (tmpFile, next)->
    _fs.remove tmpFile, (err)->
      next(err)

  _async.waterfall(queue, (err)->
    cb(err)
  )

###
  @filePath 需要转的文件的路径
  @savePath 生成缩略图保存的文件夹路径
  @saveFilename 保存缩略图时的文件名
###
thumbnail = (filePath, savePath, options, cb)->
  if typeof(options) is 'function'
    cb = options
    options = {}
  ext = _path.extname(filePath).replace('.', '')
  return dealWithPsd(filePath, savePath, options, cb) if ext is 'psd'
  return covertImageToThumbnail(filePath, savePath, options, cb)
  cb()


module.exports = thumbnail