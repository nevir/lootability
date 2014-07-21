pending('A complete raid', function()
  local addon = Lootability

  -- TODO(nevir): Set up event tracking/shims.

  -- Note that this is an identity mapped set of players for everyone's sanity.
  local atra  = addon.Player:Get('Atra')
  local nevir = addon.Player:Get('Nevir')
  local nyxa  = addon.Player:Get('Nyxa')

  -- The loot master will start the raid via some UI element.
  local raid = addon.Timeline:AddEvent(addon.Event:New({
    type  = addon.Event.Type.Raid,
    start = 1405994400, -- 2014-07-21T21:00:00-05:00
  }))
  -- And any players currently in the raid have their presence spans start.
  raid:AddSpan({
    type   = addon.Span.Type.Presence,
    start  = raid.start,
    player = atra,
  })
  raid:AddSpan({
    type   = addon.Span.Type.Presence,
    start  = raid.start,
    player = nevir,
  })

  -- Zomg random epic from trash!
  --
  -- While we could model this as a point in time; it might actually be valuable
  -- to track time from drop to time awarded.
  local trashDrop1 = raid:AddSpan({
    type  = addon.Span.Type.Drop,
    start = 1405995900, -- 2014-07-21T21:25:00-05:00
    item  = {}, -- TODO(nevir): Fill in!
  })
  trashDrop1.recipient = atra
  trashDrop1:Complete(1405995960) -- 2014-07-21T21:26:00-05:00

  -- Some players will show up late.
  raid:AddSpan({
    type   = addon.Span.Type.Presence,
    start  = 1405996200, -- 2014-07-21T21:30:00-05:00
    player = nyxa,
  })

  -- Zomg random crappy trash loot! Salvaged.
  local trashDrop2 = raid:AddSpan({
    type  = addon.Span.Type.Drop,
    start = 1405995900, -- 2014-07-21T21:25:00-05:00
    item  = {}, -- TODO(nevir): Fill in!
  })
  trashDrop2.recipient = nevir
  trashDrop2.
  trashDrop2:Complete(1405995960) -- 2014-07-21T21:26:00-05:00

  -- Some players will leave early.
  local atraPresence = raid:FindSpan({
    type = addon.Span.Type.Presence,
    player = atra
  })
  atraPresence:Complete(1406000700) -- 2014-07-21T22:45:00-05:00
end)
