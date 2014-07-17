-- Entry point for the addon
local L = Apollo.GetPackage('Gemini:Locale-1.0').tPackage:GetLocale(Lootability.Major)

Apollo.RegisterAddon(Lootability, true, L['AddonName'], {})

-- Make sure that we are not contaminating the global scope, and that our
-- sources are using their local reference to the scope.
Lootability = Lootability._previousScope
