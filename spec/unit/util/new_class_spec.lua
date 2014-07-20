describe('Util.NewClass', function()
  local scope = Lootability.Util

  it('should create a new class that inherits from Util.Class', function()
    local MyClass = scope.NewClass()
    assert.equals(getmetatable(MyClass).__index, scope.Class)
  end)

  it('should properly inherit from a given superclass', function()
    local Parent = scope.NewClass()
    local Child = scope.NewClass(Parent)
    assert.equals(getmetatable(Child).__index, Parent)
    assert.equals(getmetatable(Parent).__index, scope.Class)
  end)

  it('should allow instantiation via :New()', function()
    local MyClass = scope.NewClass()
    local instance = MyClass:New()
    assert.equals(getmetatable(instance), MyClass)
  end)

  it('should inherit instance properties', function()
    local Parent = scope.NewClass()
    Parent.foo = 123
    Parent.bar = 'abc'
    local Child = scope.NewClass(Parent)
    Child.foo = 321
    local child = Child:New()

    assert.equals(child.foo, 321)
    assert.equals(child.bar, 'abc')
  end)

  it('should call Init() on new instances', function()
    local MyClass = scope.NewClass()
    function MyClass:Init()
      self.foo = 123
    end
    local instance = MyClass:New()
    assert.equals(instance.foo, 123)
  end)
end)
