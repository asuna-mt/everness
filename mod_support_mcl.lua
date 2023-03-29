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

local S = minetest.get_translator(minetest.get_current_modname())
--[[]]
minetest.register_on_mods_loaded(function()
    local everness_registered_nodes = {}
    local everness_registered_nodes_length = 0
    local everness_registered_nodes_sand_length = 0

    -- minetest.registered_items
    -- registered_nodes
    -- registered_tools
    -- registered_craftitems

    for name, def in pairs(minetest.registered_nodes) do
        local name_split = name:split(':')

        if name_split[1] == 'everness' then
            everness_registered_nodes[name] = def

            if minetest.get_item_group(name, 'sand') ~= 0 then
                local new_groups = table.copy(def.groups)

                everness_registered_nodes_sand_length = everness_registered_nodes_sand_length + 1

                new_groups.handy = 1
                new_groups.shovely = 1
                new_groups.soil_sugarcane = 1
                new_groups.enderman_takable = 1
                new_groups.building_block = 1
                new_groups.material_sand = 1

                new_groups.creative_breakable = 1
                new_groups.solid = 1
                new_groups.opaque = 1

                new_groups.handy_dig = 7
                new_groups.shovely_dig = 2

                -- minetest.override_item(name, {
                --     groups = new_groups,
                --     _mcl_blast_resistance = 0.5,
                --     _mcl_hardness = 0.5
                -- })

                if name == 'everness:coral_sand' then
                    print(dump(minetest.registered_nodes[name]))
                end
            end


            everness_registered_nodes_length = everness_registered_nodes_length + 1
        end
    end

    -- for name, def in pairs(minetest.registered_tools) do
    --     local name_split = name:split(':')

    --     if name_split[1] == 'everness' then
    --         if name == 'everness:pick_illuminating' then
    --             print(dump(minetest.registered_tools[name]))
    --         end
    --     end
    -- end

    print('sand', everness_registered_nodes_sand_length)
    print('total', everness_registered_nodes_length)
end)

---
-- Fence / Gates
---

-- Dry Wood

mcl_fences.register_fence_and_fence_gate(
    'fence_dry_wood',
    S('Dry Wood Fence'),
    S('Dry Wood Fence Gate'),
    'everness_fence_dry_wood.png',
    { handy = 1, axey = 1, flammable = 2, fence_wood = 1, fire_encouragement = 5, fire_flammability = 20 },
    2,
    15,
    { 'group:fence_wood' },
    Everness.node_sound_wood_defaults()
)

-- Bamboo Wood

mcl_fences.register_fence_and_fence_gate(
    'fence_bamboo_wood',
    S('Bamboo Wood Fence'),
    S('Bamboo Wood Fence Gate'),
    'everness_fence_bamboo_wood.png',
    { handy = 1, axey = 1, flammable = 2, fence_wood = 1, fire_encouragement = 5, fire_flammability = 20 },
    2,
    15,
    { 'group:fence_wood' },
    Everness.node_sound_wood_defaults()
)

---
-- Walls
---

mcl_walls.register_wall(
    'everness:coraldesertcobblewall',
    S('Coral Cobblestone Wall'),
    'everness:coral_desert_cobble',
    { 'everness_coral_desert_cobble.png' },
    nil,
    nil,
    Everness.node_sound_stone_defaults()
)

mcl_walls.register_wall(
    'everness:coraldesertmossycobblewall',
    S('Coral Mossy Cobblestone Wall'),
    'everness:coral_desert_mossy_cobble',
    { 'everness_coral_desert_mossy_cobble.png' },
    nil,
    nil,
    Everness.node_sound_stone_defaults()
)

mcl_walls.register_wall(
    'everness:cursedbrickwall',
    S('Cursed Brick Wall'),
    'everness:cursed_brick',
    { 'everness_cursed_brick.png' },
    nil,
    nil,
    Everness.node_sound_stone_defaults()
)

mcl_walls.register_wall(
    'everness:cursedbrickwithgrowthwall',
    S('Cursed Brick with Growth Wall'),
    'everness:cursed_brick_with_growth',
    { 'everness_cursed_brick_with_growth.png' },
    nil,
    nil,
    Everness.node_sound_stone_defaults()
)

