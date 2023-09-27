---@meta data

---@class style
---@field size integer
---@field outline_size integer
style = {}

---@class StabilityDef
---@field amount integer
---@field min integer?
---@field max integer?
stabilityDef = {}

---@class Data
---@field styles table<string, style>
---@field frames table<string, Frame>
---@field components table<componentId, Component>
---@field items table<string, ItemDef>
---@field visuals table<visualId, Visual>
---@field stability table<string, StabilityDef>
---@field all table<string, any>
data = {}