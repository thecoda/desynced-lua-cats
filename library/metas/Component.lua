---@meta Component

---@class Component
---@field owner Entity Owner entity
---@field faction Faction|string Faction object
---@field exists boolean Exist state
---@field key integer key
---@field id string Component id
---@field base_id string Component base id (base_id if set otherwise regular id)
---@field def ComponentDef Component definition
---@field visual Visual
---@field visual_id string visual id
---@field visual_def table visual definition table
---@field socket_index integer Socket index (or 0 if hidden)
---@field slot_index integer Register index
---@field slot_count integer Number of slots
---@field slots table Item slot array table
---@field register_index integer Register index
---@field register_count integer Number of registers
---@field is_empty boolean Empty state
---@field is_hidden boolean Hidden state
---@field is_active boolean Active state
---@field is_working boolean Working state
---@field is_sleeping boolean Sleeping state
---@field is_updating boolean Updating state
---@field has_move_control boolean Movement control state
---@field has_prepared_process boolean Has started process state
---@field progress_percent integer Work progress (between 0 and 100, or -1 if not working)
---@field interpolated_progress integer Work progress (between 0.0 and 1.0, or -1 if not working)
---@field ticker integer Work ticker (how many ticks elapsed since work or sleep start, or 0 if inactive)
---@field ticker_target integer Total work ticks (total ticks until work or sleep finishes, or 0 if inactive)
---@field has_extra_data boolean Result
---@field extra_data table Extra data table
---@field stored_power integer Currently stored power amount
---@field extra_power integer Amount of power supplied (positive value) or consumed (negative value)
---@field extra_transfer_range integer Extra power range in tiles
---@field power_relay_target Entity Relay target entity
---@field power_details table Details table (or nil if component has no power data)
---@field animation_speed integer Speed
---@field light_color table RGBA light color value
---@field has_active_effects boolean Result
---@field triggering_entities table Entity array
---A component object represents a component equipped by an entity.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#component)
Component = {}

---Destroys a component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-destroy)
---@return table # The final state of the extra_data value after on_remove has been called
function Component:Destroy() return {} end

---Prepare a component for removal by clearing out all item slots and reserves related to this component.
--- If the component is hidden or is marked with non_removable, the function will return false.
--- Contained items will be moved to other inventory slots or (if the entity is movable or has a crane) dropped.
--- The function returns true if all items could be moved away or dropped (or there are no items contained).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-prepareremoval)
---@param item_slot ItemSlot? An item slot that should be kept empty (OPTIONAL)
---@return boolean # Result
function Component:PrepareRemoval(item_slot) return false end

---Get a register of this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getregister)
---@param register Register|integer Register reference
---@return Register # Register object
function Component:GetRegister(register) return Register end

---Get the number part of a register of this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getregisternum)
---@param register Register|integer Register reference
---@return integer # Number value
function Component:GetRegisterNum(register) return 0 end

---Get the id part of a register of this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getregisterid)
---@param register Register|integer Register reference
---@return string # Id value
function Component:GetRegisterId(register) return "" end

---Get the definition table of the id stored in a register of this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getregisterdef)
---@param register Register|integer Register reference
---@return table # Definition table
function Component:GetRegisterDef(register) return {} end

---Get the entity part of a register of this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getregisterentity)
---@param register Register|integer Register reference
---@return Entity # Entity value
function Component:GetRegisterEntity(register) return Entity end

---Get the coordinate part of a register of this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getregistercoord)
---@param register Register|integer Register reference
---@return Point # Coordinate value
function Component:GetRegisterCoord(register) return Point end

---Compare two registers of this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-registersequal)
---@param first_register Register|integer First register reference
---@param second_register Register|integer Second register reference
---@return boolean # Comparison result
function Component:RegistersEqual(first_register, second_register) return false end

---Set a register of this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-setregister)
---@param register Register|integer Register reference
---@param value RegisterDef Register object value
---@param update_and_activate boolean? Force update the register and activate the component (OPTIONAL, default false)
function Component:SetRegister(register, value, update_and_activate) end

---Set the number part of a register of this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-setregisternum)
---@param register Register|integer Register reference
---@param num_value integer Number value
function Component:SetRegisterNum(register, num_value) end

