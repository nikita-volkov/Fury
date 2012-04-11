{isInstanceOf} = require "./Object"

exports.partialFunction = 
partialFunction = (templates) ->
  fs = 
    PartialFunctionTemplate.partialFunction template for template in templates
  PartialFunctions.partialFunction fs


exports.func = 
func = (templates) ->
  fs = 
    PartialFunctionTemplate.partialFunction template for template in templates
  PartialFunctions.func fs



