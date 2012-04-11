ChildProcess = require 'child_process'

task "run", "", ->
  compile -> npmInstall -> run "lib/Main.js"

task "test", "", ->
  test ->

test = (cb) ->
  executeAndOutput "robusta-doc-test -p; robusta-test -p", cb

npmInstall = (cb) ->
  executeAndOutput "npm install", cb

compile = (cb) ->
  executeAndOutput "coffee -c -o lib src", cb

run = (file, cb) ->
  executeAndOutput "node #{file}", cb


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