---Set the id part of a register of this component (will overwrites the entity/coordinate part).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-setregisterid)
---@param register Register|integer Register reference
---@param id_value string Id value
---@param num_value integer? Number value (OPTIONAL)
function Component:SetRegisterId(register, id_value, num_value) end

---Set the entity part of a register of this component (will overwrite the id/coordinate part).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-setregisterentity)
---@param register Register|integer Register reference
---@param entity Entity Entity value
---@param num_value integer? Number value (OPTIONAL)
function Component:SetRegisterEntity(register, entity, num_value) end

---Set the coordinate part of a register of this component (will overwrite the id/entity part).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-setregistercoord)
---@param register Register|integer Register reference
---@param point Point Coordinate value
---@param num_value integer? Number value (OPTIONAL)
function Component:SetRegisterCoord(register, point, num_value) end

---Flag the error state on a register of this component.
--- Will stay flagged until the register value changes.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-flagregistererror)
---@param register Register|integer Register reference
---@param set_error_state boolean? Whether to set the error state (OPTIONAL)
function Component:FlagRegisterError(register, set_error_state) end

---Check if a register of this component is linked from another register.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-registerislink)
---@param register Register|integer Register reference
---@return boolean # link state
function Component:RegisterIsLink(register) return false end

---Check if a register of this component is empty.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-registerisempty)
---@param register Register|integer Register reference
---@return boolean # Empty
function Component:RegisterIsEmpty(register) return false end

---Check if a register of this component is in error state.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-registeriserror)
---@param register Register|integer Register reference
---@return boolean # Error
function Component:RegisterIsError(register) return false end

---Check if two registers have a connection via link(s).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-registerhasconnection)
---@param register_one Register|integer Register one
---@param register_two Register|integer Register two
---@param register_two_owner Entity|Component|nil Different entity that holds the second register (OPTIONAL)
---@return boolean # Check result
function Component:RegisterHasConnection(register_one, register_two, register_two_owner) return false end


---Link a register from another register.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-linkregisterfromregister)
---@param target_register Register|integer Target register reference
---@param source_register Register|integer Source register reference
---@param source_register_owner Entity|Component|nil Different entity that holds the source register (OPTIONAL)
function Component:LinkRegisterFromRegister(target_register, source_register, source_register_owner) end

---Unlink a register from another register.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-unlinkregisterfromregister)
---@param target_register Register|integer Target register reference
---@param source_register Register|integer Source register reference
---@param source_register_owner Entity|Component|nil Different entity that holds the source register (OPTIONAL)
function Component:UnlinkRegisterFromRegister(target_register, source_register, source_register_owner) end


---Get the source index of the first relevant register link.
--- If no entity or component is specified, information of the first link containing any value will be returned.
--- Otherwise it will look up a specific link and return only the register index.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getregisterlinksource)
---@param target_register Register|integer Target register reference
---@param holder Component|Entity Entity that holds the source register
---@return Component? # Component that holds the source register or nil if frame register (unless entity/component specified)
---@overload fun(target_register: Register|integer): Component?
function Component:GetRegisterLinkSource(target_register, holder) return Component end

---Get the target index of the first relevant register link.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getregisterlinktarget)
---@param source_register Register|integer Source register reference
---@param holder Entity|Component|nil Different entity that holds the source register (OPTIONAL)
---@return integer? # Target register index relative to this component (or nil if not exist)
function Component:GetRegisterLinkTarget(source_register, holder) return 0 end

---Get an item slot of this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getslot)
---@param slot_number integer Slot number (starts at 1)
---@return ItemSlot # Item slot object
function Component:GetSlot(slot_number) return ItemSlot end

---Clear activation change flags that would trigger the on_update callback in the next tick.
--- If the on_update callback causes modification to the same item slots that triggers its activation,
--- unless this function is called, it will be activated again in the next tick due to its own change.
--- Changes to registers made with the component:SetRegister function during on_update are automatically cleared.
--- Be aware this does not work for the activation modes 'OnAnyItemSlotChange'.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-clearactivationchangeflags)
function Component:ClearActivationChangeFlags() end

