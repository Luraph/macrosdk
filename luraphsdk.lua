-- should only be used in **unobfuscated scripts!**
-- will also perform basic runtime validation on script arguments

local assert = assert
local type = type
local setfenv = setfenv

LPH_ENCNUM = function(toEncrypt, ...)
    assert(type(toEncrypt) == "number" and #{...} == 0, "LPH_ENCNUM only accepts a single constant double or integer as an argument.")
    return toEncrypt
end

LPH_ENCSTR = function(toEncrypt, ...)
    assert(type(toEncrypt) == "string" and #{...} == 0, "LPH_ENCSTR only accepts a single constant string as an argument.")
    return toEncrypt
end

LPH_JIT = function(f, ...)
    assert(type(f) == "function" and #{...} == 0, "LPH_JIT only accepts a single constant function as an argument.")
    return f
end
LPH_JIT_MAX = LPH_JIT

LPH_NO_VIRTUALIZE = function(f, ...)
    assert(type(f) == "function" and #{...} == 0, "LPH_NO_VIRTUALIZE only accepts a single constant function as an argument.")
    return f
end

LPH_NO_UPVALUES = function(f, ...)
    assert(type(setfenv) == "function", "LPH_NO_UPVALUES can only be used on Lua versions with getfenv & setfenv")
    assert(type(f) == "function" and #{...} == 0, "LPH_NO_UPVALUES only accepts a single constant function as an argument.")
    return f
end

LPH_CRASH = function(...)
    assert(#{...} == 0, "LPH_CRASH does not accept any arguments.")
end