mcl_walls.register_wall(
    'everness:forsakentundracobblewall',
    S('Forsaken Tundra Cobblestone Wall'),
    'everness:forsaken_tundra_cobble',
    { 'everness_forsaken_tundra_cobblestone.png' },
    nil,
    nil,
    Everness.node_sound_stone_defaults()
)

mcl_walls.register_wall(
    'everness:forsakentundrastonewall',
    S('Forsaken Tundra Stone Wall'),
    'everness:forsaken_tundra_stone',
    { 'everness_forsaken_tundra_stone.png' },
    nil,
    nil,
    Everness.node_sound_stone_defaults()
)

mcl_walls.register_wall(
    'everness:forsakentundrabrickwall',
    S('Forsaken Tundra Brick Wall'),
    'everness:forsaken_tundra_brick',
    { 'everness_forsaken_tundra_brick.png' },
    nil,
    nil,
    Everness.node_sound_stone_defaults()
)

mcl_walls.register_wall(
    'everness:magmacobblewall',
    S('Magma Cobblestone Wall'),
    'everness:magmacobble',
    {
        {
            name = 'everness_magmacobble_animated.png',
            animation = {
                type = 'vertical_frames',
                aspect_w = 16,
                aspect_h = 16,
                length = 3.0,
            },
        },
    },
    nil,
    nil,
    Everness.node_sound_stone_defaults()
)

mcl_walls.register_wall(
    'everness:volcanicrockwall',
    S('Volcanic Rock Wall'),
    'everness:volcanic_rock',
    { 'everness_volcanic_rock.png' },
    nil,
    nil,
    Everness.node_sound_stone_defaults()
)

mcl_walls.register_wall(
    'everness:volcanicrockwithmagmawall',
    S('Volcanic Rock with Magma Wall'),
    'everness:volcanic_rock_with_magma',
    {
        {
            name = 'everness_volcanic_rock_with_magma_animated.png',
            animation = {
                type = 'vertical_frames',
                aspect_w = 16,
                aspect_h = 16,
                length = 3.0,
            },
        },
    },
    nil,
    nil,
    Everness.node_sound_stone_defaults()
)

---
-- Stairs and Slabs
---

