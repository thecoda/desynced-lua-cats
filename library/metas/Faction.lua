---@meta Faction

---@class Faction
---@field is_world_faction boolean True if world faction
---@field is_player_controlled boolean True if created for a player
---@field default_trust string Default trust level, one of 'ENEMY', 'NEUTRAL' or 'ALLY'
---@field entities table Table with a list of all entities
---@field num_entities integer number of entities
---@field foundation_entities table Table with a list of foundation entities
---@field all_items table item_id => count
---@field has_extra_data boolean Result
---@field extra_data table Extra data table
---@field has_blight_shield boolean Flag value
---@field id factionId Faction id
---@field name string Name
---@field seed integer Faction seed
---@field unlocks string[] List of unlocked ids
---@field unlocked_techs techId[] tech id list
---@field unlocked_items itemId[] item id list
---@field unlocked_frames frameId[] frame id list
---@field unlocked_components componentId[] component id list
---@field unlocked_values string[] value id list
---@field unlocked_codex string[] codex id list
---@field researchable_techs techId[] tech id list
---@field items_picked_up itemId[] item id list
---@field discovered_tiles integer Discovered tiles count
---@field moods table faction mood table
---@field color RGBA Extra data table
---@field home_location Point Location
---@field home_entity Entity Home entity
---A faction object represents a player or world owned faction.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#faction)
Faction = {}

---Unlock something.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-unlock)
---@param id string Id to unlock (can be item, frame, component, blueprint, behavior, codex or tech)
---@param show_notification boolean? Notification (OPTIONAL, default true)
---@returns boolean # Returns false if already unlocked
function Faction:Unlock(id, show_notification) return false end

---Check if something was unlocked.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-isunlocked)
---@param id string Id to check
function Faction:IsUnlocked(id) end

---Check if a tech is available for research.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-isresearchable)
---@param tech_id techId Tech id
function Faction:IsResearchable(tech_id) end

---Check if an item was picked up.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-havepickedupitem)
---@param item_id itemId Item id
function Faction:HavePickedUpItem(item_id) end

---Get stats on all power grids of this faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getpowergrids)
---@returns table # Power grids
function Faction:GetPowerGrids() return {} end

---Get stats on all power grids of this faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getpowergrid)
---@param grid_index integer Grid index (see entity.power_details or faction:GetPowerGridIndexAt)
---@returns table # Power grid details
function Faction:GetPowerGrid(grid_index) return {} end

---Check if a tile or area is in a power grid of this faction.
--- If the checking area is larger than one tile, will only return the first power grid found.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getpowergridindexat)
---@param location Area|Point|Entity Location to check
---@returns integer? # Index of the power grid (or nil if not inside any power grid)
function Faction:GetPowerGridIndexAt(location) return 0 end

---Get the history of power.
--- If the requested number of elements is larger than history buffer, the arrays will be filled with zeros
--- If the requested number of elements is 1, the function will return the numbers directly instead of an array
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getpowerhistory)
---@param resolution GetResolution Resolution (1 finest, 3 most coarse)
---@param element_count integer Number of elements to read
---@returns table # Power history data { total_produced = .., total_consumed = .. }
function Faction:GetPowerHistory(resolution, element_count) return {} end

---Get the history of an item held by the faction.
--- If the requested number of elements is larger than history buffer, the arrays will be filled with zeros
--- If the requested number of elements is 1, the function will return the numbers directly instead of an array
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getitemhistory)
---@param item_id itemId item id
---@param resolution GetResolution Resolution (1 finest, 3 most coarse)
---@param element_count integer Number of elements to read
---@returns table # Item history data { added = .., removed = .. }
function Faction:GetItemHistory(item_id, resolution, element_count) return {} end

---Get the total amount currently available of an item.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getitemamount)
---@param item_id itemId item id
---@returns integer # Total item availability count
function Faction:GetItemAmount(item_id) return 0 end

---Get a table of all entities that hold a specific item.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getitemavailability)
---@param p1 string item id
---@returns table<Entity, any>? # Item availability table (key is entity, value is amount held) or nil if not available
function Faction:GetItemAvailability(p1) return {} end

---Get the total amount of generated (mined/produced) and consumed (as ingredients) for an item.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getitemtotals)
---@param item_id itemId item id
---@returns integer # Total amount consumed
function Faction:GetItemTotals(item_id) return 0 end

---Modify the total amount of generated (mined/produced) and consumed (as ingredients) for an item.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-modifyitemtotals)
---@param item_id itemId item id
---@param amount_generated integer Change to total amount generated (positive value to increase, negative value to reduce)
---@param amount_consumed integer Change to total amount consumed (positive value to increase, negative value to reduce)
function Faction:ModifyItemTotals(item_id, amount_generated, amount_consumed) end

---Get a list of all active orders.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getactiveorders)
---@returns table # Array of orders
function Faction:GetActiveOrders() return {} end

---Cancel an existing order.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-cancelorder)
---@param p1 integer Order id
function Faction:CancelOrder(p1) end

---Create order to move items from one entity to another.
--- Either source or target entity must be owned by this faction
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-ordertransfer)
---@param source_entity Entity Source entity
---@param target_entity Entity Target entity
---@param item ItemSlot|itemId Item id
---@param amount integer? Amount (OPTIONAL, default to anything available in first slot with item id)
---@param update_existing boolean? Pass true update an existing order first with a new amount before creating a new order (OPTIONAL)
---@returns boolean # Return true if successful and false if the source doesn't hold the item amount or the target can't receive it
---@overload fun(source_entity: Entity, target_entity: Entity, component: Component): boolean
function Faction:OrderTransfer(source_entity, target_entity, item, amount, update_existing) return false end

