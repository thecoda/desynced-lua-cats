---@meta Entity

---@class Entity
---@field key integer key
---@field id string frame id
---@field def table frame definition table
---@field visual_id string visual id
---@field visual_def table visual definition table
---@field components table Component array table
---@field slots table Item slot array table
---@field has_extra_data boolean Result
---@field extra_data table Extra data table
---@field faction Faction|string Faction object
---@field visibility_range integer Visibility range
---@field component_boost integer Component efficiency percent
---@field move_boost integer Move speed boost percent
---@field max_health integer Maximum health
---@field health integer Health
---@field is_damaged boolean Damaged state
---@field exists boolean Exist state
---@field efficiency integer Efficiency from 0 to 100 (or nil if entity has no power data)
---@field power_grid_index integer Grid index (or nil if entity is not connected to a power grid)
---@field has_power boolean Power availability
---@field extra_power integer Amount of power supplied (positive value) or consumed (negative value)
---@field extra_transfer_range integer Extra power range in tiles
---@field power_range integer power range
---@field power_details table Details table (or nil if entity has no power data)
---@field battery_percent integer Percentage 0 to 100
---@field animation_speed integer animation speed
---@field light_color table RGBA light color value
---@field location Point Location
---@field placed_location Point Placed Location
---@field location_hash integer Location hash
---@field size Point Size
---@field rotation integer Rotation (0 to 3)
---@field move_goal Point Goal coordinate (or nil if not moving)
---@field is_moving boolean Movement state
---@field has_movement boolean True if the entity has movement
---@field is_placed boolean Placed on the map state (when true, is_docked is always false)
---@field is_docked boolean Docked state (when true, is_placed is always false)
---@field docked_garage Entity Garage entity (nil if not docked)
---@field disconnected boolean Disconnected state
---@field powered_down boolean Power down state
---@field stealth boolean Stealth state
---@field lootable boolean Lootable flag
---@field has_blight_shield boolean Flag value
---@field has_landing_pad boolean Flag value
---@field want_goto_callback boolean Flag value
---@field logistics_channel_1 boolean Flag value
---@field logistics_channel_2 boolean Flag value
---@field logistics_channel_3 boolean Flag value
---@field logistics_channel_4 boolean Flag value
---@field logistics_supplier boolean Flag value
---@field logistics_requester boolean Flag value
---@field logistics_carrier boolean Flag value
---@field logistics_crane_only boolean Flag value
---@field logistics_transport_route boolean Flag value
---@field logistics_high_priority boolean Flag value
---@field has_crane boolean Flag value
---@field crane_range integer Crane range (0 = disabled, 255 = maximum)
---@field is_construction boolean Construction site
---@field state_idle boolean State value
---@field state_path_blocked boolean State value
---@field state_unpowered boolean State value
---@field state_emergency boolean State value
---@field state_broken boolean State value
---@field state_custom_1 boolean State value
---@field state_custom_2 boolean State value
---@field state_custom_3 boolean State value
---@field state_custom_4 boolean State value
---@field idle_mode string Mode (IDLE/STORE/MOVE/ORDER/COMPONENT/INTERACT/RETURN)
---@field controlling_component Component Component in control
---@field active_order table Order info (or nil)
---@field has_component_list boolean Result
---@field component_count integer number of components (0 if the entity has no component list)
---@field slot_count integer number item slots (0 if the entity has no inventory)
---@field register_count integer number of registers (0 if the entity has no registry)
---@field frame_register_count integer Number of frame registers (or nil if the entity has no registry)
---@field most_relevant_state string most relevant state name
---@field all_states table an array of all state names affecting the unit
---@field render_instances integer Count
---@field has_active_effects boolean Result
---@field idle_ticks integer Idle tick count
---@field interpolated_location Point Interpolated 3D location (x, y and z as floating point numbers)
---@field interpolated_center Point Interpolated 3D position (x, y and z as floating point numbers)
---@field interpolated_rotation integer Interpolated rotation in degrees
---@field interpolated_direction Point Interpolated 3D direction (x, y and z as floating point numbers)
---An entity object represents a single entity that can be placed in the world.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#entity)
Entity = {}

---Place this entity on the map (or teleport it if it is already placed).
--- Unless the last parameter is false, automatically selects a close location if the passed coordinates are occupied
--- If rotation argument is not passed, it will keep the previous rotation
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-place)
---@param location Point Location
---@param rotation Rotation? Rotation (0 to 3) (OPTIONAL)
---@param nearby_if_blocked boolean? Place nearby if blocking (OPTIONAL, default true)
---@returns boolean? # Returns boolean false if failed to place, otherwise nil
---@overload fun(x: integer, y: integer, rotation: Rotation?, nearby_if_blocked: boolean?): boolean?
function Entity:Place(location, rotation, nearby_if_blocked) return false end

