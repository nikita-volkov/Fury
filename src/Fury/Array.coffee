exports.Array = Array

first = exports.first = 
  (xs) -> xs[0] 

last = exports.last = 
  (xs) -> xs[xs.length - 1]

allButLast = exports.allButLast = 
  (xs) -> xs.slice 0, -1

allButFirst = exports.allButFirst = 
  (xs) -> xs.slice 1  
  

exports.reducedRight = 
reducedRight = (f, y0, xs) -> 
  y = y0
  for i in [(xs.length - 1)..0]
    y = f xs[i], y
  y

exports.reduced = 
reduced = (f, xs) -> reducedRight f, (last xs), allButLast xs if xs.length > 0

exports.union = 
union = (ys, xs) -> if not ys then xs else xs.concat ys