-- Each tilemap cell has two walls associated with it - south and west.
-- The wall coords (both S and W) are equal to cell coords.

local MAP = {}

MAP.cells = {}

MAP.to_render = {}
MAP.wall_gos = {}
MAP.objects = {}
MAP.items = {}
MAP.actors = {}
MAP.entities = {}

MAP.wall_stats = {
	{
		texture = "wall",
		solid = true,
		hp = 100,
		debris = {[hash("stone")] = 3}
	},
	{
		texture = "dirt",
		solid = true,
		hp = 40,
		debris = {
			[hash("stone")] = 1,
			[hash("mushroom")] = 1
		}
	},
	{
		texture = "wall_red",
		solid = true,
		hp = 150,
		debris = {}
	},
	{
	}
}
MAP.wall_stats[0] = {floor = true, ceiling = true}

local function load_tile(x, y)
	local tile = MAP.wall_stats[tilemap.get_tile(MAP.map_url, "walls", x, y)]
	local tile_s = MAP.wall_stats[tilemap.get_tile(MAP.map_url, "walls", x, y - 1)]
	local tile_w = MAP.wall_stats[tilemap.get_tile(MAP.map_url, "walls", x - 1, y)]
	MAP.cells[x][y].type = tilemap.get_tile(MAP.map_url, "walls", x, y)
	if tile.solid then
		if not tile_s.solid then
			MAP.cells[x][y].s = {texture = tile.texture, hp = tile.hp}
		end
		if not tile_w.solid then
			MAP.cells[x][y].w = {texture = tile.texture, hp = tile.hp}
		end
	else
		if tile_s.solid then
			MAP.cells[x][y].s = {texture = tile_s.texture, hp = tile_s.hp}
		end
		if tile_w.solid then
			MAP.cells[x][y].w = {texture = tile_w.texture, hp = tile_w.hp}
		end
	end
	if tile.floor then
		MAP.cells[x][y].f = {texture = "dirt"}
		MAP.cells[x][y].c = {texture = "wall"}
	end
end

function MAP.load_map(url)
	MAP.map_url = url
	local x_min, y_min, width, height = tilemap.get_bounds(url)
	for x = x_min + 1, x_min + width - 1 do
		MAP.cells[x] = {}
		for y = y_min + 1, y_min + height - 1 do
			MAP.cells[x][y] = {}
			load_tile(x, y)
		end
	end
end

function MAP.load_tile(x, y)
	for x = x, x + 1 do
		for y = y, y + 1 do
			load_tile(x, y)
		end
	end
end

function MAP.destroy_wall(x, y, wall_type)
	if not MAP.wall_stats[MAP.cells[x][y].type].solid then
		if wall_type == "s" then
			y = y - 1
		else
			x = x - 1
		end
	end
	for type, count in pairs(MAP.wall_stats[MAP.cells[x][y].type].debris) do
		for i = 1, count do
			factory.create("/map#spawn_item_map", vmath.vector3((x - math.random()) * 128, (y - math.random()) * 128, 0), vmath.quat(), {type = type, z = 0.8 * math.random()})
		end
	end
	tilemap.set_tile(MAP.map_url, "walls", x, y, 0)
	MAP.load_tile(x, y)
end

function MAP.damage(x, y, wall_type, damage)
	MAP.cells[x][y][wall_type].hp = MAP.cells[x][y][wall_type].hp - damage
	if not (MAP.cells[x][y][wall_type].hp > 0) then
		MAP.destroy_wall(x, y, wall_type)
	end
end

return MAP