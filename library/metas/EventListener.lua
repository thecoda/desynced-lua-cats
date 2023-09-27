---@meta EventListener
---A global event listener used for various APIs
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#eventlistener)

EventListener = {}

---Bind a function to this listener, usually done with a function assignment like.
--- function LISTENER.FUNCTIONNAME(arg1, arg2) ... end
--- Only use this if you want to explicitly unbind the function later.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#eventlistener-bind)
---@param name string Function name
---@param callback function Callback function
function EventListener:Bind(name, callback) end

---Unbind a specific function from this listener.
--- Depending on the type of this listener unbinding functions might not be supported.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#eventlistener-unbind)
---@param name string Function name
---@param callback function Callback function
function EventListener:Unbind(name, callback) end

---Unbind all functions bound to a given name.
--- Depending on the type of this listener unbinding functions might not be supported.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#eventlistener-unbindall)
---@param name string Function name
function EventListener:UnbindAll(name) end