---Check if a specific frame/visual combination can be placed by this faction at a given location.
--- If the construction flag is set, the check will return true if checking a location over entities with movement that can move out of the way.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-canplace)
---@param frame_id frameId Frame id
---@param x integer Location X
---@param y integer Location Y
---@param rotation Rotation? Rotation (0 to 3) (OPTIONAL, default 0)
---@param from_id visualId|frameId|nil Specific visual id or another frame id from which to use the visual (OPTIONAL, defaults to frame visual)
---@param construction_flag boolean? Construction flag (OPTIONAL, default false)
---@param ungenerated_is_blocking boolean? Treat un-generated map areas as blocking (OPTIONAL, default true)
---@returns boolean # Result of the check
function Faction:CanPlace(frame_id, x, y, rotation, from_id, construction_flag, ungenerated_is_blocking) return false end

---Reveal visibility of an area.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-revealarea)
---@param location Area|Point|Entity Area
---@param range integer Visibility range
function Faction:RevealArea(location, range) end

---Hide visibility of an area.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-hidearea)
---@param location Area|Point|Entity Area
---@param range integer Visibility range
function Faction:HideArea(location, range) end

---Check if a tile or area is currently visible to this faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-isvisible)
---@param location Area|Point|Entity Location to check
---@param require_all boolean? If true and area specifies multiple tiles, require all tiles to be visible (OPTIONAL, default false)
---@returns boolean # Result of check
function Faction:IsVisible(location, require_all) return false end

---Check if a tile or area has been revealed by this faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-isdiscovered)
---@param location Area|Point|Entity Location to check
---@param require_all boolean? If true and area specifies multiple tiles, require all tiles to be visible (OPTIONAL, default false)
---@returns boolean # Result of check
function Faction:IsDiscovered(location, require_all) return false end

---Check if an entity is visible to this faction (true for everything in visible are as well as certain entities in discovered tiles).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-isseen)
---@param entity Entity Entity to check
---@returns boolean # Result of check
function Faction:IsSeen(entity) return false end

---Finds closest non visible tile.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-findclosesthiddentile)
---@param x integer Start X coordinate
---@param y integer Start Y coordinate
---@param stop_after_count integer Stop search after checking how many tiles
---@param skip_blight boolean? Skip blight tiles (OPTIONAL, default true)
---@returns integer # Result Y position
function Faction:FindClosestHiddenTile(x, y, stop_after_count, skip_blight) return 0 end

---Run code in UI context or call bound UIMsg functions.
--- When called from simulation context the function will execute for all players in this faction (to limit to other players use `UI.Run` or `Action.RunUI`)
--- When called from UI context the function will only execute for the local player if it is in this faction
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-runui)
---@param callback string|function LUA function or registered name to execute in UI context
---@param params any? Passed values (OPTIONAL, can pass multiple values)
function Faction:RunUI(callback, params) end

---Order movable entities to move away from a given area.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-orderentitiestomoveaway)
---@param location Area|Point|Entity Location or area
---@param entity Entity? An entity that will be excepted from the order (OPTIONAL)
---@returns integer # The total number of blocking entities currently in the area (of any faction, excludes the excepted entity)
function Faction:OrderEntitiesToMoveAway(location, entity) return 0 end

---Respawn the faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-respawn)
function Faction:Respawn() end

---Add some amount to one of the faction moods.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-addmood)
---@param mood_name string Mood name (one of the table keys in moods)
---@param amount integer Amount to add
function Faction:AddMood(mood_name, amount) end

---Get all components of a given type equipped by entities of this faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getcomponents)
---@param component_id componentId Component id (or nil to get all components)
---@param query_base boolean? Set to true to query the base_id value of component definitions if it exists (OPTIONAL, default false)
---@returns table # Array of components
function Faction:GetComponents(component_id, query_base) return {} end

---Get all entities of this faction that have a given component equipped.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getentitieswithcomponent)
---@param component_id componentId Component id
---@param query_base boolean? Set to true to query the base_id value of component definitions if it exists (OPTIONAL, default false)
---@param not_hidden boolean? Set to not return hidden components (OPTIONAL, default false)
---@returns table # Array of entities
function Faction:GetEntitiesWithComponent(component_id, query_base, not_hidden) return {} end

---Get all entities owned by this faction that are on screen (excludes foundation entities).
--- If true gets passed, the 5th element will be either nil, a register value or an array with 3 elements per register (reg, x, y)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-getvisibleentities)
---@param only_with_visual_reg_set boolean? Set to true to only get entities with visual register set or a state (OPTIONAL, default false)
---@returns table # One array with 4 or 6 elements for each entity (entity, X, Y, distance as well as visual register and state if true was passed)
function Faction:GetVisibleEntities(only_with_visual_reg_set) return {} end

---Set the trust level towards another faction.
--- The trust level from/to the world faction and self can't be changed
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-settrust)
---@param entity Entity Entity to use the owning faction for the check
---@param trust_level TrustLevel Trust level, one of 'ENEMY', 'NEUTRAL' or 'ALLY'
---@param bidirectional boolean? If set to true, will apply the trust level bidirectional for the other faction towards this as well (OPTIONAL, default false)
---@overload fun(faction: Faction|factionId, trust_level: TrustLevel)
function Faction:SetTrust(entity, trust_level, bidirectional) end

---Get the trust level towards another faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#faction-gettrust)
---@param other Entity|Faction|factionId Other entity, faction or faction id
---@returns TrustLevel? # Trust level, one of 'ENEMY', 'NEUTRAL' or 'ALLY' (will always be 'ALLY' when checking against self and nil when other faction doesn't exist)
function Faction:GetTrust(other) return "" end

