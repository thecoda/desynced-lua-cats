---@meta ItemSlot

---@class ItemSlot
---@field itemId string? Item id (or nil if no item in slot)
---@field def table? Item definition (or nil if no item in slot)
---@field stack integer Amount (is 0 if no item in slot)
---@field max_stack integer Amount (is 0 if no item in slot)
---@field reserved_stack integer Reserved amount
---@field unreserved_stack integer Unreserved amount
---@field reserved_space integer Reserved free space count
---@field unreserved_space integer Unreserved free space count
---@field has_order boolean Check result
---@field owner Entity Entity
---@field exists boolean Exist state
---@field entity Entity? Entity (is nil if no entity in slot)
---@field reserved_entity Entity? Entity (is nil if no entity is reserved to come back to this slot)
---@field component Component? Component object or nil if none
---@field type string Slot type
---@field has_extra_data boolean Result
---@field extra_data table Extra data table
---@field locked boolean Locked
---An item slot object represents one slot of the inventory of an entity.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot)
ItemSlot = {}

---Sets the content of an empty slot.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot-setitemandstack)
---@param item_id itemId Item id
---@param amount integer Amount
---@param extra_data table? Extra data table (OPTIONAL, default nil)
function ItemSlot:SetItemAndStack(item_id, amount, extra_data) end

---Add amounts in this slot (must have an item in it).
--- If the new amount is higher than `stack + unreserved_space` it will fail with an error.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot-addstack)
---@param amount integer Amount to be added
function ItemSlot:AddStack(amount) end

---Add or remove amounts in this slot (must have an item in it).
--- If the new amount is lower than `reserved_stack` it will fail with an error.
--- If the new amount is zero, the item will be cleared from the slot
--- and the stack can't be modified again until the item is put in again.
--- This cannot be used to remove stack of something with extra_data (use Clear)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot-removestack)
---@param amount integer Amount to be removed
function ItemSlot:RemoveStack(amount) end

---Clear the content in this slot.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot-clear)
---@returns table # The extra_data table before the slot was cleared
function ItemSlot:Clear() return {} end

---Sets the item and locks an otherwise empty slot.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot-setlockeditem)
---@param item_id itemId? Item id (or nil to change a locked slot to empty)
function ItemSlot:SetLockedItem(item_id) end

---Swap the entire contents (including reservations) of two slots of the same slot type on the same inventory.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot-swap)
---@param item_slot ItemSlot Other item slot (must be of the same slot type and on the same inventory)
function ItemSlot:Swap(item_slot) end

---Move as much as possible (including reservations) into another slot on the same inventory.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot-move)
---@param item_slot ItemSlot Target item slot (must be on the same inventory and be empty or have the same item)
---@param amount_limit integer? Limit amount to be moved (OPTIONAL, default everything)
---@returns boolean # True if any items or reservations have been moved
function ItemSlot:Move(item_slot, amount_limit) return false end

---Gets all the reserve information relative to this slot.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot-getreserveinfo)
---@returns table # a set of tables of each reserve info related to this slot
function ItemSlot:GetReserveInfo() return {} end

---Cancel all orders related to this item slot.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot-cancelorders)
function ItemSlot:CancelOrders() end

---The amount of free space actually available to be filled with a specific item (slot can be empty).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#itemslot-getunreservedspacefor)
---@param item_id itemId Item id
---@returns integer # Unreserved free space count
function ItemSlot:GetUnreservedSpaceFor(item_id) return 0 end

