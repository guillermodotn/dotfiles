local M = {}

local palette = nil

local function get_palette()
	if palette == nil then
		palette = require("gilded.palette")
	end
	return palette
end

function M.parse_color(color)
	local p = get_palette()
	if p[color] ~= nil then
		return p[color]
	end
	local config = require("gilded.config")
	local groups = config.options.groups
	if groups[color] ~= nil then
		return M.parse_color(groups[color])
	end
	return color
end

-- Blend two hex colors: color over background at given opacity (0-1)
function M.blend(color, background, alpha)
	local function hex_to_rgb(hex)
		hex = hex:gsub("#", "")
		return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
	end
	local r1, g1, b1 = hex_to_rgb(color)
	local r2, g2, b2 = hex_to_rgb(background)
	local r = math.floor(r1 * alpha + r2 * (1 - alpha) + 0.5)
	local g = math.floor(g1 * alpha + g2 * (1 - alpha) + 0.5)
	local b = math.floor(b1 * alpha + b2 * (1 - alpha) + 0.5)
	return string.format("#%02x%02x%02x", r, g, b)
end

return M
