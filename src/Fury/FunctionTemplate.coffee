Function = require "./Function"
Array = require "./Array"

exports.func = 
func = (template) ->
  head = Array.first template
  tail = Array.allButFirst template
  # [head, tail...] = template
  if head instanceof Function.Function
    Function.partiallyApplied (composed tail), head
  else if isTemplate head
    Array.reduced Function.nested, (composed template)
  else throw "Incorrect template"

composed = (xs) ->
  for x in xs
    if isTemplate x then func x else x
    
isTemplate = (x) -> 
  (x instanceof Array.Array) && 
  (x.length != 0) &&
  ((x[0] instanceof Function.Function) || isTemplate x[0])
