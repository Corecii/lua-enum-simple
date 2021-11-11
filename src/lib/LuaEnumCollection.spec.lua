return function()
	local LuaEnum = require(script.Parent.LuaEnum)
	local LuaEnumCollection = require(script.Parent.LuaEnumCollection)

	local standard = {
		Dog = 1,
		Cat = 2,
		Mouse = 3,
	}

	describe("new", function()
		it("Creates a LuaEnumCollection", function()
			local Animal = LuaEnum.new("Animal", standard)
			local SubCollection = LuaEnumCollection.new({
				NotAnimal = LuaEnum.new("NotAnimal", { Car = 1 }),
			})
			local Collection = LuaEnumCollection.new({
				Animal = Animal,
				SubCollection = SubCollection,
			})
			expect(typeof(Collection)).to.equal("table")
			expect(typeof(getmetatable(Collection))).to.equal("table")
			expect(getmetatable(Collection).__enumCollection).to.equal(true)
			expect(Collection.Animal).to.equal(Animal)
			expect(Collection.SubCollection).to.equal(SubCollection)
		end)
	end)

	describe("is", function()
		it("Returns true for LuaEnumCollections", function()
			local Collection = LuaEnumCollection.new({
				Animal = LuaEnum.new("Animal", standard),
			})
			expect(LuaEnumCollection.is(Collection)).to.equal(true)
		end)
		it("Returns false for non-LuaEnumCollections", function()
			expect(LuaEnumCollection.is({})).to.equal(false)
			expect(LuaEnumCollection.is()).to.equal(false)
		end)
	end)
end
