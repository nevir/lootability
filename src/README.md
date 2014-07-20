# Lootability Design

Lootability's underlying design is intended to be flexible enough to support
multiple loot systems - and hopefully - enable guilds to even combine systems.

To accomplish that, the addon has a strict separation of concerns:


## The Timeline

The first concern of the addon is to gather relevant information into a
timeline of events and event spans. These contain _all_ the metadata necessary
to award/subtract/etc points. These are all managed by the `Timeline`
singleton.

**Events** are top level groupings that embody what players look at directly:
raids, decays, etc.

**Spans** occur within events, and are what are ultimately tracked by the
system: player presence (attendnace), loot drops, etc.


## Signals

Any time a span is created/completed/etc, the timeline will fire a signal to
allow the various plugins to respond to that. There are three kinds of
signals that can fire:

**Begin:** When a span was added to the timeline. Note that the start time for
the span may _not_ be the same as the current time. Retroactively adding spans
is totally kosher.

**Tick:** Components can register to receive tick signals at a consistent
interval. The intended use here is to increment EP/DKP/etc over time (for
player attendance, etc).

**Complete:** Completion signals fire when a span has been completed. Again,
do not assume that the span was completed at the current game time.


## Scores

Various models within lootability have scores associated with them: players,
items, spans, etc. Scores are inherently a generic concept: a type, and a
numeric value - EP/GP/DKP/etc.


## Plugins

Lootability allows for players to run and configure various plugins that modify
or annotate scores for spans/players/items/etc. Some expample plugins:

**Item GP:** Each time a loot span begins, this plugin annotates the span with
the item's calculated GP value.

**Attendance:** Each time an attendance span begins, this span registers for
tick signals. Each tick, it increments one or more configured scores for the
player.

etc.


## Unknown

One thing that isn't clear is how to deal with loot rankings, randoms, etc.
The GUI probably needs *another* plugin system for displaying derived scores,
and ranking players based on them.
