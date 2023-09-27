---@meta CompDef

---@class CompDef
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
---@field get_ui (fun(self: CompDef, comp: Component): any)?
---@field on_add fun(self: CompDef, comp: Component)?
---@field on_remove fun(self: CompDef, comp: Component)?
---@field on_update fun(self: CompDef, comp: Component, cause: integer)?
---@field action_click fun(self: CompDef, comp: Component)?
---@field on_trigger fun(self: CompDef, comp: Component, other_entity: Entity)?
---@field on_take_damage fun(self: CompDef, comp: Component, amount: integer)?
---@field RegisterComponent (fun(self: CompDef, id: componentId, def: CompDef): CompDef)?
CompDef = {}


