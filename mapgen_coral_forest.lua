--[[
    Everness. Never ending discovery in Everness mapgen.
    Copyright (C) 2023 SaKeL <juraj.vajda@gmail.com>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to juraj.vajda@gmail.com
--]]

--
-- Register biomes
--

local y_max = Everness.settings.biomes.everness_coral_forest.y_max
local y_min = Everness.settings.biomes.everness_coral_forest.y_min

-- Coral Forest

minetest.register_biome({
    name = 'everness_coral_forest',
    node_top = 'everness:dirt_with_coral_grass',
    depth_top = 1,
    node_filler = 'everness:coral_dirt',
    depth_filler = 1,
    node_riverbed = 'everness:coral_dirt',
    depth_riverbed = 2,
    node_dungeon = 'everness:coral_desert_cobble',
    node_dungeon_alt = 'everness:coral_desert_mossy_cobble',
    node_dungeon_stair = 'stairs:stair_coral_desert_cobble',
    y_max = y_max,
    y_min = y_min,
    heat_point = 60,
    humidity_point = 50,
})

--
-- Register ores
--

-- Blob ore.
-- These before scatter ores to avoid other ores in blobs.

-- Coral Desert Stone

minetest.register_ore({
    ore_type = 'blob',
    ore = 'everness:coral_desert_stone',
    wherein = { 'default:stone' },
    clust_scarcity = 16 * 16 * 16,
    clust_size = 5,
    y_max = y_max,
    y_min = y_min,
    noise_threshold = 0.0,
    noise_params = {
        offset = 0.5,
        scale = 0.2,
        spread = { x = 5, y = 5, z = 5 },
        seed = -316,
        octaves = 1,
        persist = 0.0
    },
    biomes = { 'everness_coral_forest' }
})

--
-- Register decorations
--

-- Coral Forest

local chunksize = tonumber(minetest.get_mapgen_setting('chunksize'))

if chunksize >= 5 then
    minetest.register_decoration({
        name = 'everness:coral_forest_coral_tree',
        deco_type = 'schematic',
        place_on = { 'everness:dirt_with_coral_grass' },
        place_offset_y = 0,
        sidelen = 16,
        noise_params = {
            offset = 0.0015,
            scale = 0.0021,
            spread = { x = 250, y = 250, z = 250 },
            seed = 2,
            octaves = 3,
            persist = 0.66
        },
        biomes = { 'everness_coral_forest' },
        y_max = y_max,
        y_min = y_min,
        schematic = minetest.get_modpath('everness') .. '/schematics/everness_coral_tree.mts',
        flags = 'place_center_x, place_center_z',
        rotation = 'random',
        spawn_by = 'everness:dirt_with_coral_grass',
        num_spawn_by = 8,
    })
end

minetest.register_decoration({
    name = 'everness:coral_forest_coral_bones_tree',
    deco_type = 'schematic',
    place_on = { 'everness:dirt_with_coral_grass' },
    sidelen = 16,
    place_offset_y = -1,
    noise_params = {
        offset = -0.004,
        scale = 0.01,
        spread = { x = 100, y = 100, z = 100 },
        seed = 137,
        octaves = 3,
        persist = 0.7,
    },
    biomes = { 'everness_coral_forest' },
    y_max = y_max,
    y_min = y_min,
    schematic = minetest.get_modpath('everness') .. '/schematics/everness_coral_bones_tree.mts',
    flags = 'place_center_x, place_center_z',
    rotation = 'random',
})

minetest.register_decoration({
    name = 'everness:coral_forest_coral_burdock',
    deco_type = 'simple',
    place_on = { 'everness:dirt_with_coral_grass' },
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.006,
        spread = { x = 250, y = 250, z = 250 },
        seed = 2,
        octaves = 3,
        persist = 0.66
    },
    biomes = { 'everness_coral_forest' },
    y_max = y_max,
    y_min = y_min,
    decoration = { 'everness:coral_burdock_1', 'everness:coral_burdock_2' },
    spawn_by = 'everness:coral_tree'
})

minetest.register_decoration({
    name = 'everness:coral_forest_coral_bush',
    deco_type = 'simple',
    place_on = { 'everness:dirt_with_coral_grass', 'everness:coral_sand', 'everness:coral_white_sand' },
    sidelen = 16,
    noise_params = {
        offset = -0.02,
        scale = 0.04,
        spread = { x = 200, y = 200, z = 200 },
        seed = 436,
        octaves = 3,
        persist = 0.6
    },
    biomes = { 'everness_coral_forest' },
    y_max = y_max,
    y_min = y_min,
    decoration = 'everness:coral_bush'
})

minetest.register_decoration({
    name = 'everness:coral_forest_coral_shrub',
    deco_type = 'simple',
    place_on = { 'everness:dirt_with_coral_grass', 'everness:coral_sand', 'everness:coral_white_sand' },
    sidelen = 16,
    noise_params = {
        offset = -0.02,
        scale = 0.04,
        spread = { x = 200, y = 200, z = 200 },
        seed = 1220999,
        octaves = 3,
        persist = 0.6
    },
    biomes = { 'everness_coral_forest' },
    y_max = y_max,
    y_min = y_min,
    decoration = 'everness:coral_shrub'
})

local function register_coral_grass_decoration(offset, scale, length)
    minetest.register_decoration({
        name = 'everness:coral_forest_coral_grass_' .. length,
        deco_type = 'simple',
        place_on = { 'everness:dirt_with_coral_grass' },
        sidelen = 16,
        noise_params = {
            offset = offset,
            scale = scale,
            spread = { x = 200, y = 200, z = 200 },
            seed = 329,
            octaves = 3,
            persist = 0.6
        },
        biomes = { 'everness_coral_forest' },
        y_max = y_max,
        y_min = y_min,
        decoration = 'everness:coral_grass_' .. length,
    })
end

-- Grasses

register_coral_grass_decoration(-0.03, 0.09, 5)
register_coral_grass_decoration(-0.015, 0.075, 4)
register_coral_grass_decoration(0, 0.06, 3)
register_coral_grass_decoration(0.015, 0.045, 2)
register_coral_grass_decoration(0.03, 0.03, 1)