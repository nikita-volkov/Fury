exports.Function = Function

exports.nested = 
nested = (container, f) ->
  -> container.call this, f.apply this, arguments

exports.partiallyApplied = 
partiallyApplied = (args, f) ->
  ###
  TESTS:
    - has length as large as arguments unapplied
      f = partiallyApplied [8], (a, b, c, d) -> a + b
      @equals 3, f.length
      f = partiallyApplied [], (a, b, c, d) -> a + b
      @equals 4, f.length
      f = partiallyApplied [1, 2, 3, 4], (a, b, c, d) -> a + b
      @equals 0, f.length
    - produces correct results
      f = partiallyApplied [8], (a, b, c) -> a + b
      @equals 16, f 8
      @equals 17, f 9, 12
  ###
  withLength f.length - args.length, ->
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