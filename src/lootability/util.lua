Lootability.Util = {}
local scope = Lootability.Util

-- Builds a new prototype that inherits from Lootability.Util.Class.
function scope.NewClass()
  class = {}
  class.__index = class
  setmetatable(class, {__index = scope.Class})
  return class
end

-- Base prototype for classes.
scope.Class = {}

-- Constructs a new instance of the current class (e.g. a prototype returned by
-- Lootability.Util.NewClass.
function scope.Class:New()
  instance = {}
  setmetatable(instance, self)
  return instance
end
