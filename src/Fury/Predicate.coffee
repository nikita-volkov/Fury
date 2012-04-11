

exports.matches = 
matches = (xs, f) ->
  for x in xs when f x

exports.firstMatch = 
firstMatch = (xs, f) ->
  for x in xs when z = f x then return z
