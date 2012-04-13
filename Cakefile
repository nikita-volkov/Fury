###
NeatCakefile v0.1.1

A neat Cakefile optimised for typical tasks

MIT License
(c) 2012, Nikita Volkov. All rights reserved.
http://github.com/nikita-volkov/NeatCakefile

###

ChildProcess = require 'child_process'
FS = require "fs"


task "build", "compile to javascript and perform npm-install", ->
  clean -> compile -> npmInstall ->

task "run", "build and execute", ->
  clean -> compile -> npmInstall -> run ->

task "publish", "build and publish to npm registry", ->
  clean -> compile -> npmPublish ->

task "clean", "clean the lib folder", ->
  clean ->


### Actions ###

clean = (cb) ->
  removeDirContents "lib", cb

npmPublish = (cb) ->
  executeAndOutput "npm publish", cb

npmInstall = (cb) ->
  executeAndOutput "npm install", cb

compile = (cb) ->
  executeAndOutput "coffee -c -o lib src", cb

run = (cb) ->
  executeAndOutput "node lib/Main.js", cb


### Child process helpers ###

executeAndOutput = (cmd, cb) ->
  ChildProcess.exec cmd, (error, stdout, stderr) ->
    if error 
      console.error error.stack
    else 
      if stdout && !/^(\r|\n|\r\n)$/.test(stdout)
        console.log stdout
      if stderr
        console.log stderr 
      cb?()


### File system helpers ###

fileExists = (p) -> (try FS.statSync p)?.isFile() ? false

dirExists = (p) -> (try FS.statSync p)?.isDirectory() ? false

paths = (p) -> try p + "/" + sp for sp in FS.readdirSync p

removePath = (path, cb) ->
  if dirExists path then removeDir path, cb
  else if fileExists path then removeFile path, cb
  else cb?()

removeFile = (path, cb) ->
  try FS.unlink path, cb
  catch e then cb?()

removeDir = (dir, cb) ->
  removeDirContents dir, -> 
    try FS.rmdir dir, cb
    catch e then cb?()

removeDirContents = (dir, cb) ->
  each removePath, ((paths dir) ? []), cb


### Array helpers ###

each = (action, xs, cb) ->
  if xs.length > 0
    finished = 0
    for x in xs
      action x, ->
        finished++
        cb?() if finished == xs.length
        return
  else cb?()
  return


