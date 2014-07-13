-- Entry point for the addon
Apollo.RegisterAddon(Lootability, true, 'Lootability', {})

-- Make sure that we are not contaminating the global scope, and that our
-- sources are using their local reference to the scope.
Lootability = Lootability._previousScope
