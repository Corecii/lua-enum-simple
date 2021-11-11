local t = require(script.Parent.Parent.t)

--[=[
	@class LuaEnum

	An Enum-like Lua object
]=]

local LuaEnum = {}

local function represent(representation, enumName, name, value)
	if representation == "Id" then
		return string.format("%s.%s", enumName, name)
	elseif representation == "Name" then
		return name
	elseif representation == "ValueId" then
		return string.format("%s.%s", enumName, value)
	elseif representation == "Value" then
		return value
	elseif representation == "Symbol" then
		local symbol = newproxy(true)
		getmetatable(symbol).__tostring = function()
			return string.format("<Symbol %s.%s>", enumName, name)
		end
		return symbol
	end
end

--[=[
	@type Representation "Id" | "Name" | "ValueId" | "Value" | "Symbol"
	@within LuaEnum

	A way that an enum item can be represented.

	Examples, with an enum named `Animal` and item `Dog = 1`
	* Id: `"Animal.Dog"`
	* Name: `"Dog"`
	* ValueId: `"Animal.1"`
	* Value: `1`
	* Symbol: A userdata with `tostring(symbol) == "<Symbol Animal.Dog>"`

	`Value` is best for long-term saveable data since you can keep values the same between versions.\
	`Id` is best for readability.\
	`Symbol` is best for being a unique value, but it can't be transferred over the network or saved.

	Sadly, there is no one-size-fits-all enum item representation.
	Instead of deciding which is best myself, I've written this module to work with common representations.

	I sure wish Lua had built-in enum types!
]=]

local function isRepresentation(thing)
	if thing == "Id" or thing == "Name" or thing == "ValueId" or thing == "Value" or thing == "Symbol" then
		return true
	end

	return false, 'expected Representation ("Id", "Name" | "ValueId" | "Value" | "Symbol")'
end

LuaEnum.isRepresentation = isRepresentation

local isNewArgs = t.tuple(t.string, t.map(t.string, t.integer), t.optional(isRepresentation))

--[=[
	@param enumName string -- The name of the Enum
	@param items { [string]: number } -- The enum's items
	@param representation Representation? (default: "Id")
	@return LuaEnum

	Creates a new LuaEnum.
]=]
function LuaEnum.new(enumName, items, representation)
	assert(isNewArgs(enumName, items, representation))

	representation = representation or "Id"

	local enum = {}
	local copy = {}
	for name, value in pairs(items) do
		enum[name] = represent(representation, enumName, name, value)
		copy[name] = value
	end

	setmetatable(enum, {
		__enum = {
			name = enumName,
			items = copy,
			representation = representation,
		},
		__index = function(_, key)
			error(string.format("Item %q does not existing in LuaEnum %s", tostring(key), enumName))
		end,
		__newindex = function(_, key)
			error(
				string.format(
					"Not allowed to set new values in LuaEnum (tried to set %q in %s)",
					tostring(key),
					enumName
				)
			)
		end,
	})
	table.freeze(enum)

	return enum
end

LuaEnum.Representation = table.freeze({
	Name = "Name",
	ValueId = "ValueId",
	Value = "Value",
	Symbol = "Symbol",
})

--[=[
	@param thing any?
	@return (boolean, string)

	Returns whether `thing` is a LuaEnum, plus a reason message if it is not.
]=]
function LuaEnum.is(thing)
	if typeof(thing) ~= "table" then
		return false, "expected Enum, got " .. typeof(thing)
	end

	local meta = getmetatable(thing)
	if typeof(meta) ~= "table" then
		return false, "expected Enum, got table"
	end

	return meta.__enum ~= nil
end

--[=[
	@param enum LuaEnum
	@param thing any?
	@return (boolean, string)

	Returns whether `thing` is an item of `enum`, plus a reason message if it is not.
]=]
function LuaEnum.isItem(enum, thing)
	assert(LuaEnum.is(enum))

	for _, value in pairs(enum) do
		if thing == value then
			return true
		end
	end

	return false, string.format("expected item in lua enum %s, got %s", LuaEnum.getName(enum), typeof(thing))
end

--[=[
	@param enum LuaEnum
	@param thing any?
	@return (boolean, string)

	Returns whether `thing` is an item name of `enum`, plus a reason message if it is not.
]=]
function LuaEnum.isItemName(enum, thing)
	if rawget(enum, thing) ~= nil then
		return true
	end

	return false, string.format("expected item name in lua enum %s, got %s", LuaEnum.getName(enum), typeof(thing))
end

--[=[
	@param enum LuaEnum
	@return string

	Returns the name of this enum used when creating it.
]=]
function LuaEnum.getName(enum)
	assert(LuaEnum.is(enum))

	return getmetatable(enum).__enum.name
end

--[=[
	@param enum LuaEnum
	@param item Item<enum>
	@return string

	Returns the name of an item in `enum`.
]=]
function LuaEnum.getItemName(enum, item)
	assert(LuaEnum.isItem(enum, item))

	for name, value in pairs(enum) do
		if item == value then
			return name
		end
	end
end

return LuaEnum
