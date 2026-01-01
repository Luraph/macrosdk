-- should only be used in **unobfuscated scripts!**
-- will also perform basic runtime validation on script arguments

local assert = assert
local type = typeof or type
local setfenv = setfenv

LPH_OBFUSCATED = false
LPH_LINE = 0

function LPH_ENCFUNC(toEncrypt, encKey, decKey, ...)
  local Types = {type(toEncrypt), type(encKey), type(decKey)}
  assert(Types[1] == "function", "invalid argument #1 to 'LPH_ENCFUNC' (function expected, got " .. Types[1] .. ")")
  assert(Types[2] == "string", "invalid argument #2 to 'LPH_ENCFUNC' (string expected, got " .. Types[2] .. ")")
  assert(Types[3] == "string", "invalid argument #3 to 'LPH_ENCFUNC' (string expected, got " .. Types[3] .. ")")
  assert(#{...} == 0, "LPH_ENCFUNC only takes 3 arguments.")
  return toEncrypt
end

function LPH_ENCSTR(toEncrypt, ...)
  local Types = {type(toEncrypt)}
  assert(Types[1] == "string", "invalid argument #1 to 'LPH_ENCSTR' (string expected, got " .. Types[1] .. ")")
  assert(#{...} == 0, "LPH_ENCSTR only takes 1 argument.")
  return toEncrypt
end
LPH_STRENC = LPH_ENCSTR

function LPH_ENCNUM(toEncrypt, ...)
  local Types = {type(toEncrypt)}
  assert(Types[1] == "number", "invalid argument #1 to 'LPH_ENCNUM' (number expected, got " .. Types[1] .. ")")
  assert(#{...} == 0, "LPH_ENCNUM only takes 1 argument.")
  return toEncrypt
end
LPH_NUMENC = LPH_ENCNUM

function LPH_CRASH(...)
  assert(#{...} == 0, "LPH_CRASH does not take any arguments.")
end

function LPH_JIT(toEnhance, ...)
  local Types = {type(toEnhance)}
  assert(Types[1] == "function", "invalid argument #1 to 'LPH_JIT' (function expected, got " .. Types[1] .. ")")
  assert(#{...} == 0, "LPH_JIT only takes 1 argument.")
  return toEnhance
end
LPH_JIT_MAX = LPH_JIT

function LPH_NO_VIRTUALIZE(toDevirtualize, ...)
  local Types = {type(toDevirtualize)}
  assert(Types[1] == "function", "invalid argument #1 to 'LPH_NO_VIRTUALIZE' (function expected, got " .. Types[1] .. ")")
  assert(#{...} == 0, "LPH_NO_VIRTUALIZE only takes 1 argument.")
  return toDevirtualize
end

function LPH_NO_UPVALUES(toFix, ...)
  local Types = {type(toFix)}
  assert(type(setfenv) == "function", "LPH_NO_UPVALUES can only be used on Lua versions with getfenv & setfenv")
  assert(Types[1] == "function", "invalid argument #1 to 'LPH_NO_UPVALUES' (function expected, got " .. Types[1] .. ")")
  assert(#{...} == 0, "LPH_NO_UPVALUES only takes 1 argument.")
  return toFix
end
