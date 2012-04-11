exports.Function = Function

exports.nested = 
nested = (container, f) ->
  -> container.call this, f.apply this, arguments

exports.partiallyApplied = 
partiallyApplied = (args, f) ->
  ->
    args1 = []
    args1.push(arg) for arg in args
    args1.push(arg) for arg in arguments
    f.apply this, args1

exports.withLength =
withLength = (length, f) ->
  args = 
    "a" + i for i in [0...length]
  body = 
    """
    return function(#{args.join(", ")}) {
      return f.apply(this, arguments);
    }
    """
  (new Function "f", body) f