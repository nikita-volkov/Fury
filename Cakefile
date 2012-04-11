{exec} = require 'child_process'

task "run", "", ->
  compile -> npmInstall -> run "lib/Main.js"

npmInstall = (cb) ->
  exec1 "npm install", cb

compile = (cb) ->
  exec1 "coffee -c -o lib src", cb

run = (file, cb) ->
  exec1 "node #{file}", cb

exec1 = (cmd, cb) ->
  exec cmd, (error, stdout, stderr) ->
    if error 
      console.error error.stack
    else 
      if stdout && !/^(\r|\n|\r\n)$/.test(stdout)
        console.log stdout
      if stderr
        console.log stderr 
      cb?()