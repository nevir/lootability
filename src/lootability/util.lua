Lootability.Util = {}
local scope = Lootability.Util

-- Object Orientation --

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
--
-- Calls Init() on the newly created instance.
function scope.Class:New(...)
  instance = {}
  setmetatable(instance, self)
  instance:Init(unpack(arg))
  return instance
end

-- Constructor function for instances of the class.
function scope.Class:Init(...)
end

-- Tables --

-- Merges values from source into destination in place.
function scope.MergeTable(destination, source)
  for key, value in pairs(source) do
    destination[key] = value
  end
end
