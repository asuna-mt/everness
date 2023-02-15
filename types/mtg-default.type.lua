---@diagnostic disable: codestyle-check, duplicate-doc-alias, duplicate-doc-field
---https://github.com/sumneko/lua-language-server/wiki

---Minetest game default mod
---@class MtgDefault
---@field LIGHT_MAX number|integer The maximum light level. Maximum light to grow.
---@field can_grow fun(pos: Vector): boolean Grow trees from saplings
---@field grow_new_apple_tree fun(pos: Vector): nil
---@field grow_new_jungle_tree fun(pos: Vector): nil
---@field grow_new_emergent_jungle_tree fun(pos: Vector): nil
---@field grow_new_acacia_tree fun(pos: Vector): nil
---@field grow_new_aspen_tree fun(pos: Vector): nil
---@field grow_new_snowy_pine_tree fun(pos: Vector): nil
---@field grow_new_pine_tree fun(pos: Vector): nil
---@field grow_bush fun(pos: Vector): nil
---@field grow_acacia_bush fun(pos: Vector): nil
---@field grow_pine_bush fun(pos: Vector): nil
---@field grow_blueberry_bush fun(pos: Vector): nil
---@field grow_papyrus fun(pos: Vector, node: NodeDef): nil
---@field grow_large_cactus fun(pos: Vector, node: NodeDef): nil
---@field sapling_on_place fun(itemstack: ItemStack, placer: ObjectRef, pointed_thing: PointedThingDef, sapling_name: string, minp_relative: Vector, maxp_relative: Vector, interval: number): nil Sapling 'on place' function to check protection of node and resulting tree volume
---@field register_leafdecay fun(def: RegisterLeafdecayDef): nil
---@field after_place_leaves fun(pos: Vector, placer: ObjectRef, itemstack?: ItemStack, pointed_thing?: PointedThingDef): nil Prevent decay of placed leaves
---@field node_sound_defaults fun(table?: NodeSoundDef): NodeSoundDef
---@field node_sound_stone_defaults fun(table?: NodeSoundDef): NodeSoundDef
---@field node_sound_dirt_defaults fun(table?: NodeSoundDef): NodeSoundDef
---@field node_sound_sand_defaults fun(table?: NodeSoundDef): NodeSoundDef
---@field node_sound_wood_defaults fun(table?: NodeSoundDef): NodeSoundDef
---@field node_sound_leaves_defaults fun(table?: NodeSoundDef): NodeSoundDef
---@field node_sound_glass_defaults fun(table?: NodeSoundDef): NodeSoundDef
---@field node_sound_metal_defaults fun(table?: NodeSoundDef): NodeSoundDef
---@field node_sound_ice_defaults fun(table?: NodeSoundDef): NodeSoundDef
---@field node_sound_gravel_defaults fun(table?: NodeSoundDef): NodeSoundDef
---@field get_hotbar_bg fun(x: number, y: number): nil Get the hotbar background as string, containing the formspec elements. x: Horizontal position in the formspec, y: Vertical position in the formspec.

--- Leaf decay definition
---@class RegisterLeafdecayDef
---@field trunks string[]
---@field leaves string[]
---@field radius number
