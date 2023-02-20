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

local y_max = Everness.settings.biomes.everness_baobab_savanna.y_max
local y_min = Everness.settings.biomes.everness_baobab_savanna.y_min

-- Baobab Savanna

minetest.register_biome({
    name = 'everness_baobab_savanna',
    node_top = 'default:dry_dirt_with_dry_grass',
    depth_top = 1,
    node_filler = 'default:dry_dirt',
    depth_filler = 1,
    node_riverbed = 'default:sand',
    depth_riverbed = 2,
    node_dungeon = 'default:cobble',
    node_dungeon_alt = 'default:mossycobble',
    node_dungeon_stair = 'stairs:stair_cobble',
    y_max = y_max,
    y_min = y_min,
    heat_point = 80,
    humidity_point = 30,
})

--
-- Register decorations
--

-- Savanna bare dirt patches.
-- Must come before all savanna decorations that are placed on dry grass.
-- Noise is similar to long dry grass noise, but scale inverted, to appear
-- where long dry grass is least dense and shortest.

minetest.register_decoration({
    name = 'everness:baobab_savanna_dry_dirt_with_dry_grass',
    deco_type = 'simple',
    place_on = { 'default:dry_dirt_with_dry_grass' },
    sidelen = 4,
    noise_params = {
        offset = -1.5,
        scale = -1.5,
        spread = { x = 200, y = 200, z = 200 },
        seed = 329,
        octaves = 4,
        persist = 1.0
    },
    biomes = { 'everness_baobab_savanna' },
    y_max = y_max,
    y_min = y_min,
    decoration = 'default:dry_dirt',
    place_offset_y = -1,
    flags = 'force_placement',
})

minetest.register_decoration({
    name = 'everness:baobab_savanna_baobab_tree_1',
    deco_type = 'schematic',
    place_on = { 'default:dry_dirt_with_dry_grass', 'default:dry_dirt' },
    spawn_by = { 'default:dry_dirt_with_dry_grass', 'default:dry_dirt' },
    num_spawn_by = 8,
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.002,
        spread = { x = 250, y = 250, z = 250 },
        seed = 2,
        octaves = 3,
        persist = 0.66
    },
    biomes = { 'everness_baobab_savanna' },
    y_max = y_max,
    y_min = y_min,
    schematic = minetest.get_modpath('everness') .. '/schematics/everness_baobab_tree.mts',
    flags = 'place_center_x, place_center_z',
    rotation = 'random',
})

minetest.register_decoration({
    name = 'everness:baobab_savanna_baobab_tree_2',
    deco_type = 'schematic',
    place_on = { 'default:dry_dirt_with_dry_grass', 'default:dry_dirt' },
    spawn_by = { 'default:dry_dirt_with_dry_grass', 'default:dry_dirt' },
    num_spawn_by = 8,
    sidelen = 16,
    noise_params = {
        offset = -0.004,
        scale = 0.01,
        spread = { x = 100, y = 100, z = 100 },
        seed = 90155,
        octaves = 3,
        persist = 0.7,
    },
    biomes = { 'everness_baobab_savanna' },
    y_max = y_max,
    y_min = y_min,
    schematic = minetest.get_modpath('everness') .. '/schematics/everness_baobab_tree.mts',
    flags = 'place_center_x, place_center_z',
    rotation = 'random',
})

minetest.register_decoration({
    name = 'everness:baobab_savanna_acacia_log',
    deco_type = 'schematic',
    place_on = { 'default:dry_dirt_with_dry_grass' },
    place_offset_y = 1,
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.001,
        spread = { x = 250, y = 250, z = 250 },
        seed = 2,
        octaves = 3,
        persist = 0.66
    },
    biomes = { 'everness_baobab_savanna' },
    y_max = y_max,
    y_min = y_min,
    schematic = minetest.get_modpath('default') .. '/schematics/acacia_log.mts',
    flags = 'place_center_x',
    rotation = 'random',
    spawn_by = 'default:dry_dirt_with_dry_grass',
    num_spawn_by = 8,
})
