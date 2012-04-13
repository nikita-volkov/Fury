###
OverloadedFunctionTemplate is an alias for PartialFunctionTemplates. Since PartialFunctionTemplate is not implemented being considered useless, this title seems less confusing.
###
{isInstanceOf} = require "./Object"
PartialFunctionTemplateTerm = require "./PartialFunctionTemplateTerm"


exports.partialFunction = 
partialFunction = (templates) ->
  ###
  TESTS:
    - an overloaded by length number writer
      f = partialFunction [
        [2, (a, b) -> a + b]
        [4, (a, b, c, d)-> a + b + c + d]
      ]
      @equals 3, f 1, 2
      @equals 10, f 1, 2, 3, 4
      @fails -> f()
      @fails -> f 1
      @fails -> f 1, 2, 3
      @fails -> f 1, 2, 3, 4, 5
      @fails -> f 1, 2, 3, 4, 5, 6

    - an overloaded by types array or string joiner
      f = partialFunction [
        [[String, String], (ys, xs) -> xs + ys]
        [[Array, Array], (ys, xs) -> xs.concat ys]
      ]
      @equals "abcd", f "cd", "ab"
      @equals [1,2,3,4,5], f [3, 4, 5], [1, 2]
      @fails -> f 2, 4
      @fails -> f "ds"
      @fails -> f "1", "a", "c"

    - an overloaded by types of different length function
      f = partialFunction [
        [[String, String], -> "2 strings"],
        [[Array], -> "1 array"]
      ]
      @equals "2 strings", f "", ""
      @equals "1 array", f [2]

    - ignores parameter if type for it is null
      f = partialFunction [
        [[null, String], -> "ok"]
      ]
      @equals "ok", f 2, ""
      @equals "ok", f "2", ""

    - does not ignore specified parameters
      f = partialFunction [
        [[null, String], -> "ok"]
      ]
      @fails -> f 2, 2

    - treats empty parameters list correctly
      f = partialFunction [
        [[], -> 1]
      ]
      @equals 1, f()
      @fails -> f 1

    - counts trailing null parameters
      f = partialFunction [
        [[null], -> 1]
        [[String, null], -> 2]
      ]
      @equals 1, f 0
      @equals 2, f "0", ""
  ###
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
        if argsMatchTypes term, args
          return f.apply this, args
      when "argsNum"
        if args.length == term
          return f.apply this, args
      when "any"
        return f.apply this, args
      else 
        throw "Unsupported type"
  throw "Partial function condition not met"

argsMatchTypes = (types, args) ->
  return false if args.length != types.length
  return false for t, i in types when t? && !isInstanceOf t, args[i]
  true

