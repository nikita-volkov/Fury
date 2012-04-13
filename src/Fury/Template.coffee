###
Template is some abstract data used to costruct the output object. Basically what the template represents is implied by the function being called on it, so there may be any kinds of templates implied in this module.
###
ComposedFunctionTemplate = require "./ComposedFunctionTemplate"
OverloadedFunctionTemplate = require "./OverloadedFunctionTemplate"

exports.overloadedFunction = 
overloadedFunction = 
  OverloadedFunctionTemplate.func

exports.composedFunction = 
composedFunction = 
  ComposedFunctionTemplate.func


exports.func = 
func = (template) ->
  ###
  Automatically detects the type of template. Less performant than direct alternatives.
  ###
  if ComposedFunctionTemplate.isCorrect template
    ComposedFunctionTemplate.func template
  else
    OverloadedFunctionTemplate.func template
  # todo: to add isCorrect check to the OverloadedFunctionTemplate
  # todo: to add a partial function from PartialFunctionTemplate


