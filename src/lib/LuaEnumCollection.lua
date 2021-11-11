local t = require(script.Parent.Parent.t)
local LuaEnum = require(script.Parent.LuaEnum)

--[=[
	@class LuaEnumCollection

	A collection of enums and enum collections
]=]

local LuaEnumCollection = {}

local function isCollectionChild(thing)
	if t.some(LuaEnumCollection.is, LuaEnum.is)(thing) then
		return true
	end

	return false, "expected a LuaEnum or a LuaEnumCollection, got " .. typeof(thing)
end

--[=[
	@param children { [string]: (LuaEnum | LuaEnumCollection) }
	@return LuaEnumCollection

	Creates a new collection
]=]
function LuaEnumCollection.new(children)
	assert(t.map(t.string, isCollectionChild))

	local collection = {}
	for key, value in pairs(children) do
		collection[key] = value
	end

	setmetatable(collection, {
		__enumCollection = true,
		__index = function(_, key)
			error(string.format("Child %q does not existing in EnumCollection", tostring(key)))
		end,
		__newindex = function(_, key)
			error(string.format("Not allowed to set new values in EnumCollection (tried to set %q)", tostring(key)))
		end,
	})
	table.freeze(collection)

	return collection
end

--[=[
	@param thing any?
	@return (boolean, string)

	Returns whether `thing` is a LuaEnumCollection, plus a reason message if it is not.
]=]
function LuaEnumCollection.is(thing)
	if typeof(thing) ~= "table" then
		return false, "expected LuaEnumCollection, got " .. typeof(thing)
	end

	local meta = getmetatable(thing)
	if typeof(meta) ~= "table" then
		return false, "expected LuaEnumCollection, got table"
	end

	return meta.__enumCollection ~= nil
end

-- --

return LuaEnumCollection
