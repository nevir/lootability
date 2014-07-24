**Event:** A timespan describing something that occurred. It
may also be a parent to other events. Examples: item drop, player attendance.

**Activity:** An event that logically groups other events for
player convenience. Examples: raid.

**Point:** Units that have a type and numeric value, and are associated with
various models (events, players, items, etc). Examples: EP, GP, DKP.

**Score:** A numeric value that is _derived_ from points and used to
rank players.

**Transaction:** An _immutable_ action describing a change associated with a particular
event. Events may contain several transactions. Example: event creation, player awarded 27 EP.

**Signal:** A _programmatic_ event fired for state changes to
events/activities. Plugins listen to signals.

**Plugin:** A small chunk of code that listens to signals, and annotates
events/activities (e.g. modifying points). Plugins can expose configuration
values to players.

**System:** A set of configuration that expresses which plugins are active, and
provides their associated configuration. Examples: DKP, EP/GP.
