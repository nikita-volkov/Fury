FunctionTemplate = require "./FunctionTemplate"

exports.composable = 
composable = (f) ->
  composableByPositions [0], f

exports.composableByPositions = 
composableByPositions = (positions, f) ->
  ###
  TESTS:
    sum = (y, x) -> x + y
    isEven = (x) -> x % 2 == 0
    matches = (f, xs) -> x for x in xs when f x
    mapped = (f, xs) -> f x for x in xs
    result = (f, x) -> f x if x?
    d = [[matches, isEven], [mapped, [sum, 2]]]
    f = composableByPositions [0], result
    @equals [2, 4], f d, [0, 1, 2, 3]
  ###
  -> 
    newArgs = []
    for v, i in arguments
      if i in positions && v not instanceof Function
        newArgs.push FunctionTemplate.func v 
      else 
        newArgs.push v
    f.apply this, newArgs