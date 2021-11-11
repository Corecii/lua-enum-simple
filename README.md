# LuaEnum

A super-simple enum type and a super-simple enum collection type.

[Documentation](https://corecii.github.io/LuaEnum/)

Install with [wally](https://wally.run):
```toml
# wally.toml
[dependencies]
LuaEnum = "corecii/lua-enum-simple@0.1.0"
```

[or use a packaged release model](https://github.com/Corecii/lua-enum-simple/releases/latest)

---

Think Roblox's enums, not Rust's enums.

I couldn't find a good mix between serializability, debugability, and simplicity, so this module lets you choose between:
* "Id" representation, `"Animal.Dog"`
* "ValueId" representation, `"Animal.1"`
* "Name" representation, `"Dog"`
* "Value" representation, `1`
* "Symbol" representation, a userdata with `tostring(symbol) == "<Symbol Animal.Dog>"`

It defaults to `Id` representation.

Additionally, this module provides a way to turn a tree of modulescripts and folders into a tree of EnumCollections and Enums.

---

LuaEnum Example:
```lua
local Animals = LuaEnum.new("Animals", {
  Dog = 1,
  Cat = 2,
  Mouse = 3,
})

print(Animals.Dog) --> "Animals.Dog"

print(LuaEnum.is(Animals)) --> true

print(LuaEnum.isItem(Animals, Animals.Dog)) --> true
print(LuaEnum.isItem(Animals, "x")) --> false

local function speak(animal)
  assert(LuaEnum.isItem(Animals, animal))

  if animal == Animals.Dog then
    print("woof")
  elseif animal == Animals.Cat then
    print("meow")
  elseif animal == Animals.Mouse then
    print("sque")
  end
end

speak(Animals.Cat) --> "meow"

-- Errors:

local x = Animals.Lizard --> Error: Item "Lizard" does not exist in LuaEnum Animals

Animals.Cat = 5 --> Error: Attempt to modify a readonly table
```