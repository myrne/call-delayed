module.exports = (length, fn) ->
  unless typeof fn is "function" or fn instanceof Function
    throw new Error "second argument must be a function, but it was #{typeof fn}"
  unless length >= 0
    throw new Error "Timeout length must be positive, but it was `#{length}`."
  unless length > 0 or typeof length is "number" or length instanceof Number
    throw new Error "If timeout length is 0, it must be a clear zero. Instead it was #{length}."
  setTimeout fn, length
