{isInstanceOf} = require "./Object"
ByTypesPartialFunctionTemplate = require "./ByTypesPartialFunctionTemplate"
ByPredicatePartialFunctionTemplate = require "./ByPredicatePartialFunctionTemplate"

exports.partialFunction = 
partialFunction = (template) ->
  ###
  Partial function is a standard function throwing a specific exception when the `term` is not met.
  ###
  if isInstanceOf Array, template[0]
    ByTypesPartialFunctionTemplate.partialFunction template
  else if isInstanceOf Number, template[0]
    throw "Unimplemented"
  else if isInstanceOf Function, template[0]
    ByPredicatePartialFunctionTemplate.partialFunction template
