-- A _temporary_ global scope used to share logic between files during the
-- initialization process. This scope will be **removed** at the end of the load
-- process to avoid contamination, and to ensure proper scoping.
--
-- Instead of referencing this global scope directly, create a local reference
-- to it within each file.
Lootability = {_previousScope = Lootability}
local scope = Lootability
