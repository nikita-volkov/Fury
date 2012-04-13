Function                    = require "./Fury/Function"
HigherOrderFunction         = require "./Fury/HigherOrderFunction"
ComposedFunctionTemplate    = require "./Fury/ComposedFunctionTemplate"
OverloadedFunctionTemplate  = require "./Fury/OverloadedFunctionTemplate"
Template                    = require "./Fury/Template"

exports[k] = v for k, v of {
  Function
  HigherOrderFunction
  ComposedFunctionTemplate
  OverloadedFunctionTemplate
}

exports[k] = v for k, v of Function

exports[k] = v for k, v of HigherOrderFunction

exports.partialFunction = 
partialFunction = OverloadedFunctionTemplate.partialFunction


exports.func = 
func = Template.func
