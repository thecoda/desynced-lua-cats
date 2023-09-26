---@meta Widget

---@class Widget
---A widget object represents a UI object that is part of a layout tree.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget)
---@field parent Widget Parent widget (or nil if none)
---@field root Widget Root widget (can be self if there is no parent)
---@field children table Array of child widgets
---@field child_count integer Number of child widgets
---@field has_children boolean True if there are any child widgets
---@field child_index integer Child index
---@field next_sibling Widget Next sibling (or nil if none)
---@field previous_sibling Widget Previous sibling (or nil if none)
---@field class table Class table (or nil if none)
---@field handle function Class table (or nil if none)
Widget = {}

function Widget:refresh() end

---Check if widget has not been removed yet.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-isvalid)
---@returns boolean # Valid state
function Widget:IsValid() return false end

---Add a widget to a panel widget.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-add)
---@param markup uiMarkup Layout text for creating a new widget inline
---@param properties table? Property table for the inline widget (OPTIONAL)
---@returns Widget # The added widget
---@overload fun(widget: Widget): Widget
function Widget:Add(markup, properties) return Widget end

---Set the content of a single-child panel widget.
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-setcontent)
---@param markup uiMarkup Layout text for creating a new widget inline
---@param properties table? Property table for the inline widget (OPTIONAL)
---@returns Widget # The set widget
---@overload fun(widget: Widget): Widget
function Widget:SetContent(markup, properties) return Widget end

---Clear all widgets in a panel widget.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-clear)
function Widget:Clear() end

---Get a child widget.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-getchild)
---@param child_index integer? Which child to get (OPTIONAL, default 1)
---@returns Widget # Child widget
function Widget:GetChild(child_index) return Widget end

---Clear and add multiple child widgets.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-setchildren)
---@param children Widget[] Array of widgets
function Widget:SetChildren(children) end

---Sort all child widgets.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-sortchildren)
---@param sort_callback function Sort predicate callback (will be called with two widgets to compare)
function Widget:SortChildren(sort_callback) end

---Remove a widget from its parent.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-removefromparent)
function Widget:RemoveFromParent() end

---Invoke an event function.
--- Similar to calling the function directly but will correctly pass the parent as self if invoking a function higher up the layout tree.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-sendevent)
---@param prop_name string Function property name
---@param params any? Passed values (OPTIONAL, can pass multiple values)
---@returns any # Return values of call
function Widget:SendEvent(prop_name, params) return 0 end

---Get the desired size of a widget.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-getdesiredsize)
---@returns integer, integer
function Widget:GetDesiredSize() return 0, 0 end

---Set the position of a widget placed a canvas panel widget.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-setposition)
---@param x integer X position
---@param y integer Y position
---@param z_order integer? Z order, widgets with higher values are drawn on top (OPTIONAL)
function Widget:SetPosition(x, y, z_order) end

---Gets the viewport relative position of the widget.
--- If a widget gets passed that hasn't had its layout calculated yet, the function will return nil
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-getviewportposition)
---@param relative_to Widget? Widget to get relative position to (OPTIONAL)
---@returns integer, integer
function Widget:GetViewportPosition(relative_to) return 0, 0 end

---Set this widget (and any children) to not interact with the mouse cursor (clicking or dragging over).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-setignorehittest)
---@param ignore_hit_test boolean? Ignore hit test  (OPTIONAL)
function Widget:SetIgnoreHitTest(ignore_hit_test) end

---Animate a numerical property
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-tweento)
---@param param_name string Parameter name
---@param target_value integer Target value
---@param duration_in_millis integer? Duration in milliseconds (OPTIONAL, default 400)
---@param wait_in_millis integer? Wait time in milliseconds (OPTIONAL, default 0)
---@param ease_function string? Easing function (OPTIONAL, default "InOutQuad")
---@param callback function? Animation finished callback (OPTIONAL)
function Widget:TweenTo(param_name, target_value, duration_in_millis, wait_in_millis, ease_function, callback) end

---Animate a numerical property
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-tweenfromto)
---@param param_name string Parameter name
---@param start_value integer Start value
---@param target_value integer Target value
---@param duration_in_millis integer? Duration in milliseconds (OPTIONAL, default 400)
---@param wait_in_millis integer? Wait time in milliseconds (OPTIONAL, default 0)
---@param ease_function string? Easing function (OPTIONAL, default "InOutQuad")
---@param callback function? Animation finished callback (OPTIONAL)
function Widget:TweenFromTo(param_name, start_value, target_value, duration_in_millis, wait_in_millis, ease_function, callback) end

---Stop an active tween
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-stoptween)
---@param param_name string Parameter name
---@returns boolean # True if a tween existed and was stopped
function Widget:StopTween(param_name) return false end

---Get the target value of an active tween
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-gettweentarget)
---@param param_name string Parameter name
---@returns integer? # Target value (or nil if not active tween)
function Widget:GetTweenTarget(param_name) return 0 end

---Find property in any widget above in the layout tree
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#widget-findabove)
---@param param_name string Parameter name
---@returns any # Parameter value if found
function Widget:FindAbove(param_name) return 0 end

