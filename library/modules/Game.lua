---@meta Game
---The game module contains global functions.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game)
Game = {}

---Start a new game.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-newgame)
---@param game_settings table? New game settings (scenario, seed) (OPTIONAL)
---@param disable_replay boolean? If replay recording is to be disabled (OPTIONAL, default false)
---@param session_settings table? Session settings when starting a multiplayer server (OPTIONAL, default nil)
function Game.NewGame(game_settings, disable_replay, session_settings) end

---Restart the current scenario with the same game settings.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-restartgame)
function Game.RestartGame() end

---End the current game and return to the main menu.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-endgame)
function Game.EndGame() end

---Quit the game to desktop
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-quitgame)
function Game.QuitGame() end

---Pauses the game (is only effective while playing without multiplayer).
--- If called multiple times with true, needs to be called equal amounts with false.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-offlinepause)
---@param state boolean Pause state
function Game.OfflinePause(state) end

---Get a loaded mod package.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getmodpackage)
---@param mod_package_path string Mod package path ("Mod/Package")
---@returns ModPackage? # Module package (or nil on error)
function Game.GetModPackage(mod_package_path) return ModPackage end

---Get all currently active mod packages.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getmodpackages)
---@returns table # Table of all active mod packages
function Game.GetModPackages() return {} end

---Get the mod package of the currently running scenario.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getscenariomodpackage)
---@returns ModPackage? # Module package (or nil on error)
function Game.GetScenarioModPackage() return ModPackage end

---Get meta data of all installed mods.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getinstalledmods)
---@returns table # Array of tables with mod meta data
function Game.GetInstalledMods() return {} end

---Get meta data of all packages from an installed mod.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getinstalledmodpackages)
---@param mod_id string Mod id
---@returns table # Array of tables with package meta data
function Game.GetInstalledModPackages(mod_id) return {} end

---Get meta data of one package and its mod.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getinstalledmodpackage)
---@param mod_package_path string Mod package path ("Mod/Package")
---@returns table? # Array of tables with mod meta data (or nil if package doesn't exist)
function Game.GetInstalledModPackage(mod_package_path) return {} end

---Set a mods enabled state.
--- Will be applied when the next map starts.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-setmodenabled)
---@param mod_id string Mod id
---@param state boolean Mod enable state
---@returns string? # Name of missing dependency if mod could not be enabled (or nil if all dependencies of at least one package are available)
function Game.SetModEnabled(mod_id, state) return "" end

---Refresh the list of installed mods and call mod change callbacks.
--- UIOnModAdded with parameters id, name for newly added mods
--- UIOnModRemoved with parameters id, name for removed mods
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-refreshinstalledmods)
function Game.RefreshInstalledMods() end

---Get the name of the mod management system of this platform.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getnativemodmanagername)
---@returns string? # System name (or nil if none available)
function Game.GetNativeModManagerName() return "" end

---Open the native the mod management system of this platform (if available).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-opennativemodmanager)
function Game.OpenNativeModManager() end

---Get command line arguments.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getcommandlinearguments)
---@returns string # Command line arguments
function Game.GetCommandLineArguments() return "" end

---Save save game.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-savegame)
---@param title string Save title
---@param slot_name string? Slot name (OPTIONAL, pass nil to save into a new slot)
---@returns string? # Written slot name (or nil if save operation failed)
function Game.SaveGame(title, slot_name) return "" end

---Load save game.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-loadgame)
---@param slot_name string Slot name
---@param session_settings table? Session settings when starting a multiplayer server (OPTIONAL, default nil)
---@param reset_mods boolean? Reset mods to the currently active ones (OPTIONAL, default false)
function Game.LoadGame(slot_name, session_settings, reset_mods) end

---Play save game replay.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-replaygame)
---@param slot_name string Slot name
function Game.ReplayGame(slot_name) end

---Delete save game.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-deletegame)
---@param slot_name string Slot name
---@returns boolean # Result
function Game.DeleteGame(slot_name) return false end

