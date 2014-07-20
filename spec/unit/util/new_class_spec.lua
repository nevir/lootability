describe('Util.NewClass', function()
  local scope = Lootability.Util

  local Parent, Child
  before_each(function()
    Parent = scope.NewClass()
    Parent.foo = 123
    Parent.bar = 'abc'
    function Parent:Init()
      self.value = 'hello'
    end

    Child = scope.NewClass(Parent)
    Child.foo = 321
  end)

  it('should create a new class that inherits from Util.Class', function()
    assert.equals(getmetatable(Parent).__index, scope.Class)
  end)

  it('should properly inherit from a given superclass', function()
    assert.equals(getmetatable(Child).__index, Parent)
    assert.equals(getmetatable(Parent).__index, scope.Class)
  end)

  it('should allow instantiation via :New()', function()
    assert.equals(getmetatable(Parent:New()), Parent)
  end)

  it('should inherit instance properties', function()
    local child = Child:New()
    assert.equals(child.foo, 321)
    assert.equals(child.bar, 'abc')
  end)

  it('should call Init() on new instances', function()
    assert.equals(Parent:New().value, 'hello')
  end)

  it('should call inherited Init() on new instances', function()
    assert.equals(Child:New().value, 'hello')
  end)

  it('should expose super to instances', function()
    function Child:Init()
      self.super.Init(self)
      self.thing = 'yup'
    end
    local child = Child:New()
    assert.equals(child.value, 'hello')
    assert.equals(child.thing, 'yup')
  end)
end)
