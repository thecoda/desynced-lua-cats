---@meta Comp

---@class Comp
---@field name string?
---@field desc string?
---@field tag string?
---@field race Race?
---@field texture string?
---@field visual string?
---@field slot_type SlotType?
---@field stack_size integer?
---@field attachment_size ComponentSize?
---@field activation string?
---@field registers RegisterDef[]?
---@field power number?
---@field power_storage integer?
---@field drain_rate integer?
---@field charge_rate integer?
---@field bandwidth integer?
---@field transfer_radius integer?
---@field adjust_extra_power boolean?
---@field dumping_ground boolean?
---@field effect string?
---@field effect_socket string?
---@field trigger_radius integer?
---@field trigger_channels string?
---@field non_removable boolean?
---@field production_recipe ProductionRecipe?
---@field action_tooltip string?
Comp = {}

---@param comp Component
function Comp:get_ui(comp) return {} end

---@param comp Component
function Comp:on_add(comp) end

---@param comp Component
function Comp:on_remove(comp) end

---@param comp Component
---@param cause integer
function Comp:on_update(comp, cause) end

---@param comp Component
function Comp:action_click(comp) end

---@param comp Component
---@param otherEntity Entity
function Comp:on_trigger(comp, otherEntity) end

---@param comp Component
---@param amount integer
function Comp:on_take_damage(comp, amount) end

---@param id componentId
---@param def Comp
---@returns CompDef # Array of entities
function Comp:RegisterComponent(id, def) return {} end


