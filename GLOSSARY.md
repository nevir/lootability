**Event:** An event is a range of time describing something that occurred. It
may also be a parent to other events. Examples: item drops, player attendance.

**Transaction:** An **immutable** action describing a change to a particular
event. Example: event creation, player awarded 27 EP.

**Activity:** An activity is an event that logically groups other events for
player convenience. Examples: raids.

**Point:** Points have a type and a numeric value, and are associated with
various models (events, players, items, etc). Examples: EP, GP, DKP.

**Score:** A score is a numeric value that is _derived_ from points in order to
rank players.

**Signal:** A signal is a _programmatic_ event fired for state changes to
events/activities. Plugins listen to signals.

**Plugin:** A small chunk of code that listens to signals, and annotates
events/activities (e.g. modifying points). Plugins can expose configuration
values to players.

**System:** A set of configuration that expresses which plugins are active, and
provides their associated configuration. Examples: DKP, EP/GP, etc.
