BasicFunctionComposing = require "../BasicFunctionComposing" 

exports.func = 
func = (declaration) ->
  # [head, tail...] = declaration
  head = first declaration
  tail = allButFirst declaration
  if head instanceof Function
    BasicFunctionComposing.Function.partiallyApplied (composed tail), head
  else if isDeclaration head
    reduced BasicFunctionComposing.Function.nested, (composed declaration)
  else throw "Incorrect declaration"

composed = (xs) ->
  for x in xs
    if isDeclaration x then func x else x
    
isDeclaration = (x) -> 
  (x instanceof Array) && 
  (x.length != 0) &&
  ((x[0] instanceof Function) || isDeclaration x[0])


first = (xs) -> xs[0] 
last = (xs) -> xs[xs.length - 1]
allButLast = (xs) -> xs.slice 0, -1
allButFirst = (xs) -> xs.slice 1  
reducedRight = (f, y0, xs) -> 
  y = y0
  for i in [(xs.length - 1)..0]
    y = f xs[i], y
  y
reduced = (f, xs) -> reducedRight f, (last xs), allButLast xs if xs.length > 0