---Rename save game.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#game-renamegame)
---@param slot_name string Slot name
---@param new_title string New save title
---@returns string? # Written slot name (or nil if rename operation failed)
function Game.RenameGame(slot_name, new_title) return "" end

---Get the list of all save games.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getsavegamelist)
---@returns table # Save game list table
function Game.GetSaveGameList() return {} end

---Get list of mod packages that were in use when the save game was created.
--- Besides the basic fields (id, name, mod_id, mod_name, mod_version_code) the info table can contain the following flags:
--- - is_scenario: Set on the package that is the scenario
--- - error_missing: Set if the mod or package is now missing
--- - error_dependencies: Set if the mod now has missing dependencies
--- - error_version: Set if the save was made with a newer mod version than installed
--- - now_disabled: Set if the save was made with an addon that is now disabled or has any of the errors above
--- - now_enabled: Set if the save was made with an addon that has since been enabled
--- The tables in the resulting array can optionally have error flags 'error_missing' or 'error_version' set.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getsavegamemodpackages)
---@returns table # Array of mod package info tables
function Game.GetSaveGameModPackages() return {} end

---Get if any save game exists.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-haveanysavegame)
---@returns boolean # True if any save game exists
function Game.HaveAnySaveGame() return false end

---Get auto save time setting.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getautosavetime)
---@returns integer # Auto save minutes (or 0 if disabled)
function Game.GetAutoSaveTime() return 0 end

---Set auto save time setting.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#game-setautosavetime)
---@param time_in_mins integer Auto save minutes (or 0 to disable)
function Game.SetAutoSaveTime(time_in_mins) end

---Get lock mouse option.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getmouselock)
---@returns boolean # Option
function Game.GetMouseLock() return false end

---Set lock mouse option.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-setmouselock)
---@param state boolean Option
function Game.SetMouseLock(state) end

---Get edge scrolling option.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getedgescrolling)
---@returns boolean # Option
function Game.GetEdgeScrolling() return false end

---Set edge scrolling option.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-setedgescrolling)
---@param state boolean Option
function Game.SetEdgeScrolling(state) end

---Get scroll speed setting.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getscrollspeed)
---@returns integer # Speed
function Game.GetScrollSpeed() return 0 end

---Set scroll speed setting.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-setscrollspeed)
---@param speed integer Speed
function Game.SetScrollSpeed(speed) end

---Get the play time.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getgameduration)
---@returns integer # Total number of seconds of play time
function Game.GetGameDuration() return 0 end

---Get the time that passed since the map was last saved.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-gettimesincesave)
---@returns integer # Seconds since the map was last saved
function Game.GetTimeSinceSave() return 0 end

---Get the game version.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getversionstring)
---@returns string # Game version
function Game.GetVersionString() return "" end

---Get the local player faction.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getlocalplayerfaction)
---@returns Faction|string|nil # Local player faction (or nil if there is none)
function Game.GetLocalPlayerFaction() return Faction|string end

---Get the local player extra data.
--- If called without argument from a mod other than 'Main', will return a mod specific child table parent.mods[mod_id]
--- If called with an empty string or nil, will always return entire parent table
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getlocalplayerextra)
---@param mod_id string? Mod id (OPTIONAL)
---@returns table # Local player extra data table
function Game.GetLocalPlayerExtra(mod_id) return {} end

---Get the local profile table.
--- If called without argument from a mod other than 'Main', will return a mod specific child table parent.mods[mod_id]
--- If called with an empty string or nil, will always return entire parent table
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getprofile)
---@param mod_id string? Mod id (OPTIONAL)
---@returns table # Profile table
function Game.GetProfile(mod_id) return {} end

---Change the color mapping mode.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-setcolormapping)
---@param mode string Mode
function Game.SetColorMapping(mode) end

---Convert a color according to the color mapping.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getmappedcolor)
---@param color RGBA Input color
---@returns RGBA # Mapped color
function Game.GetMappedColor(color) return RGBA end

