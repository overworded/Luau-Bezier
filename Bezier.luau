-- Bezier class. luau (yes roblox)

local Bezier = {}
Bezier.__index = Bezier

export type Curve = {
	Points: {any}
}

function Bezier.new(Points: {Vector3}): Curve
	local self = setmetatable({}, Bezier)

	self.Points = Points

	return self
end

function Bezier:Position(Time: number): Vector3
	local Copy = table.clone(self.Points)
	local n = #Copy

	for j = 1, n - 1 do
		for k = 1, n - j do
			Copy[k] = Copy[k] * (1 - Time) + Copy[k + 1] * Time
		end
	end

	return Copy[1]
end

function Bezier:Destroy()
	self.Points = nil
	setmetatable(self, nil)
	table.clear(self)
	table.freeze(self)
end

return Bezier
