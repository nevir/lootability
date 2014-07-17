-- The timeline is a singleton object that maintains the database and indexes of
-- all known events.
Lootability.Timeline = Lootability.Util.NewClass()
local addon = Lootability
local scope = Lootability.Timeline

-- Kicks off a new event
function scope:StartEvent(type)
  local newEvent = addon.Event:New({
    type  = type,
    start = GameLib.GetGameTime(),
  })

  return newEvent
end
