local options = require("gilded.config").options

local variants = {
	main = {
		_nc        = "#120f0d",
		base       = "#19160f",
		surface    = "#201c14",
		overlay    = "#28241a",
		muted      = "#3a362a",
		faint      = "#504c3e",
		subtle     = "#706858",
		text       = "#f0e8d8",
		silver     = "#c8be9c",
		gold       = "#c8a038",
		champagne  = "#e8782a",
		bronze     = "#c06428",
		jade       = "#28b870",
		crimson    = "#d02848",
		sapphire   = "#4888d8",
		blush      = "#d07888",
		highlight_low  = "#201c14",
		highlight_med  = "#302c20",
		highlight_high = "#403c2e",
		none = "NONE",
	},
	light = {
		_nc        = "#faf4e8",
		base       = "#f2e8d4",
		surface    = "#ece0c8",
		overlay    = "#e0d4b8",
		muted      = "#c8b888",
		faint      = "#b0a07a",
		subtle     = "#988870",
		text       = "#19160f",
		silver     = "#5a5040",
		gold       = "#8c6c08",
		champagne  = "#c05010",
		bronze     = "#904010",
		jade       = "#188048",
		crimson    = "#a81028",
		sapphire   = "#1848a8",
		blush      = "#a04860",
		highlight_low  = "#e4d8c0",
		highlight_med  = "#d4c8a8",
		highlight_high = "#c4b898",
		none = "NONE",
	},
}

if options.palette ~= nil and next(options.palette) then
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return variants[options.dark_variant or "main"]
