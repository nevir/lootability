describe('Timeline:StartEvent', function()
  local subject = Lootability.Timeline

  it('should create a new event starting now', function()
    local before = GameLib.GetGameTime()
    local newEvent = subject:StartEvent('MyEventType')
    assert.equals(newEvent.type, 'MyEventType')
    assert.is_true(newEvent.start >= before)
  end)
end)
