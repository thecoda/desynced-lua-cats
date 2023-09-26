---@class Point
---@field x integer
---@field y integer
Point = {}

---@class Point3D
---@field x integer
---@field y integer
---@field z integer
Point = {}

---@class RGB
---@field R integer
---@field G integer
---@field B integer
RGB = {}

---@class RGBA
---@field R integer
---@field G integer
---@field B integer
---@field A integer
RGBA = {}

---@class TechCategory
---@field name string
---@field discovery_tech string
---@field initial_tech string
---@field sub_categories string[]
---@field texture string
TechCategory = {}

---@class Tech
---@field name string
---@field texture string
---@field desc string
---@field uplink_recipe any
---@field progress_count number
---@field require_tech string[]
---@field unlocks string[]
---@field category string
Tech = {}

---@class Visual
---@field mesh string
---@field flags string?
---@field materials string[]
---@field tile_size {[1]: number, [2]: number}
---@field placement string
---@field sockets table<string, string>
---@field scale Point
---@field place_effect string
---@field move_effect string
---@field destroy_effect string
---@field tile_pattern number[]
---@field hole_pattern number[]
---@field frame_class string
---@field bob_speed number
---@field light_radius integer
---@field light_color RGBA
---@field light_offset Point
---@field animation_speed number
---@field specular_scale number
---@field cull_ratio number
---@field minimap_color RGBA
---@field stencil integer
---@field sort_order integer
---@field mesh_offset Point
Visual = {}

---@class VideoSettings
---@field vsync boolean VSync enabled state
---@field frame_rate_limit number Frame rate limit (0 means unlimited)
---@field power_save_mode boolean Power Save Mode enabled state
---@field hdr_output boolean HDR output state
---@field overall_quality number Overall video quality level (0 - 3)
---@field resolution_percentage number resolution scale percentage
---@field view_distance_quality number View distance quality (0 - 3)
---@field fog_grid_size number Volumetric fog grid pixel size (4 - 32, lower is better)
---@field shadow_quality number Shadow quality (0 = disabled, 3 = max)
---@field anti_alias_quality number Anti-aliasing quality (0 = disabled, 3 = max)
---@field bloom_quality number Bloom quality (0 = disabled, 5 = max)
---@field depth_of_field_quality number Depth of field quality level (0 = disabled, 4 = max)
---@field depth_of_field_strength number Depth of field strength
VideoSettings = {}

---@alias techId string
---@alias actionId string
---@alias factionId string
---@alias frameId string
---@alias visualId string
---@alias itemId string
---@alias effectId string
---@alias textureId string
---@alias componentId string
---@alias registerId string
---@alias valueId string
---@alias uiMarkup string

---@alias ConstructionRecipe {ingredients: table<string, integer>, ticks: integer}
---@alias ProductionRecipe {ingredients: table<string, integer>, producers:  table<string, integer>, amount: integer}
---@alias MiningRecipe table<string, integer>

---@alias hexLuminance string "#XX"
---@alias hexLuminanceAlpha string "#XXXX"
---@alias hexRgb string "#XXXXXX"
---@alias hexRgba string "#XXXXXXXX"
---@alias ue4Color string "R=1.0, G=1.0, B=1.0, A=1.0"
---@alias colorName string from data.colors
---@alias rgbArray {[1]: integer, [2]: integer, [3]: integer}
---@alias rgbaArray {[1]: integer, [2]: integer, [3]: integer, [4]: integer}
---@alias color hexLuminance|hexLuminanceAlpha|hexRgb|hexRgba|ue4Color|colorName|rgbArray|rgbaArray