---Set up a process that consumes ingredients and generates output items.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-prepareproduceprocess)
---@param ingredients table Ingredients table (item_id keys and count values)
---@param outputs table? Outputs table (item_id keys and count values) (when nil, act like PrepareConsumeProcess)
---@param order_count integer? Order count (if multiple processes are queued up) (OPTIONAL, default 1)
---@return Register? # A register value describing the first missing ingredient (or nil if all ingredients are available)
function Component:PrepareProduceProcess(ingredients, outputs, order_count) return Register end

---Set up a process that generates output items.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-preparegenerateprocess)
---@param outputs table Outputs table (item_id keys and count values)
---@return boolean # Returns true if inventory space for outputs are available now and process can start
function Component:PrepareGenerateProcess(outputs) return false end

---Set up a process that consumes ingredients.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-prepareconsumeprocess)
---@param ingredients table Ingredients table (item_id keys and count values)
---@param order_count integer? Order count (if multiple processes are queued up) (OPTIONAL, default 1)
---@return Register? # A register value describing the first missing ingredient (or nil if all ingredients are available)
---@overload fun(ingredients: table, item_slot: ItemSlot): Register?
function Component:PrepareConsumeProcess(ingredients, order_count) return Register end

---Finish a prepared process (add generated items and remove consumed ingredients).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-fulfillprocess)
function Component:FulfillProcess() end

---Cancel ongoing process and related orders from this component
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-cancelprocess)
function Component:CancelProcess() end

---If there is a prepared process, get an item slot from which items are consumed from.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getprocessconsumeslot)
---@param slot_number integer? This selects the slot when there are multiple consume slots (OPTIONAL, default 1)
---@return ItemSlot? # Consuming item slot (nil if no active consume process or invalid argument)
function Component:GetProcessConsumeSlot(slot_number) return ItemSlot end

---If there is a prepared process, get an item slot from which items are output to.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-getprocessoutputslot)
---@param slot_number integer? This selects the slot when there are multiple output slots (OPTIONAL, default 1)
---@return ItemSlot? # Output item slot (nil if no active generate process or invalid argument)
function Component:GetProcessOutputSlot(slot_number) return ItemSlot end

---Order an item through this component
--- The order will stay active while this component works or sleeps but gets canceled
--- when the component becomes inactive or when CancelProcess is called.
--- If an order already exists on the same item slot it will be modified to the new amount requested.
--- Will return nil on invalid item or amount or if not enough free space available in the slot.
--- If the item slot is omitted, multiple orders can be created covering the entire inventory.
--- Without a specific item slot, no new orders will be created if the inventory already contains
--- the requested amount (and nil will be returned). If Amount is less than already ordered or 0
--- existing order(s) will get adjusted to the new amount.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-orderitem)
---@param into_slot ItemSlot? Order items into this slot (OPTIONAL)
---@param item_id itemId Item id to be ordered
---@param amount integer Amount to be ordered
---@return integer # Order ID created or modified
function Component:OrderItem(into_slot, item_id, amount) return 0 end

---Turns component to look at a target entity or location.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#component-rotatecomponent)
---@param target Entity|Component|Point Target entity to look at
---@param rotate_entity_not_component boolean? If the entity has movement rotate it instead (OPTIONAL, default false)
---@overload fun(x: integer, y: integer, rotate_entity_not_component: boolean?)
---@overload fun(degrees: integer)
function Component:RotateComponent(target, rotate_entity_not_component) end

---Request the entity to move on behalf of this component (if movement is needed).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-requeststatemove)
---@param target Entity|Component|Point Target entity to move next to
---@param range integer? Range of how close by to stop (OPTIONAL, default 1)
---@param avoid_distractions boolean? Keep moving when component sleeps or starts working (OPTIONAL, default false)
---@return boolean # Returns true if movement is needed, otherwise the entity is already in place
---@overload fun(x: integer, y: integer, range: integer?, avoid_distractions: boolean?): boolean
function Component:RequestStateMove(target, range, avoid_distractions) return false end

