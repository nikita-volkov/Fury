###
Template is some abstract data used to costruct the output object. Basically what the template represents is implied by the function being called on it, so there may be any kinds of templates implied in this module.
###
FunctionTemplate = require "./FunctionTemplate"

exports.partialFunction = 
partialFunction = (template) ->
  throw "Unimplemented"

exports.overloadedFunction = 
overloadedFunction = (template) ->
  throw "Unimplemented"

exports.overloadedPartialFunction = 
overloadedPartialFunction = (template) ->
  throw "Unimplemented"


exports.composedFunction = 
composedFunction = FunctionTemplate.func


exports.func = 
func = (template) ->
  ###
  Automatically detects the type of template. Less performant than direct alternatives.
  ###
  if FunctionTemplate.isCorrect template
    FunctionTemplate.func template
  else
    throw "Unimplemented"


