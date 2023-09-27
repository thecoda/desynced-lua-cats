---@meta Map
---The map module contains global functions affecting the game state
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#map)
Map = {}

---Modify simulation speed.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-setgamespeed)
---@param speed integer Game speed
function Map.SetGameSpeed(speed) end

---Get simulation speed.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getgamespeed)
---@return integer # Game speed
function Map.GetGameSpeed() return 0 end

---Check if LUA is currently running in simulation context.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-issimulation)
---@return boolean # True if in simulation context, false if in UI context
function Map.IsSimulation() return false end

---Check if the active map is the front-end menu.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-isfrontend)
---@return boolean # True if front-end
function Map.IsFrontEnd() return false end

---Get current map settings (read only).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getsettings)
---@return table # Current map settings
function Map.GetSettings() return {} end

---Modify game settings during the simulation.
--- Only a few settings can be modified after init, during the simulation (e.g. cheat_free_ingredients, cheat_free_research)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-modifysettings)
---@param settings_key string Settings key
---@param new_value any New value
function Map.ModifySettings(settings_key, new_value) end

---Get map seed (same as GetSettings().seed).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getseed)
---@return integer # Current map seed
function Map.GetSeed() return 0 end

---Get save table (can only be modified in simulation context).
--- If called without argument from a mod that doesn't contain the currently active scenario, will return a mod specific child table parent.mods[mod_id]
--- If called with an empty string or nil, will always return entire parent table
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getsave)
---@param mod_id string? Mod id (OPTIONAL)
---@return table # Save table
function Map.GetSave(mod_id) return {} end

---Call bound MapMsg functions
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-run)
---@param message_name string Message name registered in MapMsg
---@param ... any Passed values (OPTIONAL, can pass multiple values)
function Map.Run(message_name, ...) end

---Get the current simulation tick number.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-gettick)
---@return integer # Tick number
function Map.GetTick() return 0 end

---Get the number of player actions that have been executed.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getexecutedactioncount)
---@return integer # Action count
function Map.GetExecutedActionCount() return 0 end

---Create a new entity from a frame definition
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-createentity)
---@param faction Faction|factionId Faction or faction id
---@param frame_id frameId Frame id
---@param visual_id visualId? Specific visual id or another frame id from which to use the visual (OPTIONAL, defaults to frame visual)
---@param is_map_gen boolean? Pass true for entities spawned as part of map generation (OPTIONAL)
---@return Entity? # Entity object (or nil on error)
function Map.CreateEntity(faction, frame_id, visual_id, is_map_gen) return Entity end

---Drop an item at a specific location.
--- Will combine with existing dropped items if one exists and has space.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-dropitemat)
---@param location Location Location
---@param item_id itemId Item id
---@param amount integer? Amount (OPTIONAL, default 1)
---@param extra_data table? Extra data table (OPTIONAL, default nil)
---@param frame_id frameId? Frame id (OPTIONAL, otherwise use default dropped item frame)
---@param visual_id visualId? Visual id (OPTIONAL, otherwise use default)
---@overload fun(location: Location, item_id: itemId, extra_data: table?, frame_id: frameId?, visual_id: visualId?)
---@overload fun(location: Location, item_id: itemId, amount: integer?, frame_id: frameId?, visual_id: visualId?)
---@overload fun(location: Location, item_id: itemId, frame_id: frameId?, visual_id: visualId?)
function Map.DropItemAt(location, item_id, amount, extra_data, frame_id, visual_id) end

---Get a faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getfaction)
---@param faction_id factionId Faction id
---@return Faction|string|nil # Faction object (or nil on error)
function Map.GetFaction(faction_id) return Faction|string end

---Create a new faction (or get it if it already exists).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-createfaction)
---@param faction_id factionId Faction id
---@return boolean # True if this faction was newly created, false if it already existed
function Map.CreateFaction(faction_id) return false end

---Get all factions.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getfactions)
---@return table # List of faction objects
function Map.GetFactions() return {} end

---Get the number of spawned player faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getplayerfactioncount)
---@return integer # Number of player controlled factions
function Map.GetPlayerFactionCount() return 0 end

---Get the number of days progressed.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-gettotaldays)
---@return integer # Number of days (floating point value, fractional part indicates time of day)
function Map.GetTotalDays() return 0 end

---Get the current sunlight intensity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getsunlightintensity)
---@return integer # Sunlight intensity
function Map.GetSunlightIntensity() return 0 end

---Get the current amount of sunlight (square root of sunlight intensity).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getsunlightamount)
---@return integer # Amount of sunlight (between 0.0 and 1.0 inclusive)
function Map.GetSunlightAmount() return 0 end

---Get the direction of the sunlight as a normalized vector.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getsunlightdirection)
---@return integer # Sunlight Y direction
function Map.GetSunlightDirection() return 0 end

---Get the day time of sunrise and sunset.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getsunriseandsunset)
---@param threshold_time integer? Return time when the sun crosses a given amount of sunlight intensity (OPTIONAL, default 0.0)
---@return integer # Sunset time (between 0.0 and 1.0)
function Map.GetSunriseAndSunset(threshold_time) return 0 end

---Get the location of the Nth next unspawned chunk.
--- The returned tile position is at the center of the unspawned 60x60 chunk
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getundiscoveredlocation)
---@param nth_chunk integer? Request the Nth undiscovered chunk (OPTIONAL, default first)
---@return integer, integer # Y position
function Map.GetUndiscoveredLocation(nth_chunk) return 0, 0 end