---Create an online session.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-createonlinesession)
---@param session_settings table Session settings
---@param callback function LUA function callback when complete (with 1 argument boolean success)
function Game.CreateOnlineSession(session_settings, callback) end

---Create an online session.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-findonlinesessions)
---@param callback function LUA function callback when complete (with 2 arguments boolean success and table session list)
---@param lan_only boolean? True to search for servers on LAN, false to search lobbies on online service if available (OPTIONAL, default false)
function Game.FindOnlineSessions(callback, lan_only) end

---Join an online session.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-joinonlinesession)
---@param session_number integer? Session number (in result list of FindOnlineSessions) to join. You can pass 0 or nil to join the most recent invited session.
---@param password string? Server password (OPTIONAL)
---@param callback function? LUA function callback when complete (with 1 argument boolean success) (OPTIONAL)
function Game.JoinOnlineSession(session_number, password, callback) end

---Join an online session.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-joinonlinesession)
---@param hostname string? Server hostname (with optional :port suffix) to join with direct IP connection
---@param password string? Server password (OPTIONAL)
---@param callback function? LUA function callback when complete (with 1 argument boolean success) (OPTIONAL)
function Game.JoinOnlineSession(hostname, password, callback) end

---End online session (stop server or go back to title on client).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-endonlinesession)
function Game.EndOnlineSession() end

---Returns if online lobbies are available and sessions can be created with visibility PUBLIC/FRIENDS/INVITE.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#game-onlinehavelobbies)
---@returns boolean # Availability
function Game.OnlineHaveLobbies() return false end

---Returns if friend inviting is available.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-caninvitefriend)
---@returns boolean # Availability (true if available on platform and currently in a multiplayer session)
function Game.CanInviteFriend() return false end

---Show the friend invite UI to invite them to the current session.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-showfriendinviteui)
function Game.ShowFriendInviteUI() end

---Get the current network mode.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getnetmode)
---@returns NetMode # Mode string ('offline', 'server' or 'client')
function Game.GetNetMode() return "offline" end

---Get a table of all connected multiplayer players.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getallplayers)
---@returns table # Player list
function Game.GetAllPlayers() return {} end

---Get a connected player by id.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getplayerbyid)
---@param player_id integer Player id
---@returns table # Player details
function Game.GetPlayerById(player_id) return {} end

---Get player details of the local player.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getlocalplayer)
---@returns table # Player details
function Game.GetLocalPlayer() return {} end

---Get the name of a connected player.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getplayername)
---@param player_id integer? Player id (OPTIONAL, defaults to local player)
---@returns string # Player name
function Game.GetPlayerName(player_id) return "" end

---Check if a given player id belongs to the host player.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-ishostplayer)
---@param player_id integer? Player id (OPTIONAL, defaults to local player)
---@returns boolean # True if player is the host player
function Game.IsHostPlayer(player_id) return false end

---Check if a given player id belongs to the local player.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-islocalplayer)
---@param player_id integer Player id
---@returns boolean # True if player is the local player
function Game.IsLocalPlayer(player_id) return false end

---Kick a player from the server (only available to the host of a locally running session).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-kickplayer)
---@param player_id integer Player id
---@param ban_until_restart boolean? True to ban the player until the game on the server is restarted (OPTIONAL, default false)
function Game.KickPlayer(player_id, ban_until_restart) end

---Get the number of connected players.
--- Will be 1 in single player, and 0 on a dedicated server without anyone connected
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getplayercount)
---@returns integer # Player count
function Game.GetPlayerCount() return 0 end

---Get the maximum number of multiplayer players (or 1 if offline).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getmaxplayercount)
---@returns integer # Max player count
function Game.GetMaxPlayerCount() return 0 end

---Get the visibility of the current multiplayer session.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getsessionvisibility)
---@returns string? # Visibility (PUBLIC, FRIENDS, INVITE, LAN or nil if there is no session)
function Game.GetSessionVisibility() return "" end