---Remove this entity from the map.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-unplace)
function Entity:Unplace() end

---Destroy this entity.
--- Can automatically drop all components and inventory items held by it, as well as additional items
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-destroy)
---@param drop_inventory boolean? Flag if items and components held by this entity should be dropped (OPTIONAL, default true)
---@param extra_drops table? Table of additional items that drop (item_id keys and count values) (OPTIONAL)
---@param drop_target Entity? If set, try to store items in this entities inventory instead of dropping them to the ground (OPTIONAL)
function Entity:Destroy(drop_inventory, extra_drops, drop_target) end

---Create and add a new component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-addcomponent)
---@param component_id componentId Component id
---@param add_mode AddMode? Add mode ("auto" will find a suitable socket, "hidden" will add the component hidden) (OPTIONAL, default "auto")
---@param extra_data table? Extra data table (OPTIONAL, default nil)
---@returns Component? # Component object (or nil on error)
---@overload fun(component_id: componentId, socket_index: integer, extra_data: table?): Component?
function Entity:AddComponent(component_id, add_mode, extra_data) return Component end

---Get an existing component at a specific socket index
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getcomponent)
---@param socket_index integer Socket index (starts at 1)
---@returns Component? # Component object or nil if not exist
function Entity:GetComponent(socket_index) return Component end

---Swap the content of two sockets
--- One or both sockets must contain a component which must fit into the other socket
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-swapsockets)
---@param socket_index_1 integer First socket index
---@param socket_index_2 integer Second socket index
---@returns boolean # If it was successful
function Entity:SwapSockets(socket_index_1, socket_index_2) return false end

---Get an existing hidden component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-gethiddencomponent)
---@param component_number integer|nil Hidden component number (starts at 1) (OPTIONAL, default 1)
---@returns Component? # Component object or nil if not exist
function Entity:GetHiddenComponent(component_number) return Component end

---Count the components of the same type on an entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-countcomponents)
---@param component_id componentId Component id
---@returns integer # number of the components
function Entity:CountComponents(component_id) return 0 end

---Find an existing component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-findcomponent)
---@param component_id componentId Component id
---@param query_base boolean? Set to true to query the base_id value of component definitions if it exists (OPTIONAL, default false)
---@param component_number integer? Component number (if there are multiples of the same component) (OPTIONAL, default 1)
---@returns Component? # Component object or nil if not found
function Entity:FindComponent(component_id, query_base, component_number) return Component end

---Check if a free socket of large enough size is available to equip a component.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getfreesocket)
---@param component_id componentId Component id
---@returns integer? # Socket index it can be equipped into or nil if not possible (or if passed id is not a component)
function Entity:GetFreeSocket(component_id) return 0 end

---Test if a component fits into a socket (regardless if there is already something equipped in the socket).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-checksocketsize)
---@param component_id componentId Component id
---@param socket_index integer Socket index to test the component against (starts at 1)
---@returns boolean # True if the socket is large enough to hold the component
function Entity:CheckSocketSize(component_id, socket_index) return false end

---Get a register of this entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getregister)
---@param register Register|integer Register reference
---@returns Register # Register object
function Entity:GetRegister(register) return Register end

---Get a list of links on the entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getregisterlinks)
---@param also_cross_entity boolean|nil Also return cross-entity links (OPTIONAL, default false)
---@returns table # Array of links
function Entity:GetRegisterLinks(also_cross_entity) return {} end

---Get the number part of a register of this entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getregisternum)
---@param register Register|integer Register reference
---@returns integer # Number value
function Entity:GetRegisterNum(register) return 0 end

---Get the id part of a register of this entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getregisterid)
---@param register Register|integer Register reference
---@returns string # Id value
function Entity:GetRegisterId(register) return "" end

---Get the definition table of the id stored in a register of this entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getregisterdef)
---@param register Register|integer Register reference
---@returns table # Definition table
function Entity:GetRegisterDef(register) return {} end

---Get the entity part of a register of this entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getregisterentity)
---@param register Register|integer Register reference
---@returns Entity # Entity value
function Entity:GetRegisterEntity(register) return Entity end

---Get the coordinate part of a register of this entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getregistercoord)
---@param register Register|integer Register reference
---@returns Point # Coordinate value
function Entity:GetRegisterCoord(register) return Point end

