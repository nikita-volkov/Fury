exports.Object = Object


exports.isInstanceOf =
isInstanceOf = (t, x) -> (x instanceof t) || (t == type x)

exports.type = 
type = (x) -> x?.constructor


exports.members = 
members = (x) -> v for _, v of x