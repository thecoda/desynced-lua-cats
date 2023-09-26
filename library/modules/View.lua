---@meta View
--- The view module contains global functions that don't affect the state of the simulation but aren't directly related to UI
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view)
View = {}

---Get the location of the currently hovered tile.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-gethoveredtileposition)
---@returns integer # Y factor of the virtual cursor
function View.GetHoveredTilePosition() return 0 end

---Get the entity currently hovered.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-gethoveredentity)
---@returns Entity|nil # Hovered entity (or nil if none)
function View.GetHoveredEntity() return Entity end

---Reset the camera to the faction home location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-resetcamera)
---@param also_reset_zoom boolean? Whether to reset zoom level (OPTIONAL, default true)
function View.ResetCamera(also_reset_zoom) end

---Move the camera to a given location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-movecamera)
---@param x integer X position
---@param y integer Y position
---@param also_reset_zoom boolean? Whether to reset zoom level (OPTIONAL, default true)
function View.MoveCamera(x, y, also_reset_zoom) end

---Focus the camera on one or more entities.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-jumpcameratoentities)
---@param entities Entity[] List of entities to focus on
function View.JumpCameraToEntities(entities) end

---Focus the camera on one or more entities.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-jumpcameratoentities)
---@param entity Entity Entities to focus on (argument can be repeated)
function View.JumpCameraToEntities(entity) end

---Get Local camera zoom distance.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-getcamerazoom)
---@returns integer # Camera zoom distance
function View.GetCameraZoom() return 0 end

---Sets the entity for the camera to follow.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-followentity)
---@param entity Entity Entity to follow
function View.FollowEntity(entity) end

---Get the entity currently followed by the camera.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-getfollowentity)
---@returns Entity|nil # Followed entity (or nil if there is none)
function View.GetFollowEntity() return Entity end

---Show movement paths of selected entities.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-showentitypaths)
---@param state boolean Set to show or hide
function View.ShowEntityPaths(state) end

---Show lines to store entities of all entities on screen.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-showentitystores)
---@param state boolean Set to show or hide
function View.ShowEntityStores(state) end

---Get the currently selected entities.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-getselectedentities)
---@returns Entity[]|nil # List of selected entities (or nil if empty)
function View.GetSelectedEntities() return {} end

---Get the currently selected entity (will be just the first if multiple are selected).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-getselectedentity)
---@returns Entity? # Selected entity (or nil if empty)
function View.GetSelectedEntity() return Entity end

---Check if an entity is selected.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-isselectedentity)
---@returns Entity # Entity to check
function View.IsSelectedEntity() return Entity end

---Set the selected entity(s).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-selectentities)
---@param entities Entity[]|nil List of entities to select
function View.SelectEntities(entities) end

---Set the selected entity(s).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-selectentities)
---@param entities Entity|Entity[] Entities to select (argument can be repeated)
function View.SelectEntities(entities) end

---Highlight an entity.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-highlightentity)
---@param entity Entity? Entity to highlight (or nil to remove highlight)
function View.HighlightEntity(entity) end

---Switch to a cursor mode to select a location on the map.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-startcursorchooselocation)
---@param confirm_func function LUA function called when confirming a location with the location as the argument
---@param callback function? LUA function called when placing aborting the cursor mode (OPTIONAL)
function View.StartCursorChooseLocation(confirm_func, callback) end

---Switch to a cursor mode to select an entity on the map.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-startcursorchooseentity)
---@param confirm_func function LUA function called when confirming an entity with the entity as the argument
---@param callback function|nil LUA function called when aborting the cursor mode (OPTIONAL)
function View.StartCursorChooseEntity(confirm_func, callback) end

---Show entity construction location selection on map.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-startcursorconstruction)
---@param frame_id frameId Frame id
---@param visual_id visualId? Specific visual id or another frame id from which to use the visual (OPTIONAL, defaults to frame visual)
---@param rotation Rotation? Rotation (0 to 3) (OPTIONAL, otherwise remembers last used rotation)
---@param fn_confirm_placement function? LUA function called when confirming placement with arguments (location, rotation, is_valid) location will be an array if multiple constructions are enabled (OPTIONAL)
---@param fn_abort_cursor function? LUA function called when aborting the cursor mode (OPTIONAL)
---@param fn_check_placement function? LUA function called to check placement with arguments (x, y, rotation, is_visible, can_place, is_powered, size_x, size_y) (OPTIONAL)
---@param allow_multiple boolean? Set to true to allow placing multiple constructions via dragging (OPTIONAL, default false)
---@overload fun(frame_id: frameId, visual_id: visualId?, fn_confirm_placement: function?, fn_abort_cursor: function?, fn_check_placement: function?, allow_multiple: boolean?)
---@overload fun(frame_id: frameId, fn_confirm_placement: function?, fn_abort_cursor: function?, fn_check_placement: function?, allow_multiple: boolean?)
function View.StartCursorConstruction(
    frame_id,
    visual_id,
    rotation,
    fn_confirm_placement,
    fn_abort_cursor,
    fn_check_placement,
    allow_multiple
) end

