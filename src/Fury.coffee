Function                  = require "./Fury/Function"
FunctionTemplate          = require "./Fury/FunctionTemplate"
HigherOrderFunction       = require "./Fury/HigherOrderFunction"
PartialFunctionTemplates  = require "./Fury/PartialFunctionTemplates"

exports[k] = v for k, v of {
  Function
  FunctionTemplate
  HigherOrderFunction
  PartialFunctionTemplates
}


exports[k] = v for k, v of Function

exports[k] = v for k, v of HigherOrderFunction

exports.partialFunction = 
partialFunction = PartialFunctionTemplates.partialFunction

exports.func = 
func = ->
  throw "Unimplemented"

