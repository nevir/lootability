-- The timeline is a singleton object that maintains the database and indexes of
-- all known events.
Lootability.Timeline = Lootability.Util.NewClass()
local addon = Lootability
local scope = Lootability.Timeline

-- The top level event that is currently being focused on by the user. This
-- should be used for anything that implicitly adds new event spans.
scope.active = nil

-- Starts tracking an event in the timeline
function scope:AddEvent(event, parent)

end
