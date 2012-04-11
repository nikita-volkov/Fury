
exports.isInstanceOf =
isInstanceOf = (t, x) -> (x instanceof t) || (t == type x)

exports.type = 
type = (x) -> x?.constructor