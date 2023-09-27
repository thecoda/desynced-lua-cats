---@meta Tool
---The tool module contains utility functions
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#tool)
Tool = {}

---Create a checksum of a value.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#tool-hash)
---@param value any Value (can be a table or of any other type)
---@return integer # Checksum
function Tool.Hash(value) return 0 end

---Convert a lua table to a string.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#tool-tabletostring)
---@param value table Table
---@param identifier_char string A one character identifier to be included in the prefix of the encoded string
---@return string # Encoded string
function Tool.TableToString(value, identifier_char) return "" end

---Convert a string back to a lua table.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#tool-stringtotable)
---@param encoded_string string Encoded string
---@param identifier_char string? A one character identifier to be included in the prefix of the encoded string
---@return table # Table
function Tool.StringToTable(encoded_string, identifier_char) return {} end

---Store a LUA table into the OS clipboard.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#tool-setclipboard)
---@param value table Table to set the clipboard to
---@param identifier_char string? A one character identifier to be included in the prefix of the encoded string
function Tool.SetClipboard(value, identifier_char) end

---Retrieve a LUA table from the OS clipboard.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#tool-getclipboard)
---@param identifier_char string A one character identifier to be included in the prefix of the encoded string
---@return table # Clipboard table content
function Tool.GetClipboard(identifier_char) return {} end

---Format a date and time value as a string.
--- Will use current time if no timestamp gets passed.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#tool-getdatestr)
---@param format_string string? Date format (OPTIONAL, defaults to "%Y.%m.%d-%H.%M.%S")
---@return string # Formatted date/time string
function Tool.GetDateStr(format_string) return "" end

---Format a date and time value as a string.
--- Will use current time if no timestamp gets passed.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#tool-getdatestr)
---@param unix_timestamp integer Unix timestamp
---@param format_string string? Date format (OPTIONAL, defaults to "%Y.%m.%d-%H.%M.%S")
---@return string # Formatted date/time string
function Tool.GetDateStr(unix_timestamp, format_string) return "" end

---Format a time duration to a string (HH:MM:SS).
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#tool-gettimedurationstr)
---@param seconds integer Seconds
---@return string # Formatted time duration string
function Tool.GetTimeDurationStr(seconds) return "" end

---Create an empty register object.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#tool-newregisterobject)
---@param source_table table? Copy contents from a table (OPTIONAL)
---@return Register # New register object
function Tool.NewRegisterObject(source_table) return Register end

---Create an empty register object.
--- [Official Documentation](https://modding.desyncedgame.com/syntax.html#tool-newregisterobject)
---@param source_register Register? Copy contents from another register (OPTIONAL)
---@return Register # New register object
function Tool.NewRegisterObject(source_register) return Register end

