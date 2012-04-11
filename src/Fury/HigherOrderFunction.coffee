FunctionTemplate = require "./FunctionTemplate"

exports.composable = 
composable = (f) ->
  composableByPositions [0], f

exports.composableByPositions = 
composableByPositions = (positions, f) ->
  -> 
    newArgs = []
    for v, i in arguments
      if i in positions && v not instanceof Function
        newArgs.push FunctionTemplate.func v 
      else 
        newArgs.push v
    f.apply this, newArgs