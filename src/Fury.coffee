Function                  = require "./Fury/Function"
FunctionTemplate          = require "./Fury/FunctionTemplate"
HigherOrderFunction       = require "./Fury/HigherOrderFunction"
PartialFunctionTemplates  = require "./Fury/PartialFunctionTemplates"
Template                  = require "./Fury/Template"

exports[k] = v for k, v of {
  Function
  FunctionTemplate
  HigherOrderFunction
  PartialFunctionTemplates
}

exports.func = 
func = Template.func