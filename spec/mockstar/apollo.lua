Apollo = {}

function Apollo.RegisterAddon(tAddonTable, bHasConfig, strConfigName, tDependencies)
end

-- Packages --
local packages = {}

function Apollo.RegisterPackage(tPackageTable, strName, nVersion, tDependencies)
  packages[strName] = {
    tPackage = tPackageTable,
    nVersion = nVersion,
    -- TODO(nevir): Is this correct?
    tDependencies = tDependencies,
  }
end

function Apollo.GetPackage(strName)
  return packages[strName]
end

-- Localization --

function Apollo.GetString(nId)
  return nil
end
