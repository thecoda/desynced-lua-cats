---@meta UI
---The UI module contains UI related functions
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#ui)
UI = {}

---Register a layout definition tag.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-register)
---@param tag_name string Layout tag name
---@param markup string Layout string
---@param class_table table? Class table (OPTIONAL)
---@param overwrite boolean? Set to true to overwrite an existing layout tag (OPTIONAL, default false)
function UI.Register(tag_name, markup, class_table, overwrite) end

---Check if a layout tag has been registered.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-isregistered)
---@param tag_name string Layout tag name
---@returns boolean # True if known layout tag
function UI.IsRegistered(tag_name) return false end

---Instantiate a new widgets.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-new)
---@param markup string Layout Text
---@param properties table? Property table (OPTIONAL)
---@returns Widget? # Created widget (or nil on error)
function UI.New(markup, properties) return Widget end

---Add widget to screen canvas.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-addlayout)
---@param widget Widget Widget
---@param ordering_priority integer? Ordering priority (OPTIONAL, default 0)
---@returns Widget # The widget passed in the first argument
function UI.AddLayout(widget, ordering_priority) return Widget end

---Add widget to screen canvas.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-addlayout)
---@param markup string Layout text for creating a new widget inline
---@param properties table? Property table for the inline widget (OPTIONAL)
---@param ordering_priority integer? Ordering priority (OPTIONAL, default 0)
---@returns Widget # The widget passed in the first argument
function UI.AddLayout(markup, properties, ordering_priority) return Widget end

---Instantiate the options widget of a mod.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-makemodoptionswidget)
---@param mod_id string Mod id
---@returns Widget? # Created widget (or nil on error)
function UI.MakeModOptionsWidget(mod_id) return Widget end

---Get the size of the screen scaled in UI coordinates.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-getscreensize)
---@returns integer[]
function UI.GetScreenSize() return 0 end

---Pop up a context menu or window.
--- If there isn't enough space in the direction it will flip to the other side
--- If there isn't enough space in the crosswise direction it will shift horizontally (if UP/DOWN) or vertically (if LEFT/RIGHT)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-menupopup)
---@param widget Widget Widget
---@param direction Direction? Direction (OPTIONAL, default DOWN or UP/LEFT/RIGHT)
---@param alignment Alignment? Alignment (OPTIONAL, default MIDDLE or LEFT/RIGHT/TOP/BOTTOM)
---@param next_to Widget? Pop up next to this widget (OPTIONAL, default pop up at mouse cursor)
---@param x_offset integer Attachment X offset
---@param y_offset integer Attachment Y offset
---@returns Widget # The widget passed in the first argument or that was created
function UI.MenuPopup(widget, direction, alignment, next_to, x_offset, y_offset) return Widget end

---Pop up a context menu or window
--- If there isn't enough space in the direction it will flip to the other side
--- If there isn't enough space in the crosswise direction it will shift horizontally (if UP/DOWN) or vertically (if LEFT/RIGHT)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-menupopup)
---@param markup string Layout text for creating a new widget inline
---@param properties table? Property table for the inline widget (OPTIONAL)
---@param direction Direction? Direction (OPTIONAL, default DOWN or UP/LEFT/RIGHT)
---@param alignment Alignment? Alignment (OPTIONAL, default MIDDLE or LEFT/RIGHT/TOP/BOTTOM)
---@param next_to Widget? Pop up next to this widget (OPTIONAL, default pop up at mouse cursor)
---@param x_offset integer Attachment X offset
---@param y_offset integer Attachment Y offset
---@returns Widget # The widget passed in the first argument or that was created
function UI.MenuPopup(markup, properties, direction, alignment, next_to, x_offset, y_offset) return Widget end

---Close the context menu opened with MenuPopup.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-closemenupopup)
---@param widget Widget? Close popup containing this widget (OPTIONAL, default close all popups)
---@returns boolean # If a popup was actually closed
function UI.CloseMenuPopup(widget) return false end

---Close the current tooltip.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-closetooltip)
function UI.CloseTooltip() end

---Refresh the current tooltip.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-refreshtooltip)
function UI.RefreshTooltip() end

---Play a UI sound effect, music, voice or ambience.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-playsound)
---@param effect_id string Effect ID
---@param vol_multiplier integer? Volume multiplier for sound effect (OPTIONAL, default 1)
---@param pitch_multiplier integer? Pitch multiplier for sound effect (OPTIONAL, default 1)
---@param start_time integer? Start time for sound effect (OPTIONAL, default 0)
function UI.PlaySound(effect_id, vol_multiplier, pitch_multiplier, start_time) end

---Stop the playing music.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-stopmusic)
function UI.StopMusic() end

---Stop the playing voice.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-stopvoice)
function UI.StopVoice() end

---Stop the playing ambience sound effect.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-stopambiencesound)
function UI.StopAmbienceSound() end

---Hide the entire UI.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-setuihidden)
---@param state boolean? UI hidden state (OPTIONAL, if not set will toggle)
---@returns boolean # UI hidden state
function UI.SetUIHidden(state) return false end

---Check if UI has been hidden with SetUIHidden.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-isuihidden)
---@returns boolean # UI hidden state
function UI.IsUIHidden() return false end

---Query the UI coordinate of an entity in the game camera view.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-entitylocationonscreen)
---@param p1 Entity Input entity
---@param p2 boolean|nil Only return success if the position is on screen (or less than 100 points away from the screen border) (OPTIONAL, default false)
---@returns integer # Screen position Y.
function UI.EntityLocationOnScreen(p1, p2) return 0 end

---Run code in UI context or call bound UIMsg functions.
--- When called from simulation context the function will execute for all connected players (to limit to specific players use `faction:RunUI` or `Action.RunUI`)
--- When called from UI context the function will only execute for the local player
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-run)
---@param lua_func function LUA function to execute in UI context
---@param params any? Passed values (OPTIONAL, can pass multiple values)
function UI.Run(lua_func, params) end

---Run code in UI context or call bound UIMsg functions.
--- When called from simulation context the function will execute for all connected players (to limit to specific players use `faction:RunUI` or `Action.RunUI`)
--- When called from UI context the function will only execute for the local player
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-run)
---@param msg_name string Message name registered in UIMsg
---@param params any? Passed values (OPTIONAL, can pass multiple values)
function UI.Run(msg_name, params) end

---Get a table of languages.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-getlanguages)
---@returns table # languages (pairs of 'code' = 'name')
function UI.GetLanguages() return {} end

---Get the current language code.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-getlanguagecode)
---@returns string # language code (for example 'en_us')
function UI.GetLanguageCode() return "" end

---Change the active language.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-setlanguagecode)
---@param language_code string language code (for example 'en_us')
function UI.SetLanguageCode(language_code) end

---Get the UI scale factor.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-getscale)
---@returns integer # scale factor (1.0 being 100%)
function UI.GetScale() return 0 end

---Set the UI scale factor.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-setscale)
---@param p1 integer scale factor (1.0 being 100%)
function UI.SetScale(p1) end

---Gets position of mouse cursor.
--- If a widget gets passed that hasn't had its layout calculated yet, the function will return nil
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-getmouseposition)
---@param widget Widget? Widget to get relative position to (OPTIONAL)
---@returns integer # y position of mouse cursor
function UI.GetMousePosition(widget) return 0 end

---Check if the mouse cursor is over a UI widget.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#ui-ismouseoverui)
---@returns boolean # True if mouse is over UI
function UI.IsMouseOverUI() return false end

