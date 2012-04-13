Function                    = require "./Fury/Function"
HigherOrderFunction         = require "./Fury/HigherOrderFunction"
Template                    = require "./Fury/Template"

exports[k] = v for k, v of {
  Function
  HigherOrderFunction
  Template
}

exports[k] = v for k, v of Function
exports[k] = v for k, v of HigherOrderFunction
exports[k] = v for k, v of Template

