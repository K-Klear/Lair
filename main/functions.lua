local player = require("main/player_info")
local F = {}

F.clockwise = {hash("N"), hash("E"), hash("S"), hash("W")}

function F.coords_to_position(x, y)
	if player.facing == hash("N") then
		return x - player.x, y - player.y + 1
	elseif player.facing == hash("W") then
		return y - player.y, player.x - x + 1
	elseif player.facing == hash("S") then
		return player.x - x, player.y - y + 1
	elseif player.facing == hash("E") then
		return player.y - y, x - player.x + 1
	end
	return x, y
end

function F.position_to_coords(pos, depth)
	if player.facing == hash("N") then
		return player.x + pos, player.y + depth - 1
	elseif player.facing == hash("W") then
		return player.x - depth + 1, player.y + pos
	elseif player.facing == hash("S") then
		return player.x - pos, player.y - depth + 1
	elseif player.facing == hash("E") then
		return player.x + depth - 1, player.y - pos
	end
end

return F