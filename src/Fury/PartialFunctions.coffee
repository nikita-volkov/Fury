

exports.partialFunction = 
partialFunction = (fs) ->
  ###
  Merges functions into a single partial function which fails  when none of the partials were satisfied 
  ###
  ->
    for f in fs
      try
        return f.apply this, arguments
      catch e
        if e == "Partial function condition not met"
          continue
        else throw e
    throw "Partial function condition not met"


exports.func = 
func = (fs) ->
  ###
  Merges functions into a single function which returns null when none of the partials were satisfied
  ###
  -> 
    for f in fs
      try
        return f.apply this, arguments
      catch e
        if e == "Partial function condition not met"
          continue
        else throw e
    null
