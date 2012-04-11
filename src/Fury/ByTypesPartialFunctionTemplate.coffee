{isInstanceOf} = require "./Object"


exports.partialFunction = 
partialFunction = ([types, f]) ->
  ->
    if argsMatchTypes types, arguments
      f.apply this, arguments
    else
      throw "Partial function condition not met"


argsMatchTypes = (types, args) ->
  return false if args.length != types.length
  return false for t, i in types when t? && !isInstanceOf t, args[i]
  true
