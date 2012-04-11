
exports.partialFunction = 
partialFunction = ([predicate, f]) ->
  ->
    if predicate.apply this, arguments
      f.apply this, arguments
    else
      throw "Partial function condition not met"