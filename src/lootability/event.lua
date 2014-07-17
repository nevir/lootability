-- An event represents a span or point in time, and may contain other events.
Lootability.Event = Lootability.Util.NewClass()
local scope = Lootability.Event

function scope:Init(values)
  -- Each event has a primary type.
  self.type     = values.type
  -- A start timestamp is required.
  self.start    = values.start
  -- An event without an end timestamp is ongoing.
  self.complete = values.complete
end