---Get the session settings used to start hosting the session. Only the host can use this.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-gethostsessionsettings)
---@returns table? # Session settings table (or nil if not hosting a session)
function Game.GetHostSessionSettings() return {} end

---Get which player has a given entity selected.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getentityselectedplayerid)
---@param entity Entity Entity to check
---@returns table? # List of player ids (or nil if none)
function Game.GetEntitySelectedPlayerId(entity) return {} end

---Get the display fullscreen mode.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getfullscreenmode)
---@returns WindowMode # Mode ('windowed', 'borderless', 'fullscreen')
function Game.GetFullscreenMode() return "" end

---Change the display fullscreen mode.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-setfullscreenmode)
---@param p1 string Mode ('windowed', 'borderless', 'fullscreen')
function Game.SetFullscreenMode(p1) end

---Get active screen resolution.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getscreenresolution)
---@returns integer, integer 
function Game.GetScreenResolution() return 0,0 end

---Set screen resolution.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-setscreenresolution)
---@returns integer, integer 
function Game.SetScreenResolution() return 0,0 end

---Get a list screen resolutions appropriate for the current fullscreen mode.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getscreenresolutions)
---@returns table # Resolution list
function Game.GetScreenResolutions() return {} end

---Apply resolution and fullscreen mode settings.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-applyscreenmoderequired)
---@returns boolean # True if a followup call to ConfirmScreenMode or RevertScreenMode is needed
function Game.ApplyScreenModeRequired() return false end

---Apply resolution and fullscreen mode settings.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-applyscreenmodeneedconfirm)
---@returns boolean # True if a followup call to ConfirmScreenMode or RevertScreenMode is needed
function Game.ApplyScreenModeNeedConfirm() return false end

---Confirm changed resolution and fullscreen mode settings.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-confirmscreenmode)
function Game.ConfirmScreenMode() end

---Revert resolution and fullscreen mode to last confirmed settings.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-revertscreenmode)
function Game.RevertScreenMode() end

---Read video settings table.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getvideosettings)
---@returns VideoSettings # Settings table
function Game.GetVideoSettings() return {} end

---Modify video settings.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-setvideosettings)
---@param settings VideoSettings # Table with settings that are to be changed
function Game.SetVideoSettings(settings) end

---Starts or stops power saving if power save mode has been enabled.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-powersavingsection)
---@param state boolean State
function Game.PowerSavingSection(state) end

---Get the volume of a mix type.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getvolume)
---@param volume_type VolumeType Volume type ('master', 'effect', 'music', 'voice', 'ui')
---@returns integer # Volume percentage (100 means full volume)
function Game.GetVolume(volume_type) return 0 end

---Set the volume of a mix type.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-setvolume)
---@param volume_type VolumeType Volume type ('master', 'effect', 'music', 'voice', 'ui')
---@param percentage integer Volume percentage (100 means full volume)
function Game.SetVolume(volume_type, percentage) end

---Load the news text from the online source.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-getnewstext)
---@param callback function LUA function callback when complete (with one string argument containing the text)
function Game.GetNewsText(callback) end

---Open Website to a special URL.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#game-openwebsite)
---@param site_name OpenableSite Site name (one of "STORE", "DISCORD")
function Game.OpenWebsite(site_name) end

---Open OS file browser to a special folder.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#game-explorefolder)
---@param folder_name OpenableFolder Special folder name (one of "SAVEGAMES", "LOGS", "MODS")
function Game.ExploreFolder(folder_name) end

---Send feedback to the developers
---
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#game-sendfeedback)
---@param rating integer Feedback rating
---@param category string Feedback category
---@param text string Feedback text
---@param include_save_state boolean Attach save state
---@param include_screenshot boolean Attach captured feedback screenshot
---@param callback function LUA function callback when complete (with one boolean argument containing success state)
function Game.SendFeedback(rating, category, text, include_save_state, include_screenshot, callback) end

