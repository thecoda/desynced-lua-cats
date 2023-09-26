---@meta Input
---The Input module contains Input functions
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#input)
Input = {}

---Check if the shift key is pressed (either left or right shift key).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-isshiftdown)
---@returns boolean # Key state
function Input.IsShiftDown() return false end

---Check if the control key is pressed (either left or right control key).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-iscontroldown)
---@returns boolean # Key state
function Input.IsControlDown() return false end

---Check if the alt key is pressed (either left or right alt key).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-isaltdown)
---@returns boolean # Key state
function Input.IsAltDown() return false end

---Check if a specific key is pressed.
--- This does not work while a modal UI view is open
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-iskeydown)
---@param key_name string Key name
---@returns boolean # Key pressed state
function Input.IsKeyDown(key_name) return false end

---Bind a callback function to a named input action.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-bindaction)
---@param action_name string Action name
---@param key_event KeyEvent Key event (one of 'Pressed', 'Released', 'Repeat', 'DoubleClick', 'Axis')
---@param callback function Lua Function
---@returns integer # Binding handle (for use with RemoveActionBinding)
function Input.BindAction(action_name, key_event, callback) return 0 end

---Bind a callback function to a named input action.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-bindaction)
---@param action_name string Action name
---@param key_event KeyEvent Key event (one of 'Pressed', 'Released', 'Repeat', 'DoubleClick', 'Axis')
---@param callback_name string Built in game function name
---@returns integer # Binding handle (for use with RemoveActionBinding)
function Input.BindAction(action_name, key_event, callback_name) return 0 end

---Bind a callback function to a named input axis.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-bindaxis)
---@param axis_name string Axis name
---@param callback function Lua Function
function Input.BindAxis(axis_name, callback) end

---Bind a callback function to a named input axis.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#input-bindaxis)
---@param axis_name string Axis name
---@param callback_name string Built in game function name
function Input.BindAxis(axis_name, callback_name) end

---Remove bound callback functions from a named input action.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-removeactionbinding)
---@param action_name string Action name
---@param action_handle integer? Action handle (OPTIONAL, return value of BindAction, clear all if not passed)
function Input.RemoveActionBinding(action_name, action_handle) end

---Remove all bound callback functions from a named input axis.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-removeaxisbinding)
---@param axis_name string Axis name
function Input.RemoveAxisBinding(axis_name) end

---Map a physical input key to a named input action.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#input-addactionmapping)
---@param action_name string Action name
---@param key_name string Key name
---@param options table? Options (OPTIONAL, default none)
function Input.AddActionMapping(action_name, key_name, options) end

---Map a physical input key to a named input axis.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-addaxismapping)
---@param axis_name string Axis name
---@param key_name string Key name
---@param scale integer? Scale (OPTIONAL, default 1.0)
function Input.AddAxisMapping(axis_name, key_name, scale) end

---Remove previously mapped physical inputs from a named input action
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#input-removeactionmapping)
---@param action_name string Action name
---@param key_name string? Key name (OPTIONAL, remove all if not given)
function Input.RemoveActionMapping(action_name, key_name) end

---Remove previously mapped physical inputs from a named input axis.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#input-removeaxismapping)
---@param axis_name string Axis name
---@param key_name string? Key name (OPTIONAL, remove all if not given)
function Input.RemoveAxisMapping(axis_name, key_name) end

---Get a table with all key names.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#input-getbindingnames)
---@returns table # Table with key ids and localized key names
function Input.GetBindingNames() return {} end

---Set custom input processor which can pre-process all input events.
--- If the passed lua function returns boolean true the event will be forwarded to the games regular input handling
--- is_down is relevant for button events (keyboard, mouse buttons, gamepad buttons)
--- axis is a numerical value for analog inputs (gamepad analog inputs, mouse screen position)
--- mouse_delta is a numerical value of the change for mouse inputs (mouse position, mouse wheel)
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#input-setinputprocessor)
---@param processor_func function Lua function called with arguments (key_name, is_down, axis, mouse_delta)
---@param ignore_dead_zone boolean? Pass true to not apply dead zone scaling to analog gampead inputs (OPTIONAL, default false)
---@param permit_repeats boolean? Pass true to not filter out periodical repeat button press events (OPTIONAL, default false)
function Input.SetInputProcessor(processor_func, ignore_dead_zone, permit_repeats) end

---Clear the active custom input processor
---
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#input-clearinputprocessor)
function Input.ClearInputProcessor() end

