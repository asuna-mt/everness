--[[
    Everness. Never ending discovery in Everness mapgen.
    Copyright (C) 2024 SaKeL

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

--]]

--
-- Register biomes
--

local y_max = Everness.settings.biomes.everness_frosted_icesheet_ocean.y_max
local y_min = Everness.settings.biomes.everness_frosted_icesheet_ocean.y_min

-- Frosted Icesheet Ocean

Everness:register_biome({
    name = 'everness:frosted_icesheet_ocean',
    node_top = 'default:sand',
    depth_top = 1,
    node_filler = 'default:sand',
    depth_filler = 3,
    node_water_top = 'everness:frosted_ice',
    depth_water_top = 2,
    node_cave_liquid = 'mapgen_water_source',
    node_dungeon = 'everness:icecobble',
    node_dungeon_alt = 'everness:snowcobble',
    node_dungeon_stair = 'stairs:stair_ice',
    y_max = y_max,
    y_min = y_min,
    heat_point = 0,
    humidity_point = 93,
})

--
-- Register decorations
--

-- Frosted Icesheet Ocean

local starfish_oceans = {}
for _,oceans in ipairs({
    asuna.features.ocean.tropical,
    asuna.features.ocean.frozen,
}) do
    for _,ocean in ipairs(oceans) do
        table.insert(starfish_oceans,ocean)
    end
end

Everness:register_decoration({
    name = 'everness:frosted_icesheet_ocean_corals',
    deco_type = 'simple',
    place_on = { 'default:sand' },
    place_offset_y = -1,
    sidelen = 4,
    noise_params = {
        offset = -4,
        scale = 4,
        spread = { x = 50, y = 50, z = 50 },
        seed = 7013,
        octaves = 3,
        persist = 0.7,
    },
    biomes = starfish_oceans,
    y_max = y_max - (y_max + 2), -- -2
    y_min = y_max - (y_max + 50), -- -50
    flags = 'force_placement',
    decoration = {
        'everness:coral_starfish',
        'everness:coral_frosted',
        'everness:coral_skeleton'
    },
})
