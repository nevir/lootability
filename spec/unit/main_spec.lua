describe('Main entry point', function()
  local scope = Lootability

  after_each(function()
    _G.Lootability = scope
  end)

  it('should not pollute the global namespace', function()
    assert.is_not_nil(Lootability)
    dofile('src/main.lua')
    assert.is_nil(Lootability)
  end)

  it('should register the addon', function()
    stub(Apollo, 'RegisterAddon')
    dofile('src/main.lua')

    assert.equals(#Apollo.RegisterAddon.calls, 1)
    args = Apollo.RegisterAddon.calls[1]
    assert.equals(args[1], scope)   -- tAddonTable
    assert.equals(args[2], true)          -- bHasConfig
    assert.equals(args[3], 'Lootability') -- strConfigName
    assert.is.table(args[4])              -- tDependencies
  end)
end)
