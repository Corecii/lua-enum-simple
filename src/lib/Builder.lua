local t = require(script.Parent.Parent.t)
local LuaEnum = require(script.Parent.LuaEnum)
local LuaEnumCollection = require(script.Parent.LuaEnumCollection)

local Builder = {}

--[=[
	@function fromModules
	@within LuaEnumCollection
	@param ancestor Instance
	@param representation Representation?

	Builds an EnumCollection tree from an ancestor containing modules and folders.
]=]
function Builder.fromModules(ancestor, representation)
	assert(t.Instance(ancestor))
	assert(t.optional(LuaEnum.isRepresentation)(representation))

	local children = {}
	for _, child in ipairs(ancestor:GetChildren()) do
		if child:IsA("ModuleScript") then
			children[child.Name] = LuaEnum.new(child.Name, require(child), representation)
		elseif child:IsA("Folder") then
			children[child.Name] = Builder.fromModules(child, representation)
		end
	end

	return LuaEnumCollection.new(children)
end

return Builder
