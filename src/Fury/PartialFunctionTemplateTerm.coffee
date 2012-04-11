{isInstanceOf} = require "./Object"

exports.type = 
type = (term) ->
  if isInstanceOf Function, term
    "predicate"
  else if isInstanceOf Array, term
    "types"
  else if isInstanceOf Number, term
    "argsNum"
  else if !term?
    "any"