mcl_stairs.register_stair_and_slab(
    'coral_desert_stone',
    'everness:coral_desert_stone',
    { pickaxey = 3 },
    { 'everness_coral_desert_stone.png' },
    S('Coral Desert Stone Stair'),
    S('Coral Desert Stone Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Desert Stone Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'coral_desert_cobble',
    'everness:coral_desert_cobble',
    { pickaxey = 3 },
    { 'everness_coral_desert_cobble.png' },
    S('Coral Desert Cobblestone Stair'),
    S('Coral Desert Cobblestone Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Desert Cobblestone Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'coral_desert_mossy_cobble',
    'everness:coral_desert_mossy_cobble',
    { pickaxey = 3 },
    { 'everness_coral_desert_mossy_cobble.png' },
    S('Coral Mossy Cobblestone Stair'),
    S('Coral Mossy Cobblestone Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Mossy Cobblestone Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'cursed_brick',
    'everness:cursed_brick',
    { pickaxey = 2 },
    { 'everness_cursed_brick.png' },
    S('Cursed Brick Stair'),
    S('Cursed Brick Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Cursed Brick Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'cursed_brick_with_growth',
    'everness:cursed_brick_with_growth',
    { pickaxey = 2 },
    { 'everness_cursed_brick_with_growth.png' },
    S('Cursed Brick with Growth Stair'),
    S('Cursed Brick with Growth Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Cursed Brick with Growth Slab'),
    nil
)

-- Quartz

mcl_stairs.register_stair_and_slab(
    'quartz_block',
    'everness:quartz_block',
    { pickaxey = 2 },
    {
        'everness_quartz_block_top.png',
        'everness_quartz_block_bottom.png',
        'everness_quartz_block_side.png',
    },
    S('Quartz Block Stair'),
    S('Quartz Block Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Quartz Block Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'quartz_chiseled',
    'everness:quartz_chiseled',
    { pickaxey = 2 },
    {
        'everness_quartz_block_chiseled_top.png',
        'everness_quartz_block_chiseled_top.png',
        'everness_quartz_block_chiseled.png',
    },
    S('Quartz Chiseled Stair'),
    S('Quartz Chiseled Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Quartz Chiseled Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'quartz_pillar',
    'everness:quartz_pillar',
    { pickaxey = 2 },
    {
        'everness_quartz_block_lines_top.png',
        'everness_quartz_block_lines_top.png',
        'everness_quartz_block_lines.png',
    },
    S('Quartz Pillar Stair'),
    S('Quartz Pillar Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Quartz Pillar Slab'),
    nil
)

-- Dry Wood

mcl_stairs.register_stair_and_slab(
    'dry_wood',
    'everness:dry_wood',
    { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
    { 'everness_dry_wood.png' },
    S('Dry Wood Stair'),
    S('Dry Wood Slab'),
    Everness.node_sound_wood_defaults(),
    6,
    2,
    S('Double Dry Wood Slab'),
    nil
)

-- Bamboo Wood

mcl_stairs.register_stair_and_slab(
    'bamboo_wood',
    'everness:bamboo_wood',
    { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
    { 'everness_dry_bamboo_block_side.png' },
    S('Bamboo Wood Stair'),
    S('Bamboo Wood Slab'),
    Everness.node_sound_wood_defaults(),
    6,
    2,
    S('Double Bamboo Wood Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'bamboo_mosaic_wood',
    'everness:bamboo_mosaic_wood',
    { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
    { 'everness_bamboo_mosaic.png' },
    S('Bamboo Mosaic Wood Stair'),
    S('Bamboo Mosaic Wood Slab'),
    Everness.node_sound_wood_defaults(),
    6,
    2,
    S('Double Bamboo Mosaic Wood Slab'),
    nil
)

-- Forsaken stone

mcl_stairs.register_stair_and_slab(
    'forsaken_desert_brick',
    'everness:forsaken_desert_brick',
    { pickaxey = 2, stone = 1 },
    { 'everness_forsaken_desert_brick.png' },
    S('Forsaken Desert Brick Stair'),
    S('Forsaken Desert Brick Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Forsaken Desert Brick Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'forsaken_desert_brick_red',
    'everness:forsaken_desert_brick_red',
    { pickaxey = 2, stone = 1 },
    { 'everness_forsaken_desert_brick_red.png' },
    S('Forsaken Desert Brick Red Stair'),
    S('Forsaken Desert Brick Red Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Forsaken Desert Brick Red Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'forsaken_desert_chiseled_stone',
    'everness:forsaken_desert_chiseled_stone',
    { pickaxey = 2, stone = 1 },
    { 'everness_forsaken_desert_chiseled_stone_side.png' },
    S('Forsaken Desert Chiseled Stone Stair'),
    S('Forsaken Desert Chiseled Stone Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Forsaken Desert Chiseled Stone Slab'),
    nil
)

-- Baobab Wood

mcl_stairs.register_stair_and_slab(
    'baobab_wood',
    'everness:baobab_wood',
    { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
    { 'everness_baobab_wood.png' },
    S('Baobab Wood Stair'),
    S('Baobab Wood Slab'),
    Everness.node_sound_wood_defaults(),
    6,
    2,
    S('Double Baobab Wood Slab'),
    nil
)

-- Sequoia Wood

mcl_stairs.register_stair_and_slab(
    'sequoia_wood',
    'everness:sequoia_wood',
    { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
    { 'everness_sequoia_wood.png' },
    S('Sequoia Wood Stair'),
    S('Sequoia Wood Slab'),
    Everness.node_sound_wood_defaults(),
    6,
    2,
    S('Double Sequoia Wood Slab'),
    nil
)

-- Forsaken Tundra

mcl_stairs.register_stair_and_slab(
    'forsaken_tundra_cobble',
    'everness:forsaken_tundra_cobble',
    { pickaxey = 3, stone = 2 },
    { 'everness_forsaken_tundra_cobblestone.png' },
    S('Forsaken Tundra Cobblestone Stair'),
    S('Forsaken Tundra Cobblestone Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Forsaken Tundra Cobblestone Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'forsaken_tundra_stone',
    'everness:forsaken_tundra_stone',
    { pickaxey = 3, stone = 1 },
    { 'everness_forsaken_tundra_stone.png' },
    S('Forsaken Tundra Stone Stair'),
    S('Forsaken Tundra Stone Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Forsaken Tundra Stone Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'forsaken_tundra_brick',
    'everness:forsaken_tundra_brick',
    { pickaxey = 2, stone = 1 },
    { 'everness_forsaken_tundra_brick.png' },
    S('Forsaken Tundra Brick Stair'),
    S('Forsaken Tundra Brick Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Forsaken Tundra Brick Slab'),
    nil
)

-- Willow Wood

mcl_stairs.register_stair_and_slab(
    'willow_wood',
    'everness:willow_wood',
    { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
    { 'everness_willow_wood.png' },
    S('Willow Wood Stair'),
    S('Willow Wood Slab'),
    Everness.node_sound_wood_defaults(),
    6,
    2,
    S('Double Willow Wood Slab'),
    nil
)


-- Magma Cobble

mcl_stairs.register_stair_and_slab(
    'magmacobble',
    'everness:magmacobble',
    { pickaxey = 3, stone = 1 },
    {
        {
            name = 'everness_magmacobble_animated.png',
            animation = {
                type = 'vertical_frames',
                aspect_w = 16,
                aspect_h = 16,
                length = 3.0,
            },
        }
    },
    S('Magma Cobblestone Stair'),
    S('Magma Cobblestone Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Magma Cobblestone Slab'),
    nil
)

-- Volcanic rock

mcl_stairs.register_stair_and_slab(
    'volcanic_rock',
    'everness:volcanic_rock',
    { pickaxey = 1, stone = 2 },
    { 'everness_volcanic_rock.png' },
    S('Volcanic Rock Stair'),
    S('Volcanic Rock Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Volcanic Rock Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'volcanic_rock_with_magma',
    'everness:volcanic_rock_with_magma',
    { pickaxey = 1, stone = 2 },
    {
        {
            name = 'everness_volcanic_rock_with_magma_animated.png',
            animation = {
                type = 'vertical_frames',
                aspect_w = 16,
                aspect_h = 16,
                length = 3.0,
            },
        },
    },
    S('Volcanic Rock with Magma Stair'),
    S('Volcanic Rock with Magma Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Volcanic Rock with Magma Slab'),
    nil
)

-- Coral Forest Deep Ocean

mcl_stairs.register_stair_and_slab(
    'coral_deep_ocean_sandstone_block',
    'everness:coral_deep_ocean_sandstone_block',
    { pickaxey = 2 },
    { 'everness_deep_ocean_sandstone_block.png' },
    S('Coral Depp Ocean Sandstone Block Stair'),
    S('Coral Depp Ocean Sandstone Block Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Depp Ocean Sandstone Block Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'coral_deep_ocean_sandstone_brick',
    'everness:coral_deep_ocean_sandstone_brick',
    { pickaxey = 2 },
    { 'everness_deep_ocean_sandstone_brick.png' },
    S('Coral Depp Ocean Sandstone Brick Stair'),
    S('Coral Depp Ocean Sandstone Brick Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Depp Ocean Sandstone Brick Slab'),
    nil
)

-- Coral White Sandstone

mcl_stairs.register_stair_and_slab(
    'coral_white_sandstone',
    'everness:coral_white_sandstone',
    { pickaxey = 2 },
    { 'everness_coral_white_sandstone.png' },
    S('Coral White Sandstone Stair'),
    S('Coral White Sandstone Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral White Sandstone Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'coral_white_sandstone_pillar',
    'everness:coral_white_sandstone_pillar',
    { pickaxey = 2 },
    {
        'everness_coral_white_sandstone.png',
        'everness_coral_white_sandstone.png',
        'everness_coral_white_sandstone_pillar.png',
    },
    S('Coral White Sandstone Pillar Stair'),
    S('Coral White Sandstone Pillar Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral White Sandstone Pillar Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'coral_white_sandstone_brick',
    'everness:coral_white_sandstone_brick',
    { pickaxey = 2 },
    { 'everness_coral_white_sandstone_brick.png' },
    S('Coral White Sandstone Brick Stair'),
    S('Coral White Sandstone Brick Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral White Sandstone Brick Slab'),
    nil
)

-- Coral Desert Stone

mcl_stairs.register_stair_and_slab(
    'coral_desert_stone_block',
    'everness:coral_desert_stone_block',
    { pickaxey = 2 },
    { 'everness_coral_desert_stone_block.png' },
    S('Coral Desert Stone Block Stair'),
    S('Coral Desert Stone Block Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Desert Stone Block Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'coral_desert_stone_brick',
    'everness:coral_desert_stone_brick',
    { pickaxey = 2 },
    { 'everness_coral_desert_stone_brick.png' },
    S('Coral Desert Stone Brick Stair'),
    S('Coral Desert Stone Brick Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Desert Stone Brick Slab'),
    nil
)

-- Coral Sandstone

mcl_stairs.register_stair_and_slab(
    'coral_sandstone',
    'everness:coral_sandstone',
    { pickaxey = 2 },
    { 'everness_coral_sandstone.png' },
    S('Coral Sandstone Stair'),
    S('Coral Sandstone Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Sandstone Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'coral_sandstone_brick',
    'everness:coral_sandstone_brick',
    { pickaxey = 2 },
    { 'everness_coral_sandstone_brick.png' },
    S('Coral Sandstone Brick Stair'),
    S('Coral Sandstone Brick Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Sandstone Brick Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'coral_sandstone_chiseled',
    'everness:coral_sandstone_chiseled',
    { pickaxey = 2 },
    { 'everness_coral_sandstone_chiseled.png' },
    S('Coral Sandstone Chiseled Stair'),
    S('Coral Sandstone Chiseled Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Sandstone Chiseled Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'coral_sandstone_carved_1',
    'everness:coral_sandstone_carved_1',
    { pickaxey = 2 },
    { 'everness_coral_sandstone_carved_1.png' },
    S('Coral Sandstone Carved Stair'),
    S('Coral Sandstone Carved Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Coral Sandstone Carved Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'cursed_lands_deep_ocean_sandstone_block',
    'everness:cursed_lands_deep_ocean_sandstone_block',
    { pickaxey = 2 },
    { 'everness_cursed_lands_deep_ocean_sandblock.png' },
    S('Cursed Lands Deep Ocean Sandstone Block Stair'),
    S('Cursed Lands Deep Ocean Sandstone Block Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Cursed Lands Deep Ocean Sandstone Block Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'cursed_lands_deep_ocean_sandstone_brick',
    'everness:cursed_lands_deep_ocean_sandstone_brick',
    { pickaxey = 2 },
    { 'everness_cursed_lands_deep_ocean_sand_brick.png' },
    S('Cursed Lands Deep Ocean Sandstone Brick Stair'),
    S('Cursed Lands Deep Ocean Sandstone Brick Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Cursed Lands Deep Ocean Sandstone Brick Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'crystal_forest_deep_ocean_sandstone_block',
    'everness:crystal_forest_deep_ocean_sandstone_block',
    { pickaxey = 2 },
    { 'everness_crystal_forest_deep_ocean_sandstone_block.png' },
    S('Crystal Forest Deep Ocean Sandstone Block Stair'),
    S('Crystal Forest Deep Ocean Sandstone Block Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Crystal Forest Deep Ocean Sandstone Block Slab'),
    nil
)

mcl_stairs.register_stair_and_slab(
    'crystal_forest_deep_ocean_sandstone_brick',
    'everness:crystal_forest_deep_ocean_sandstone_brick',
    { pickaxey = 2 },
    { 'everness_crystal_forest_deep_ocean_sandstone_brick.png' },
    S('Crystal Forest Deep Ocean Sandstone Brick Stair'),
    S('Crystal Forest Deep Ocean Sandstone Brick Slab'),
    Everness.node_sound_stone_defaults(),
    6,
    2,
    S('Double Crystal Forest Deep Ocean Sandstone Brick Slab'),
    nil
)