---Cancel cursor mode started with the functions above.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-stopcursor)
function View.StopCursor() end

---RotateConstructionSite.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-rotateconstructionsite)
---@param clockwise boolean? Clockwise (OPTIONAL, default false)
function View.RotateConstructionSite(clockwise) end

---Set a fullscreen effect parameter.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-setpostprocess)
---@param effect_name string Effect name
---@param effect_value number|RGBA Effect value (numerical or color value)
function View.SetPostProcess(effect_name, effect_value) end

---Play effect at a location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-playeffect)
---@param effect_id effectId effect id
---@param x integer Tile Location X
---@param y integer Tile Location Y
---@param hide_from_other_factions boolean? Set to true to not show the effect outside the local player factions visibility (OPTIONAL)
---@returns integer # Effect instance (can be used with `View.StopEffect`)
function View.PlayEffect(effect_id, x, y, hide_from_other_factions) return 0 end

---Play effect at a location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-playeffect)
---@param effect_id effectId effect id
---@param entity Entity entity to play it on
---@param socket_name string? Socket name (OPTIONAL)
---@param target_entity Entity? Target entity (OPTIONAL)
---@param entity_instance integer? Entity instance number (OPTIONAL)
---@param params table? Particle effect parameter table (OPTIONAL)
---@returns integer # Effect instance (can be used with `View.StopEffect`)
function View.PlayEffect(effect_id, entity, socket_name, target_entity, entity_instance, params) return 0 end

---Set a parameter on an effect started with `View.PlayEffect`.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-seteffectparam)
---@param effect_instance integer Effect instance
---@param param_name string Parameter name
---@param param_value any Parameter value (numerical or color value)
function View.SetEffectParam(effect_instance, param_name, param_value) end

---Stop an effect started with `View.PlayEffect`
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-stopeffect)
---@param effect_instance integer Effect instance
function View.StopEffect(effect_instance) end

---Checks if the player is currently in construction mode.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-inconstructionmode)
---@returns boolean # Is in construction mode
function View.InConstructionMode() return false end

---Get all entities currently on screen.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-getvisibleentities)
---@param only_injured boolean? Set to true to only get entities with health not at the maximum (OPTIONAL, default false)
---@returns table # One array with 4 or 6 elements for each entity (entity, X, Y, distance, health/max_health if true was passed)
function View.GetVisibleEntities(only_injured) return {} end

---Set the full 3D camera position and target location directly.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-setcamera3dposition)
---@param camera_pos table|nil A table with x, y and z camera position (or nil if only setting the target location)
---@param look_at_pos table|nil A table with x, y and z target location (or nil if only setting the camera position)
function View.SetCamera3DPosition(camera_pos, look_at_pos) end

---Get the 3D camera position and target location.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-getcamera3dposition)
---@returns integer # Distance from camera position to target location
function View.GetCamera3DPosition() return 0 end

---Directly shift the camera in 3D space (relative to the current camera rotation).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-pancamera3dposition)
---@param fore_aft integer Forward/backward move amount
---@param left_right integer Right/left move amount
---@param up_down integer Up/down move amount
function View.PanCamera3DPosition(fore_aft, left_right, up_down) end

---Directly rotate the camera in place.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-tiltcamera3drotation)
---@param yaw integer Yaw amount in degrees (how much to rotate around the Z axis)
---@param pitch integer Pitch amount in degrees (how much to rotate up and down)
function View.TiltCamera3DRotation(yaw, pitch) end

---Fully lock the camera in its current state until `UnlockCamera` is called.
--- Direct modification of the camera with `SetCamera3DPosition`, `PanCamera3DPosition` or `TiltCamera3DRotation` is available even while locked.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-lockcamera)
function View.LockCamera() end

---Unlock the camera again after having `LockCamera` called.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#view-unlockcamera)
function View.UnlockCamera() end

