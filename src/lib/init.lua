local LuaEnum = require(script.LuaEnum)
local LuaEnumCollection = require(script.LuaEnumCollection)
local Builder = require(script.Builder)

LuaEnum.EnumCollection = LuaEnumCollection
LuaEnum.EnumCollection.fromModules = Builder.fromModules

return LuaEnum
