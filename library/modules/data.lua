---@meta data

---@class style
---@field size integer
---@field outline_size integer
style = {}

---@class Data
---@field styles table<string, style>
---@field frames table<string, Frame>
---@field components table<componentId, Component>
---@field items table<string, ItemDef>
---@field visuals table<visualId, Visual>
---@field all table<string, any>

data = {}