---Compare two registers of this entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-registersequal)
---@param first_register Register|integer First register reference
---@param second_register Register|integer Second register reference
---@returns boolean # Comparison result
function Entity:RegistersEqual(first_register, second_register) return false end

---Set a register of this entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-setregister)
---@param register Register|integer Register reference
---@param value Register? Register object value
---@param force_update_and_activate boolean? Force update the register and activate components (OPTIONAL, default false)
function Entity:SetRegister(register, value, force_update_and_activate) end

---Set the number part of a register of this entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-setregisternum)
---@param register Register|integer Register reference
---@param number_value integer Number value
function Entity:SetRegisterNum(register, number_value) end

---Set the id part of a register of this entity (will overwrites the entity/coordinate part).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-setregisterid)
---@param register Register|integer Register reference
---@param id_value itemId Id value
---@param number_value integer|nil Number value (OPTIONAL)
function Entity:SetRegisterId(register, id_value, number_value) end

---Set the entity part of a register of this entity (will overwrite the id/coordinate part).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-setregisterentity)
---@param register Register|integer Register reference
---@param entity Entity Entity value
---@param number_value integer|nil Number value (OPTIONAL)
function Entity:SetRegisterEntity(register, entity, number_value) end

---Set the coordinate part of a register of this entity (will overwrite the id/entity part).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-setregistercoord)
---@param register Register|integer Register reference
---@param point Point Coordinate value
---@param number_value integer|nil Number value (OPTIONAL)
function Entity:SetRegisterCoord(register, point, number_value) end

---Flag the error state on a register of this entity.
--- Will stay flagged until the register value changes.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-flagregistererror)
---@param register Register|integer Register reference
---@param set_error_state boolean? Whether to set the error state (OPTIONAL)
function Entity:FlagRegisterError(register, set_error_state) end

---Check if a register of this entity is linked from another register.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-registerislink)
---@param register Register|integer Register reference
---@returns boolean # link state
function Entity:RegisterIsLink(register) return false end

---Check if a register of this entity is empty
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-registerisempty)
---@param register Register|integer Register reference
---@returns boolean # Empty
function Entity:RegisterIsEmpty(register) return false end

---Check if a register of this entity is in error state.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-registeriserror)
---@param register Register|integer Register reference
---@returns boolean # Error
function Entity:RegisterIsError(register) return false end

---Check if two registers have a connection via link(s).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-registerhasconnection)
---@param register_one Register|integer Register one
---@param register_two Register|integer Register two
---@param register_two_holder Entity|Component|nil Different entity that holds the second register (OPTIONAL)
---@returns boolean # Check result
function Entity:RegisterHasConnection(register_one, register_two, register_two_holder) return false end

---Link a register from another register.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-linkregisterfromregister)
---@param target_register Register|integer Target register reference
---@param source_register Register|integer Source register reference
---@param source_register_holder Entity|Component|nil Different entity that holds the source register (OPTIONAL)
function Entity:LinkRegisterFromRegister(target_register, source_register, source_register_holder) end

---Unlink a register from another register.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-unlinkregisterfromregister)
---@param target_register Register|integer Target register reference
---@param source_register Register|integer Source register reference
---@param source_register_holder Entity|Component|nil Different entity that holds the source register (OPTIONAL)
function Entity:UnlinkRegisterFromRegister(target_register, source_register, source_register_holder) end

---Get the source index of the first relevant register link.
--- If no entity or component is specified, information of the first link containing any value will be returned.
--- Otherwise it will look up a specific link and return only the register index.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getregisterlinksource)
---@param register Register|integer Target register reference
---@param register_holder Entity|Component Entity that holds the source register
---@returns Component|nil # Component that holds the source register or nil if frame register (unless entity/component specified)
---@overload fun(register: Register|integer): Component?
function Entity:GetRegisterLinkSource(register, register_holder) return Component end

---Get the target index of the first relevant register link
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getregisterlinktarget)
---@param register Register|integer Source register reference
---@param register_holder Entity|Component|nil Different entity that holds the source register (OPTIONAL)
---@returns integer? Target register index, absolute entity index (or nil if not exist)
function Entity:GetRegisterLinkTarget(register, register_holder) return 0 end

---Add an item to the inventory.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-additem)
---@param item_id itemId Item id
---@param amount integer? Amount (OPTIONAL, default 1)
---@param extra_data table? Extra data table (OPTIONAL, default nil)
---@returns ItemSlot? # Item slot object into which the item has been added (or nil on error)
function Entity:AddItem(item_id, amount, extra_data) return ItemSlot end

