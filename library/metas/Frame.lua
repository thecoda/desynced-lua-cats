---@meta Frame

---@class Frame
---@field name string?
---@field visibility_range integer?
---@field visual visualId?
---@field slots table<SlotType, integer>?
---@field components table<string, string>?
---@field construction_recipe ConstructionRecipe?
---@field production_recipe ProductionRecipe?
---@field desc string?
---@field race Race?
---@field size FrameSize?
---@field texture textureId?
---@field slot_type SlotType?
---@field movement_speed integer?
---@field flags string?
---@field minimap_color color?
---@field drone_range integer?
---@field is_tethered boolean?
---@field convert_to string?
---@field docked_visual visualId?
---@field health_points integer?
---@field trigger_channels string?
---@field start_disconnected boolean?
---@field start_lootable boolean?
---@field type FrameType?
Frame = {}

---@param entity Entity
function Frame:on_placed(entity) end

---@param entity Entity
function Frame:on_remove(entity) end

---@param entity Entity
function Frame:on_destroy(entity) end

---@param entity Entity
function Frame:on_interact(entity) end

---@param entity Entity
function Frame:can_interact(entity) end

---@param id frameId
---@param frame_def Frame
---@return Frame
function Frame:RegisterFrame(id, frame_def) return {} end