---Request the component to sleep.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-setstatesleep)
---@param tick_count integer? Number of ticks to sleep (OPTIONAL, default 5)
---@param keep_movement_control boolean? Keep movement control (OPTIONAL, default false)
function Component:SetStateSleep(tick_count, keep_movement_control) end

---Request the component to work for a duration.
--- If the component is required to prevent the entity from moving while working, `RequestStateMove` needs to be called first.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-setstatestartwork)
---@param tick_count integer? Number of ticks to work (OPTIONAL, default 5)
---@param refresh boolean|integer|nil Refresh flag, number of ticks or true for 5 (OPTIONAL, default false)
function Component:SetStateStartWork(tick_count, refresh) end

---Notify other components waiting for this with CC_OTHER_COMP_FAIL_WORK.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-notifyworkfailed)
function Component:NotifyWorkFailed() end

---Continue work that was started with SetStateStartWork.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-setstatecontinuework)
function Component:SetStateContinueWork() end

---Get called back the next time the first register of this component changes.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-waitforfirstregisterchange)
function Component:WaitForFirstRegisterChange() end

---Get called back the next time any register of this component changes
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-waitforcomponentregisterchange)
function Component:WaitForComponentRegisterChange() end

---Get called back the next time the first item slot of this component changes.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-waitforfirstitemslotchange)
function Component:WaitForFirstItemSlotChange() end

---Get called back the next time any item slot of this component changes.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-waitforcomponentitemslotchange)
function Component:WaitForComponentItemSlotChange() end

---Get called back the next time the entity has low power.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-waitforlowpower)
function Component:WaitForLowPower() end

---Get called back the next time the battery charge is empty.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-waitforpowerstoredempty)
function Component:WaitForPowerStoredEmpty() end

---Get called back when another component finishes work.
--- It is not possible to wait on multiple components simultaneously
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-waitforothercompfinish)
---@param other Component Another component to get called back the next time it finishes work
function Component:WaitForOtherCompFinish(other) end

---Activate a component (trigger on_update).
--- This is most useful for components that have the activation mode set to 'Manual', but it can also be used for other components.
--- Usage of Activate cannot be mixed with the WaitFor* functions.
--- Cannot be called from inside the on_update function (check with `is_updating`).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-activate)
function Component:Activate() end

---Deactivate a component (stop triggering on_update).
--- This will abort what has been started with a SetState, RequestState or WaitFor call.
--- Cannot be called from inside the on_update function (check with `is_updating`).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-shutdown)
function Component:Shutdown() end

---Convert a numerical cause variable received in on_update to a string (for debugging purpose).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-causetostring)
---@param cause integer Cause
function Component:CauseToString(cause) end

---Search for the closest entity of all matching entities inside this components trigger_radius.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-findclosesttriggeringentity)
---@param callback function Callback called for each entity in range in order of distance, return true from this to stop the search
---@return Entity? # The entity for which the callback returned true (or nil if none)
function Component:FindClosestTriggeringEntity(callback) return Entity end

---Spawn particle/sound effect on this component.
--- Only possible on entities which are placed on the map (avoid calling it in on_add, use effect property on definition instead for automatically spawning effects)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-playeffect)
---@param effect_id effectId Effect ID
---@param socket_name string? Socket name (OPTIONAL)
---@param target_entity Entity? Target entity (OPTIONAL)
---@param target_render_instance integer? Target render instance (OPTIONAL)
---@return integer # Effect instance index (only for looping effects, can be used with `entity:StopEffect`)
function Component:PlayEffect(effect_id, socket_name, target_entity, target_render_instance) return 0 end

---Play effect for working component.
--- Similar to PlayEffect but only starts the effect if not already playing an effect and if power is available. Will also stop playing effects if power is not available.
--- This is best used together with SetStateStartWork and passing true to its refresh flag argument.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-playworkeffect)
---@param effect_id effectId Effect ID
---@param socket_name string? Socket name (OPTIONAL)
---@param target_entity Entity? Target entity (OPTIONAL)
---@param target_render_instance integer? Target render instance (OPTIONAL)
function Component:PlayWorkEffect(effect_id, socket_name, target_entity, target_render_instance) end

---Stop all looping effects playing on this component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#component-stopeffects)
function Component:StopEffects() end

