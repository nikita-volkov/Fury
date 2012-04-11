Function = require "./Function"
Array = require "./Array"

exports.func = 
func = (template) ->
  ###
  TESTS:
    - fails when first element is inappropriate:
      sum = (y, x) -> x + y
      @fails -> func [2, sum, 3]
      
    - returns a fully-applied function when all parameters are provided:
      difference = (y, x) -> x - y
      product = (y, x) -> x * y
      @equals -14, (func [difference, 17, 3])()
      @equals 18, (func [product, 3, 6])()
    
    - returns a partially applied function on lesser arguments:
      difference = (y, x) -> x - y
      f = func [difference, 12]
      @instanceOf Function.Function, f
      @equals -5, f 7

    - filter on a function works:
      matches = (f, xs) -> x for x in xs when f x
      isEven = (x) -> x % 2 == 0
      f = func [matches, isEven]
      @equals [0, 2, 4], f [0, 1, 2, 3, 4]
    
    - works on nested declarations:
      mapped = (f, xs) -> f x for x in xs
      sum = (y, x) -> x + y
      f = func [mapped, [sum, 2]]
      @equals [2,3,4], f [0,1,2]

    - works on uber-nested declarations:
      mapped = (f, xs) -> f x for x in xs
      sum = (y, x) -> x + y
      f = func [mapped, [mapped, [sum, 3]]]
      @equals [[5,6],[7]], f [[2,3],[4]]

    - works on nested functions:
      matches = (f, xs) -> x for x in xs when f x
      mapped = (f, xs) -> f x for x in xs
      sum = (y, x) -> x + y
      isEven = (x) -> x % 2 == 0
      f = func [[matches, isEven], [mapped, [sum, 2]]]
      @equals [4,6], f [2, 3, 4]
      @equals [2,4], f [0, 1, 2, 3]
  ###

  head = Array.first template
  tail = Array.allButFirst template
  # [head, tail...] = template
  if head instanceof Function.Function
    Function.partiallyApplied (composed tail), head
  else if isCorrect head
    Array.reduced Function.nested, (composed template)
  else throw "Incorrect template"

composed = (xs) ->
  for x in xs
    if isCorrect x then func x else x
    
exports.isCorrect = 
isCorrect = (x) -> 
  (x instanceof Array.Array) && 
  (x.length != 0) &&
  ((x[0] instanceof Function.Function) || isCorrect x[0])