---Make sure chunks exist at the given location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-spawnchunks)
---@param location Location Location or area to spawn chunks for
---@return integer # Returns how many new chunks were created
function Map.SpawnChunks(location) return 0 end

---Get blightness for a tile or area.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getblightness)
---@param location Location Location to check
---@param prefer_smallest boolean? If checking more than a single tile, return the smallest value instead of the biggest (OPTIONAL, default false)
---@return integer # blightness
function Map.GetBlightness(location, prefer_smallest) return 0 end

---Get elevation for a tile or area.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getelevation)
---@param location Location Location to check
---@param prefer_smallest boolean? If checking more than a single tile, return the smallest value instead of the biggest (OPTIONAL, default false)
---@return integer # elevation
function Map.GetElevation(location, prefer_smallest) return 0 end

---Get richness for a tile or area.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getrichness)
---@param location Location Location to check
---@param prefer_smallest boolean? If checking more than a single tile, return the smallest value instead of the biggest (OPTIONAL, default false)
---@return integer # richness
function Map.GetRichness(location, prefer_smallest) return 0 end

---Get variation for a tile or area.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getvariation)
---@param location Location Location to check
---@param prefer_smallest boolean? If checking more than a single tile, return the smallest value instead of the biggest (OPTIONAL, default false)
---@return table # cell, distance
function Map.GetVariation(location, prefer_smallest) return {} end

---Get height for a tile or area.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getheight)
---@param location Location Location to check
---@param prefer_smallest boolean? If checking more than a single tile, return the smallest value instead of the biggest (OPTIONAL, default false)
---@return integer # height
function Map.GetHeight(location, prefer_smallest) return 0 end

---Get plateau height.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getplateauheight)
---@return integer # plateau height
function Map.GetPlateauHeight() return 0 end

---Get water height.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getwaterheight)
---@return integer # water height
function Map.GetWaterHeight() return 0 end

---Get table with full tile data for a given location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-gettiledata)
---@param x integer X coordinate
---@param y integer Y coordinate
---@return table # blightness, elevation, richness, variation
function Map.GetTileData(x, y) return {} end

---Defer function until after components have been processed.
--- For example, it is not possible to create new entities during processing, creation needs to be deferred.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-defer)
---@param callback function LUA function to execute after components have been processed
function Map.Defer(callback) end

---Delay function for a given number of ticks.
--- A delay function can be registered with
--- function Delay.FUNCTIONNAME(arg)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-delay)
---@param callback_name string Function name
---@param wait_ticks integer Number of ticks to wait until called (0 is like using Defer function)
---@param arguments table? Argument table to pass (OPTIONAL)
function Map.Delay(callback_name, wait_ticks, arguments) end

---Start terraforming.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-startterraforming)
---@param entity Entity Entity
---@param range integer Range
---@param change_per_tick integer Rate (change per tick)
---@return integer # Terraforming instance index
function Map.StartTerraforming(entity, range, change_per_tick) return 0 end

---End terraforming.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-stopterraforming)
---@param terraforming_instance integer Terraforming instance index
function Map.StopTerraforming(terraforming_instance) end

---Get an entity at a specific location.
--- If there are multiple entities, it will return the first entity in the following order: blocking, non-blocking, foundation
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getentityat)
---@param x integer X coordinate
---@param y integer Y coordinate
---@return Entity? # Entity (or nil if none)
function Map.GetEntityAt(x, y) return Entity end

---Get a foundation entity at a specific location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getfoundationentityat)
---@param x integer X coordinate
---@param y integer Y coordinate
---@return Entity? # Entity (or nil if none)
function Map.GetFoundationEntityAt(x, y) return Entity end

---Get all entities at a specific location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-getentitiesat)
---@param x integer X coordinate
---@param y integer Y coordinate
---@return table # Array of entities
function Map.GetEntitiesAt(x, y) return {} end

---Search for the closest entity in a range.
--- If an entity is used to specify the area, the callback will not be called for this entity
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-findclosestentity)
---@param x integer
---@param y integer
---@param search_radius integer Search radius in tiles
---@param frame_type FrameType? Filter by frame type (DroppedItem, Construction, Resource, Operating) (OPTIONAL, default all)
---@param callback function? Callback called for each entity in range in order of distance, return true from this to stop the search
---@return Entity? # The entity for which the callback returned true (or nil if none)
---@overload fun(x: integer, y: integer, search_radius: integer, callback: function?): Entity?
---@overload fun(x: integer, y: integer, x2: integer, y2: integer, search_radius: integer, frame_type: FrameType?, callback: function?): Entity?
---@overload fun(location: Location, search_radius: integer, frame_type: FrameType?, callback: function?): Entity?
---@overload fun(location: Location, search_radius: integer, callback: function?): Entity?
function Map.FindClosestEntity(x, y, search_radius, frame_type, callback) return Entity end

---Show a item throw effect.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#map-throwitemeffect)
---@param source_entity Entity Source entity
---@param target_entity Entity Target entity
---@param item_id itemId Item id
---@param entity_instance_number integer? Entity instance number (OPTIONAL)
function Map.ThrowItemEffect(source_entity, target_entity, item_id, entity_instance_number) end