---Count (unreserved) stacks of an item across all item slots.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-countitem)
---@param item_id itemId Item id
---@param only_unreserved boolean? Count unreserved, if true it will only count unreserved stack amounts (OPTIONAL, default false)
---@returns integer # Item count
function Entity:CountItem(item_id, only_unreserved) return 0 end

---Check if there is any free space to add the item in any item slots.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-havefreespace)
---@param item_id itemId Item id
---@param count integer? Count of item (OPTIONAL, default 1)
---@returns boolean # Can items be added
function Entity:HaveFreeSpace(item_id, count) return false end

---Count how much free space for an item in any item slots.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-countfreespace)
---@param item_id itemId Item id
---@returns integer|nil # Number of availabe Space (or nil if item id is nil)
function Entity:CountFreeSpace(item_id) return 0 end

---Find an item slot with enough free space to store a given amount.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getfreeslot)
---@param item_id itemId Item id
---@param amount integer? Amount to search (OPTIONAL, default max stack size)
---@returns ItemSlot? # Item slot object with the space available (or nil on error)
function Entity:GetFreeSlot(item_id, amount) return ItemSlot end

---Get a single item slot at a specific slot index.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getslot)
---@param slot_index integer Slot index (starts at 1)
---@returns ItemSlot? # Item slot object or nil if not exist
function Entity:GetSlot(slot_index) return ItemSlot end

---Find an item slot with a specific item.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-findslot)
---@param item_id itemId Item id
---@param limit_to_slot integer? Limit search to slot with at least this amount of unreserved stack in it (OPTIONAL)
---@returns ItemSlot? # Item slot object or nil if not found
function Entity:FindSlot(item_id, limit_to_slot) return ItemSlot end

---Add inventory slots.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-addslots)
---@param slot_type string Slot type
---@param number_of_slots integer? Number of slots to add (OPTIONAL, default 1)
---@returns ItemSlot? # Component object (or nil on error)
function Entity:AddSlots(slot_type, number_of_slots) return ItemSlot end

---Automatically merge stacks of the same item across the inventory.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-automergeslots)
---@param limit_to itemId Limit merging to just one this one item id (OPTIONAL)
---@returns integer # Number of inventory slots that became empty due to the merge
function Entity:AutoMergeSlots(limit_to) return 0 end

---Check if the entity is waiting for an order of a specific item.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-iswaitingfororder)
---@param item_id itemId Item id
---@returns boolean # Has item on order
function Entity:IsWaitingForOrder(item_id) return false end

---Transfer an item from the inventory of another entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-transferfrom)
---@param entity Entity Item source entity
---@param item_id itemId Item id
---@param amount integer Amount
---@param show_throw_effect boolean? Show the visual item throw effect (OPTIONAL, default false)
---@returns integer|nil # Amount actually transferred (can be 0 if there is no free space) (or nil on error)
function Entity:TransferFrom(entity, item_id, amount, show_throw_effect) return 0 end

---Drop an item to the ground.
--- If a drop target coordinate is given, it will only used as a direction where to drop. It is not possible to drop away further than 1 tile.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-dropitem)
---@param item itemId|ItemSlot Item id or slot
---@param amount integer? Amount (OPTIONAL, default to everything available of that item id)
---@param x integer X coordinate of drop target
---@param y integer Y coordinate of drop target
function Entity:DropItem(item, amount, x, y) end

---Drop an equipped component to the ground.
--- If a drop target coordinate is given, it will only used as a direction where to drop. It is not possible to drop away further than 1 tile.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-dropcomponent)
---@param component Component Component to drop
---@param x integer X coordinate of drop target
---@param y integer Y coordinate of drop target
function Entity:DropComponent(component, x, y) end

---Order an item.
--- The order will stay active until fulfilled, CancelOrder gets called or the entity is destroyed.
--- Will return nil on invalid item or amount or if not enough free space available in the slot.
--- If the item slot is omitted, multiple orders can be created covering the entire inventory.
--- Without a specific item slot, no new orders will be created if the inventory already contains
--- the requested amount (and nil will be returned). If Amount is less than already ordered or 0
--- existing order(s) will get adjusted to the new amount.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-orderitem)
---@param item_slot ItemSlot? Order items into this slot (OPTIONAL)
---@param item_id itemId Item id to be ordered
---@param amount integer Amount to be ordered
---@returns integer # Order ID created or modified
function Entity:OrderItem(item_slot, item_id, amount) return 0 end

