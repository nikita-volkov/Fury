###
Could be renamed to OverloadingTemplate... or not

###
{isInstanceOf} = require "./Object"

exports.partialFunction = 
partialFunction = (templates) ->
  -> results arguments, templates

exports.func = 
func = (templates) ->
  -> 
    try results arguments, templates
    catch e 
      if e != "Partial function condition not met"
        throw e

results = (args, templates) ->
  for [term, f] in templates
    switch PartialFunctionTemplateTerm.type term
      when "predicate"
        if term.apply this, args
          return f.apply this, args
      when "types"
        if argsMatchTypes types, args
          return f.apply this, args
      when "argsNum"
        throw "Unimplemented: support for argsNum"
      when "any"
        return f.apply this, args
      else 
        throw "Unsupported type"
  throw "Partial function condition not met"

argsMatchTypes = (types, args) ->
  return false if args.length != types.length
  return false for t, i in types when t? && !isInstanceOf t, args[i]
  true

