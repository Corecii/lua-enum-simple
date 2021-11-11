return function()
	local LuaEnum = require(script.Parent.LuaEnum)

	local standard = {
		Dog = 1,
		Cat = 2,
		Mouse = 3,
	}

	describe("new", function()
		it("Creates a LuaEnum", function()
			local Animal = LuaEnum.new("Animal", standard)
			expect(typeof(Animal)).to.equal("table")
			expect(typeof(getmetatable(Animal))).to.equal("table")
			expect(typeof(getmetatable(Animal).__enum)).to.equal("table")
			expect(Animal.Dog).to.equal("Animal.Dog")
		end)

		it("Supports all representations", function()
			local representations = {
				Id = {
					Dog = "Animal.Dog",
					Cat = "Animal.Cat",
					Mouse = "Animal.Mouse",
				},
				Name = {
					Dog = "Dog",
					Cat = "Cat",
					Mouse = "Mouse",
				},
				ValueId = {
					Dog = "Animal.1",
					Cat = "Animal.2",
					Mouse = "Animal.3",
				},
			}

			for representation, values in pairs(representations) do
				local Animal = LuaEnum.new("Animal", standard, representation)
				for name, value in pairs(values) do
					expect(Animal[name]).to.equal(value)
				end
			end

			do
				local Animal = LuaEnum.new("Animal", standard, "Symbol")
				for name, _ in pairs(standard) do
					expect(typeof(Animal[name])).to.equal("userdata")
					expect(tostring(Animal[name])).to.equal("<Symbol Animal." .. name .. ">")
				end
			end
		end)
	end)

	describe("is", function()
		it("Returns true for LuaEnums", function()
			expect(LuaEnum.is(LuaEnum.new("Animal", standard))).to.equal(true)
		end)
		it("Returns false for non-LuaEnums", function()
			expect(LuaEnum.is({})).to.equal(false)
			expect(LuaEnum.is()).to.equal(false)
		end)
	end)

	describe("isItem", function()
		it("Returns true for items", function()
			local Animal = LuaEnum.new("Animal", standard)
			expect(LuaEnum.isItem(Animal, Animal.Cat)).to.equal(true)
		end)
		it("Returns false for non-items", function()
			local Animal = LuaEnum.new("Animal", standard)
			local NotAnimal = LuaEnum.new("NotAnimal", { Car = 1 })
			expect(LuaEnum.isItem(Animal, NotAnimal.Car)).to.equal(false)
			expect(LuaEnum.isItem(Animal, {})).to.equal(false)
			expect(LuaEnum.isItem(Animal, nil)).to.equal(false)
		end)
	end)

	describe("isItemName", function()
		it("Returns true for Item", function()
			local Animal = LuaEnum.new("Animal", standard)
			expect(LuaEnum.isItemName(Animal, "Cat")).to.equal(true)
		end)
		it("Returns false for non-LuaEnums", function()
			local Animal = LuaEnum.new("Animal", standard)
			expect(LuaEnum.isItemName(Animal, "Car")).to.equal(false)
			expect(LuaEnum.isItemName(Animal, {})).to.equal(false)
			expect(LuaEnum.isItemName(Animal, nil)).to.equal(false)
		end)
	end)

	describe("getName", function()
		it("Gets the Enum's name", function()
			local Animal = LuaEnum.new("Animal", standard)
			expect(LuaEnum.getName(Animal)).to.equal("Animal")
		end)
	end)

	describe("getItemName", function()
		it("Gets the item's name", function()
			local Animal = LuaEnum.new("Animal", standard)
			expect(LuaEnum.getItemName(Animal, Animal.Dog)).to.equal("Dog")
		end)
	end)
end
