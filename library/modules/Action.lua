---@meta Action
---The action module contains functions that send (player input) actions.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#action)
Action = {}


---Send an action from the local player faction.
---@param action_id actionId Action id
---@param additional_data table? Additional action data (can be nil)
function Action.SendForLocalFaction(action_id, additional_data) end

---Send an action for an entity owned by the local player faction.
--- An entity action can be registered with
--- function EntityAction.ACTIONID(entity, arg)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-sendforentity)
---@param action_id actionId Action id
---@param entity Entity Entity the action is for (must be owned by the local player)
---@param additional_data table? Additional action data (can be nil)
function Action.SendForEntity(action_id, entity, additional_data) end

---Send a grouped entity action for all selected entities.
--- Will automatically filter out construction sites and entities not owned by the local player faction
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-sendforselectedentities)
---@param action_id actionId Action id
---@param additional_data table? Additional action data (can be nil)
function Action.SendForSelectedEntities(action_id, additional_data) end

---Send a grouped entity action for a list of entities.
---Will automatically filter out construction sites and entities not owned by the local player faction
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#action-sendforentities)
---@param action_id actionId Action id
---@param entities Entity[] Array of entities the action is for
---@param additional_data table? Additional action data (can be nil)
function Action.SendForEntities(action_id, entities, additional_data) end

---Send an action for a construction entity owned by the local player faction.
--- A construction action can be registered with
--- function ConstructionAction.ACTIONID(entity, arg)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-sendforconstruction)
---@param action_id actionId Action id
---@param entity Entity Entity the action is for (must be under construction and owned by the local player)
---@param additional_data table? Additional action data (can be nil)
function Action.SendForConstruction(action_id, entity, additional_data) end

---Send an action from the player.
--- A player action can be registered with
--- function PlayerAction.ACTIONID(player_id, faction, arg)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-sendfromplayer)
---@param action_id actionId Action id
---@param additional_data table? Additional action data (can be nil)
function Action.SendFromPlayer(action_id, additional_data) end

---Run code in UI context for the player that initiated the currently executing action.
--- Must be called while executing an action and will execute for the one player that sent the action (to limit to other players use `faction:RunUI` or `UI.Run`)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-runui)
---@param func function LUA function to execute in UI context
---@param params any? Passed values (OPTIONAL, can pass multiple values)
function Action.RunUI(func, params) end

---Run code in UI context for the player that initiated the currently executing action. 
--- Must be called while executing an action and will execute for the one player that sent the action (to limit to other players use `faction:RunUI` or `UI.Run`)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-runui)
---@param msg_name string Message name registered in UIMsg
---@param params any? Passed values (OPTIONAL, can pass multiple values)
function Action.RunUI(msg_name, params) end

---Change the players faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-switchfaction)
---@param new_faction_id string New faction id
function Action.SwitchFaction(new_faction_id) end

---Set player ready during the startup of a scenario using DelayedPlayerFactionSpawn mode.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-setplayerready)
---@param value boolean? Ready state (OPTIONAL, default true)
function Action.SetPlayerReady(value) end

---Returns if a replay is being played back.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-isreplayplayback)
---@return boolean # Replay state
function Action.IsReplayPlayback() return false end

---Returns the playback progress of the replay.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-getreplayprogress)
---@param days_not_ticks boolean? Return the time in in-game days instead of ticks (OPTIONAL, default false)
---@return integer # Ticks or days since replay start
function Action.GetReplayProgress(days_not_ticks) return 0 end

---Returns the total duration of the replay.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-getreplayduration)
---@param days_not_ticks boolean? Return the time in in-game days instead of ticks (OPTIONAL, default false)
---@return integer # Duration in ticks or days
function Action.GetReplayDuration(days_not_ticks) return 0 end

---Set replay playback speed.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-setreplayspeed)
---@param speed integer Replay speed
function Action.SetReplaySpeed(speed) end

---Restart replay.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-restartreplay)
function Action.RestartReplay() end

---While playing a replay, stop the replay and continue playing from here.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#action-replayplayfromhere)
function Action.ReplayPlayFromHere() end