---Start moving the entity to a given location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-moveto)
---@param x integer Move location X
---@param y integer Move location Y
---@overload fun(target: Entity|integer): Component?
function Entity:MoveTo(x, y) end

---Start moving the entity somewhere outside of a given area.
--- This will do nothing if the entity is already outside the area.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-moveaway)
---@param location Area|Point|Entity Location or area to move away from
function Entity:MoveAway(location) end

---Stop movement and abort what is currently controlling the entities movement.
--- Movement can be controlled via manual movement, or automated by order/component/context/home.
--- Components that don't request movement control will continue working autonomously.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-cancel)
function Entity:Cancel() end

---Rotate the entity to look towards a given location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-lookat)
---@param location Area|Point|Entity Location
function Entity:LookAt(location) end

---Check if the entity is touching another entity or a location.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-istouching)
---@param location Area|Point|Entity Location
---@returns boolean # True if located next to other entity/location
function Entity:IsTouching(location) return false end

---Check if the entity is in range of another entity or a location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-isinrangeof)
---@param location Area|Point|Entity Location
---@param range integer Range to test (if 1 will act like IsTouching)
---@returns boolean # True if in range of other entity/location
function Entity:IsInRangeOf(location, range) return false end

---Measure the range in tiles to another entity or a location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getrangeto)
---@param location Area|Point|Entity Location
---@returns integer # Distance in number of tiles
function Entity:GetRangeTo(location) return 0 end

---Get the squared distance to another entity or a location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getrangesquaredto)
---@param location Area|Point|Entity Location
---@returns integer # Squared distance
function Entity:GetRangeSquaredTo(location) return 0 end

---Dock this entity into an item slot of another entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-dockinto)
---@param garage Entity Garage entity to dock into
---@returns boolean? # True if docking succeeded, false if garage was full (or nil on error)
function Entity:DockInto(garage) return false end

---Undock this entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-undock)
---@param reserve_for_return boolean? If true, reserve the item slot for this entity to come back later (OPTIONAL, default true)
---@returns boolean? # True if undocking succeeded (or nil on error)
function Entity:Undock(reserve_for_return) return false end

---removes an instance from the entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-removeentityinstance)
function Entity:RemoveEntityInstance() end

---Spawn particle/sound effect on this entity.
--- Only possible on entities which are placed on the map
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-playeffect)
---@param effect_id effectId Effect ID
---@param socket_name string? Socket name (OPTIONAL)
---@param target_entity Entity? Target entity (OPTIONAL)
---@param entity_instance integer? Entity instance number (OPTIONAL)
---@returns integer # Effect instance (only for looping effects, can be used with `entity:StopEffect`)
---@overload fun(effect_id: effectId, entity_instance: integer?): integer
function Entity:PlayEffect(effect_id, socket_name, target_entity, entity_instance) return 0 end

---Stop all looping particle/sound effects.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-stopeffects)
function Entity:StopEffects() end

---Stop a specific looping particle/sound effect.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-stopeffect)
---@param entity_instance integer Effect Instance
function Entity:StopEffect(entity_instance) end

---Activate event of the visuals frame blueprint.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-activate)
function Entity:Activate() end

---Deactivate event of the visuals frame blueprint.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-deactivate)
function Entity:Deactivate() end

---Get the size this entity would have at a given rotation.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-getsizeatrotation)
---@param visual_id visualId Visual id
---@param rotation Rotation Rotation (0 to 3)
function Entity:GetSizeAtRotation(visual_id, rotation) end

---Sets a new visual and rotation for an entity.
--- This will fail and return false if the new visual in the new rotation occupies different tiles or has different component sockets.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-setvisual)
---@param visual_id visualId Visual id
---@param rotation Rotation Rotation (0 to 3)
---@returns boolean # Result
function Entity:SetVisual(visual_id, rotation) return false end

---Add health (cannot exceed max_health).
--- This does nothing if the entity is at 0 health (because it is in the process of being destroyed)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-addhealth)
---@param add_amount integer Add amount
---@returns integer # New health amount on entity
function Entity:AddHealth(add_amount) return 0 end

---Remove health while handling any damage reduction by shield components.
--- This does nothing if the entity is at 0 health (because it is in the process of being destroyed)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#entity-removehealth)
---@param remove_amount integer Remove amount
---@param causing_entity Entity? Which entity caused the damage (OPTIONAL)
---@returns integer # New health amount on entity (0 if destroyed)
function Entity:RemoveHealth(remove_amount, causing_entity) return 0 end

