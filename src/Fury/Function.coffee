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
    args1.push arg for arg in args
    args1.push arg for arg in arguments
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

exports.partial = 
partial = (predicate, f) ->
  ###
  A partial function conditioned by the predicate.

  Probably useless
  ###
  withLength f.length, ->
    if predicate.apply this, arguments
      f.apply this, arguments
    else
      throw "Partial function condition not met"


exports.async = 
async = (f) ->
  ###
  TESTS:
    add = async (y, x, cb) -> cb x + y
    @resultEquals 5, (cb) -> add 2, 3, cb
  ###
  -> callAsync partiallyApplied arguments, f

exports.callAsync = 
callAsync = (f) ->
  if process? && process.nextTick then process.nextTick f
  else setTimeout f, 0
  return

exports.action = 
action = (f) ->
  async (args..., cb) ->
    cb f.apply this, args

