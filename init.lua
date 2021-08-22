castle_masonry = {}

local MP = minetest.get_modpath(minetest.get_current_modname())
dofile(MP.."/pillars.lua")
dofile(MP.."/arrow_slits.lua")
dofile(MP.."/murder_holes.lua")
dofile(MP.."/stone_wall.lua")
dofile(MP.."/paving.lua")


-- Used for localization, choose either built-in or intllib.

local S, NS = nil

if (minetest.get_modpath("intllib") == nil) then
	S = minetest.get_translator("castle_masonry")

else
	-- internationalization boilerplate
	S, NS = dofile(MP.."/intllib.lua")

end


local read_setting = function(name, default)
	local setting = minetest.settings:get_bool(name)
	if setting == nil then return default end
	return setting
end

-- Material definition:
-- {
--	name=, -- the name that will be part of the resulting node names
--	desc=, -- Player-facing name of the material
--	tile=, -- Optional - the texture tile to use for the resulting blocks (can be a single texture or a table, as a normal node definition's tile def). If not set this will be taken from the material it's made out of.
--	craft_material=, -- What source block is used to craft these blocks.
--	composition_material=, -- Optional, this will override the properties of the product with a specific material. Useful if you want to use a group for the craft material (eg, "group:wood")
--}

castle_masonry.materials = {}
if read_setting("castle_masonry_stonewall", true) then
	table.insert(castle_masonry.materials, {name="stonewall", desc=S("Stonewall"), tile="castle_stonewall.png", craft_material="hades_castle_masonry:stonewall"})
end
if read_setting("castle_masonry_cobble", true) then
	table.insert(castle_masonry.materials, {name="cobble", desc=S("Cobble"), tile="default_cobble.png", craft_material="hades_core:cobble"})
end
if read_setting("castle_masonry_stonebrick", true) then
	table.insert(castle_masonry.materials, {name="stonebrick", desc=S("Stone Brick"), tile="default_stone_brick.png", craft_material="hades_core:stonebrick"})
end
if read_setting("castle_masonry_bakedcobble", true) then
	table.insert(castle_masonry.materials, {name="cobble_baked", desc=S("Baked Cobble"), tile="hades_core_cobble_baked.png", craft_material="hades_core:cobble_baked"})
end
if read_setting("castle_masonry_bakedstonebrick", true) then
	table.insert(castle_masonry.materials, {name="bakedstonebrick", desc=S("Baked Stone Brick"), tile="hades_core_stone_brick_baked.png", craft_material="hades_core:stonebrick_baked"})
end
if read_setting("castle_masonry_sandstonebrick", true) then
	table.insert(castle_masonry.materials, {name="sandstonebrick", desc=S("Sandstone Brick"), tile="default_sandstone_brick.png", craft_material="hades_core:sandstonebrick"})
end
if read_setting("castle_masonry_volcanicsandstonebrick", true) then
	table.insert(castle_masonry.materials, {name="sandstonebrick", desc=S("Sandstone Brick"), tile="hades_core_sandstone_volcanic_brick.png", craft_material="hades_core:sandstone_volcanic_brick"})
end
if read_setting("castle_masonry_stone", true) then
	table.insert(castle_masonry.materials, {name="stone", desc=S("Stone"), tile="default_stone.png", craft_material="hades_core:stone"})
end
if read_setting("castle_masonry_sandstone", true) then
	table.insert(castle_masonry.materials, {name="sandstone", desc=S("Sandstone"), tile="default_sandstone.png", craft_material="hades_core:sandstone"})
end
if read_setting("castle_masonry_chondrite", true) then
	table.insert(castle_masonry.materials, {name="chondrite", desc=S("Chondrite"), tile="hades_core_chondrite.png", craft_material="hades_core:chondrite"})
end
if read_setting("castle_masonry_chondritebrick", true) then
	table.insert(castle_masonry.materials, {name="chondrite_brick", desc=S("Chondrite Brick"), tile="hades_core_chondrite_brick.png", craft_material="hades_core:chondrite_brick"})
end
if read_setting("castle_masonry_tuff", true) then
	table.insert(castle_masonry.materials, {name="tuff", desc=S("Tuff"), tile="hades_core_tuff.png", craft_material="hades_core:tuff"})
end
if read_setting("castle_masonry_tuffbrick", true) then
	table.insert(castle_masonry.materials, {name="tuff_brick", desc=S("Tuff Brick"), tile="hades_core_tuff_brick.png", craft_material="hades_core:tuff_brick"})
end
if read_setting("castle_masonry_tuff_baked", true) then
	table.insert(castle_masonry.materials, {name="tuff_baked", desc=S("Baked Tuff"), tile="hades_core_tuff_baked.png", craft_material="hades_core:tuff_baked"})
end
if read_setting("castle_masonry_tuff_bakedbrick", true) then
	table.insert(castle_masonry.materials, {name="tuff_baked_brick", desc=S("Baked Tuff Brick"), tile="hades_core_tuff_baked_brick.png", craft_material="hades_core:tuff_baked_brick"})
end
if read_setting("castle_masonry_marble", true) then
	table.insert(castle_masonry.materials, {name="marble", desc=S("Marble"), tile="hades_core_marble.png", craft_material="hades_core:marble"})
end
if read_setting("castle_masonry_marblebrick", true) then
	table.insert(castle_masonry.materials, {name="marble_brick", desc=S("Marble Brick"), tile="hades_core_marble_brick.png", craft_material="hades_core:marble_brick"})
end
if read_setting("castle_masonry_essexite", true) then
	table.insert(castle_masonry.materials, {name="essexite", desc=S("Essexite"), tile="hades_core_essexite.png", craft_material="hades_core:essexite"})
end
if read_setting("castle_masonry_essexitebrick", true) then
	table.insert(castle_masonry.materials, {name="essexite_brick", desc=S("Essexite Brick"), tile="hades_core_essexite_brick.png", craft_material="hades_core:essexite_brick"})
end
if minetest.get_modpath("hades_default") then
	--[[
	if read_setting("castle_masonry_desertstonebrick", true) then
		table.insert(castle_masonry.materials, {name="desertstonebrick", desc=S("Desert Stone Brick"), tile="default_desert_stone_brick.png", craft_material="hades_default:desert_stonebrick"})
	end
	--]]
	if read_setting("castle_masonry_desertsandstonebrick", true) then
		table.insert(castle_masonry.materials, {name="desertsandstonebrick", desc=S("Desert Sandstone Brick"), tile="default_desert_sandstone_brick.png", craft_material="hades_default:desert_sandstone_brick"})
	end
	if read_setting("castle_masonry_silversandstonebrick", true) then
		table.insert(castle_masonry.materials, {name="silversandstonebrick", desc=S("Silver Sandstone Brick"), tile="default_silver_sandstone_brick.png", craft_material="hades_default:silver_sandstone_brick"})
	end
	if read_setting("castle_masonry_sandstone", true) then
		table.insert(castle_masonry.materials, {name="sandstone", desc=S("Sandstone"), tile="default_sandstone.png", craft_material="hades_default:sandstone"})
	end
	--[[
	if read_setting("castle_masonry_desertstone", true) then
		table.insert(castle_masonry.materials, {name="desertstone", desc=S("Desert Stone"), tile="default_desert_stone.png", craft_material="hades_default:desert_stone"})
	end--]]
	if read_setting("castle_masonry_desertsandstone", true) then
		table.insert(castle_masonry.materials, {name="desertsandstone", desc=S("Desert Sandstone"), tile="default_desert_sandstone.png", craft_material="hades_default:desert_sandstone"})
	end
	if read_setting("castle_masonry_silversandstone", true) then
		table.insert(castle_masonry.materials, {name="silversandstone", desc=S("Silver Sandstone"), tile="default_silver_sandstone.png", craft_material="hades_default:silver_sandstone"})
	end
end
if read_setting("castle_masonry_wood", false) then
	table.insert(castle_masonry.materials, {name="wood", desc=S("Wood"), tile="default_wood.png", craft_material="group:wood", composition_material="hades_trees:wood"})
end
--[[
if read_setting("castle_masonry_ice", false) then
	table.insert(castle_masonry.materials, {name="ice", desc=S("Ice"), tile="default_ice.png", craft_material="default:ice"})
end
if read_setting("castle_masonry_snow", false) then
	table.insert(castle_masonry.materials, {name="snow", desc=S("Snow"), tile="default_snow.png", craft_material="default:snow"})
end
--]]
if read_setting("castle_masonry_obsidianbrick", false) then
	table.insert(castle_masonry.materials, {name="obsidianbrick", desc=S("Obsidian Brick"), tile="default_obsidian_brick.png", craft_material="hades_core:obsidianbrick"})
end

castle_masonry.get_material_properties = function(material)
	local composition_def
	local burn_time
	if material.composition_material ~= nil then
		composition_def = minetest.registered_nodes[material.composition_material]
		burn_time = minetest.get_craft_result({method="fuel", width=1, items={ItemStack(material.composition_material)}}).time
	else
		composition_def = minetest.registered_nodes[material.craft_material]
		burn_time = minetest.get_craft_result({method="fuel", width=1, items={ItemStack(material.craft_material)}}).time
	end

	local tiles = material.tile
	if tiles == nil then
		tiles = composition_def.tile
	elseif type(tiles) == "string" then
		tiles = {tiles}
	end

	local desc = material.desc
	if desc == nil then
		desc = composition_def.description
	end

	return composition_def, burn_time, tiles, desc
end


if read_setting("castle_masonry_pillar", true) then
	for _, material in pairs(castle_masonry.materials) do
		print(material.name)
		castle_masonry.register_pillar(material)
	end
end

if read_setting("castle_masonry_arrowslit", true) then
	for _, material in pairs(castle_masonry.materials) do
		castle_masonry.register_arrowslit(material)
	end
end

if read_setting("castle_masonry_murderhole", true) then
	for _, material in pairs(castle_masonry.materials) do
		castle_masonry.register_murderhole(material)
	end
end

minetest.register_alias("castle:pillars_bottom", "castle_masonry:pillars_stonewall_bottom")
minetest.register_alias("castle:pillars_top", "castle_masonry:pillars_stonewall_top")
minetest.register_alias("castle:pillars_middle", "castle_masonry:pillars_stonewall_middle")
minetest.register_alias("castle:arrowslit", "castle_masonry:arrowslit_stonewall")
minetest.register_alias("castle:arrowslit_hole", "castle_masonry:arrowslit_stonewall_hole")
minetest.register_alias("castle:arrowslit_cross", "castle_masonry:arrowslit_stonewall_cross")

for _, material in pairs(castle_masonry.materials) do
	castle_masonry.register_murderhole_alias("castle", material.name, "castle_masonry", material.name)
	castle_masonry.register_pillar_alias("castle", material.name, "castle_masonry", material.name)

	-- Arrowslit upgrade has special handling because the castle mod arrow slit is reversed relative to current build-from-inside standard
	local lbm_def = {
		name = "hades_castle_masonry:arrowslit_flip_front_to_back"..material.name,
		nodenames = {
			"castle:arrowslit_"..material.name,
			"castle:arrowslit_"..material.name.."_cross",
			"castle:arrowslit_"..material.name.."_hole",
		},
		action = function(pos, node)
			local flip_front_to_back = {[0]=2, 3, 0, 1, 6, 7, 4, 5, 10, 7, 8, 9, 14, 15, 12, 13, 18, 19, 16, 17, 22, 23, 20, 21}
			node.param2 = flip_front_to_back[node.param2]
			node.name = "castle_masonry" .. string.sub(node.name, 7, -1)
			minetest.swap_node(pos, node)
		end
	}
	minetest.register_lbm(lbm_def)
end
