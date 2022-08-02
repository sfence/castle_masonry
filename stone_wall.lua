
-- Used for localization, choose either built-in or intllib.

local MP, S, NS = nil

if (minetest.get_modpath("intllib") == nil) then
	S = minetest.get_translator("castle_masonry")

else
	-- internationalization boilerplate
	MP = minetest.get_modpath(minetest.get_current_modname())
	S, NS = dofile(MP.."/intllib.lua")

end


minetest.register_alias("castle:stonewall",         "castle_masonry:stonewall")
minetest.register_alias("castle:dungeon_stone",     "castle_masonry:dungeon_stone")
minetest.register_alias("castle:rubble",            "castle_masonry:rubble")
minetest.register_alias("castle:stonewall_corner",  "castle_masonry:stonewall_corner")

minetest.register_node("hades_castle_masonry:stonewall", {
	description = S("Castle Wall"),
	drawtype = "normal",
	tiles = {"castle_stonewall.png"},
	paramtype = "light",
	drop = "hades_castle_masonry:stonewall",
	groups = {cracky=3},
	sunlight_propagates = false,
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_castle_masonry:rubble", {
	description = S("Castle Rubble"),
	drawtype = "normal",
	tiles = {"castle_rubble.png"},
	paramtype = "light",
	groups = {crumbly=3,falling_node=1},
	sounds = hades_sounds.node_sound_gravel_defaults(),
})

minetest.register_craft({
	output = "hades_castle_masonry:stonewall",
	recipe = {
		{"hades_core:cobble"},
		{"hades_core:stone_baked"},
	}
})

minetest.register_craft({
	output = "hades_castle_masonry:rubble",
	recipe = {
		{"castle_masonry:stonewall"},
	}
})

minetest.register_craft({
	output = "hades_castle_masonry:rubble 2",
	recipe = {
		{"hades_core:gravel"},
		{"hades_core:stone_baked"},
	}
})

minetest.register_node("hades_castle_masonry:stonewall_corner", {
	drawtype = "normal",
	paramtype = "light",
	paramtype2 = "facedir",
	description = S("Castle Corner"),
	tiles = {"castle_corner_stonewall_tb.png^[transformR90",
		 "castle_corner_stonewall_tb.png^[transformR180",
		 "castle_corner_stonewall1.png",
		 "castle_stonewall.png",
		 "castle_stonewall.png",	
		 "castle_corner_stonewall2.png"},
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "castle_masonry:stonewall_corner",
	recipe = {
		{"", "castle_masonry:stonewall"},
		{"castle_masonry:stonewall", "default:sandstone"},
	}
})

if minetest.get_modpath("hades_moreblocks") then
	stairsplus:register_all("hades_castle_masonry", "stonewall", "castle_masonry:stonewall", {
		description = S("Stone Wall"),
		tiles = {"castle_stonewall.png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = hades_sounds.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("hades_castle_masonry", "rubble", "castle_masonry:rubble", {
		description = S("Rubble"),
		tiles = {"castle_rubble.png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = hades_sounds.node_sound_gravel_defaults(),
		sunlight_propagates = true,
	})
	
	stairsplus:register_alias_all("castle", "stonewall", "hades_castle_masonry", "stonewall")
	stairsplus:register_alias_all("castle", "rubble", "hades_castle_masonry", "rubble")

elseif minetest.get_modpath("stairs") then
	hades_stairs.register_stair_and_slab("stonewall", "hades_castle_masonry:stonewall",
		{cracky=3},
		{"castle_stonewall.png"},
		S("Castle Stonewall Stair"),
		S("Outer Castle Stonewall Stair"),
		S("Inner Castle Stonewall Stair"),
		S("Castle Stonewall Slab"),
		hades_sounds.node_sound_stone_defaults()
	)

	hades_stairs.register_stair_and_slab("rubble", "hades_castle_masonry:rubble",
		{cracky=3},
		{"castle_rubble.png"},
		S("Castle Rubble Stair"),
		S("Outer Castle Rubble Stair"),
		S("Inner Castle Rubble Stair"),
		S("Castle Rubble Slab"),
		hades_sounds.node_sound_stone_defaults()
	)
end

--------------------------------------------------------------------------------------------------------------

minetest.register_node("hades_castle_masonry:dungeon_stone", {
	description = S("Dungeon Stone"),
	drawtype = "normal",
	tiles = {"castle_dungeon_stone.png"},
	groups = {cracky=2},
	paramtype = "light",
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "hades_castle_masonry:dungeon_stone 2",
	recipe = {
		{"hades_core:stonebrick", "hades_core:obsidian"},
	}
})

minetest.register_craft({
	output = "hades_castle_masonry:dungeon_stone 2",
	recipe = {
		{"hades_core:stonebrick"},
		{"hades_core:obsidian"},
	}
})


if minetest.get_modpath("hades_moreblocks") then
	stairsplus:register_all("hades_castle_masonry", "dungeon_stone", "castle_masonry:dungeon_stone", {
		description = S("Dungeon Stone"),
		tiles = {"castle_dungeon_stone.png"},
		groups = {cracky=2, not_in_creative_inventory=1},
		sounds = hades_sounds.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_alias_all("castle", "dungeon_stone", "hades_castle_masonry", "dungeon_stone")
	
elseif minetest.get_modpath("stairs") then
	hades_stairs.register_stair_and_slab("dungeon_stone", "hades_castle_masonry:dungeon_stone",
		{cracky=2},
		{"castle_dungeon_stone.png"},
		S("Dungeon Stone Stair"),
		S("Outer Dungeon Stone Stair"),
		S("Inner Dungeon Stone Stair"),
		S("Dungeon Stone Slab"),
		hades_sounds.node_sound_stone_defaults()
	)
end
