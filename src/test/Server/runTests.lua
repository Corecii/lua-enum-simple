return function()
	local TestEZ = require(game.ReplicatedStorage.lib.packages.TestEZ)

	local roots = { game.ReplicatedStorage.lib.packages.lib }

	TestEZ.TestBootstrap:run(roots)
end
