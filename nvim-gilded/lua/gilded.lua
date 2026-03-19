local M = {}
local config = require("gilded.config")

local function set_highlights()
	local utilities = require("gilded.utilities")
	local palette = require("gilded.palette")
	local styles = config.options.styles

	local groups = {}
	for group, color in pairs(config.options.groups) do
		groups[group] = utilities.parse_color(color)
	end

	local function make_border(fg)
		fg = fg or groups.border
		return {
			fg = fg,
			bg = (config.options.extend_background_behind_borders and not styles.transparency) and palette.surface
				or "NONE",
		}
	end

	local highlights = {}

	local legacy_highlights = {
		["@attribute.diff"]  = { fg = palette.gold },
		["@boolean"]         = { link = "Boolean" },
		["@class"]           = { fg = palette.sapphire },
		["@conditional"]     = { link = "Conditional" },
		["@field"]           = { fg = palette.silver },
		["@include"]         = { link = "Include" },
		["@interface"]       = { fg = palette.sapphire },
		["@macro"]           = { link = "Macro" },
		["@method"]          = { fg = palette.gold },
		["@namespace"]       = { link = "Include" },
		["@number"]          = { link = "Number" },
		["@parameter"]       = { fg = palette.jade, italic = styles.italic },
		["@preproc"]         = { link = "PreProc" },
		["@punctuation"]     = { fg = palette.subtle },
		["@punctuation.bracket"]   = { link = "@punctuation" },
		["@punctuation.delimiter"] = { link = "@punctuation" },
		["@punctuation.special"]   = { link = "@punctuation" },
		["@regexp"]          = { link = "String" },
		["@repeat"]          = { link = "Repeat" },
		["@storageclass"]    = { link = "StorageClass" },
		["@symbol"]          = { link = "Identifier" },
		["@text"]            = { fg = palette.text },
		["@text.danger"]     = { fg = groups.error },
		["@text.diff.add"]   = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		["@text.diff.delete"]= { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		["@text.emphasis"]   = { italic = styles.italic },
		["@text.note"]       = { link = "SpecialComment" },
		["@text.strike"]     = { strikethrough = true },
		["@text.strong"]     = { bold = styles.bold },
		["@text.title"]      = { link = "Title" },
		["@text.underline"]  = { underline = true },
		["@text.uri"]        = { fg = groups.link },
		["@text.warning"]    = { fg = groups.warn },
		["@todo"]            = { link = "Todo" },
		IndentBlanklineChar               = { fg = palette.muted, nocombine = true },
		IndentBlanklineSpaceChar          = { fg = palette.muted, nocombine = true },
		IndentBlanklineSpaceCharBlankline = { fg = palette.muted, nocombine = true },
	}

	local default_highlights = {
		ColorColumn    = { bg = palette.surface },
		Conceal        = { bg = "NONE" },
		CurSearch      = { fg = palette.base, bg = palette.champagne },
		Cursor         = { fg = palette.text, bg = palette.highlight_high },
		CursorColumn   = { bg = palette.overlay },
		CursorLine     = { bg = palette.overlay },
		CursorLineNr   = { fg = palette.champagne, bold = styles.bold },
		DiffAdd        = { bg = groups.git_add, blend = 20 },
		DiffChange     = { bg = groups.git_change, blend = 20 },
		DiffDelete     = { bg = groups.git_delete, blend = 20 },
		DiffText       = { bg = groups.git_text, blend = 40 },
		diffAdded      = { link = "DiffAdd" },
		diffChanged    = { link = "DiffChange" },
		diffRemoved    = { link = "DiffDelete" },
		Directory      = { fg = palette.gold, bold = styles.bold },
		ErrorMsg       = { fg = groups.error, bold = styles.bold },
		FloatBorder    = make_border(),
		FloatTitle     = { fg = palette.gold, bg = groups.panel, bold = styles.bold },
		FoldColumn     = { fg = palette.muted },
		Folded         = { fg = palette.text, bg = groups.panel },
		IncSearch      = { link = "CurSearch" },
		LineNr         = { fg = palette.muted },
		MatchParen     = { fg = palette.champagne, bg = palette.champagne, blend = 25 },
		ModeMsg        = { fg = palette.subtle },
		MoreMsg        = { fg = palette.jade },
		NonText        = { fg = palette.muted },
		Normal         = { fg = palette.text, bg = palette.base },
		NormalFloat    = { bg = groups.panel },
		NormalNC       = { fg = palette.text, bg = config.options.dim_inactive_windows and palette._nc or palette.base },
		Pmenu          = { fg = palette.subtle, bg = groups.panel },
		PmenuExtra     = { fg = palette.muted, bg = groups.panel },
		PmenuExtraSel  = { fg = palette.subtle, bg = palette.overlay },
		PmenuKind      = { fg = palette.gold, bg = groups.panel },
		PmenuKindSel   = { fg = palette.subtle, bg = palette.overlay },
		PmenuSbar      = { bg = groups.panel },
		PmenuSel       = { fg = palette.text, bg = palette.overlay },
		PmenuThumb     = { bg = palette.muted },
		Question       = { fg = palette.champagne },
		QuickFixLine   = { fg = palette.gold },
		Search         = { fg = palette.text, bg = palette.gold, blend = 20 },
		SignColumn     = { fg = palette.text, bg = "NONE" },
		SpecialKey     = { fg = palette.gold },
		SpellBad       = { sp = palette.subtle, undercurl = true },
		SpellCap       = { sp = palette.subtle, undercurl = true },
		SpellLocal     = { sp = palette.subtle, undercurl = true },
		SpellRare      = { sp = palette.subtle, undercurl = true },
		StatusLine     = { fg = palette.subtle, bg = groups.panel },
		StatusLineNC   = { fg = palette.muted, bg = groups.panel, blend = 60 },
		StatusLineTerm = { fg = palette.base, bg = palette.jade },
		StatusLineTermNC = { fg = palette.base, bg = palette.jade, blend = 60 },
		Substitute     = { link = "IncSearch" },
		TabLine        = { fg = palette.subtle, bg = groups.panel },
		TabLineFill    = { bg = groups.panel },
		TabLineSel     = { fg = palette.text, bg = palette.overlay, bold = styles.bold },
		Title          = { fg = palette.gold, bold = styles.bold },
		VertSplit      = { fg = groups.border },
		Visual         = { bg = palette.gold, blend = 15 },
		WarningMsg     = { fg = groups.warn, bold = styles.bold },
		WildMenu       = { link = "IncSearch" },
		WinBar         = { fg = palette.subtle, bg = groups.panel },
		WinBarNC       = { fg = palette.muted, bg = groups.panel, blend = 60 },
		WinSeparator   = { fg = groups.border },

		DiagnosticError           = { fg = groups.error },
		DiagnosticHint            = { fg = groups.hint },
		DiagnosticInfo            = { fg = groups.info },
		DiagnosticOk              = { fg = groups.ok },
		DiagnosticWarn            = { fg = groups.warn },
		DiagnosticDefaultError    = { link = "DiagnosticError" },
		DiagnosticDefaultHint     = { link = "DiagnosticHint" },
		DiagnosticDefaultInfo     = { link = "DiagnosticInfo" },
		DiagnosticDefaultOk       = { link = "DiagnosticOk" },
		DiagnosticDefaultWarn     = { link = "DiagnosticWarn" },
		DiagnosticFloatingError   = { link = "DiagnosticError" },
		DiagnosticFloatingHint    = { link = "DiagnosticHint" },
		DiagnosticFloatingInfo    = { link = "DiagnosticInfo" },
		DiagnosticFloatingOk      = { link = "DiagnosticOk" },
		DiagnosticFloatingWarn    = { link = "DiagnosticWarn" },
		DiagnosticSignError       = { link = "DiagnosticError" },
		DiagnosticSignHint        = { link = "DiagnosticHint" },
		DiagnosticSignInfo        = { link = "DiagnosticInfo" },
		DiagnosticSignOk          = { link = "DiagnosticOk" },
		DiagnosticSignWarn        = { link = "DiagnosticWarn" },
		DiagnosticUnderlineError  = { sp = groups.error, undercurl = true },
		DiagnosticUnderlineHint   = { sp = groups.hint, undercurl = true },
		DiagnosticUnderlineInfo   = { sp = groups.info, undercurl = true },
		DiagnosticUnderlineOk     = { sp = groups.ok, undercurl = true },
		DiagnosticUnderlineWarn   = { sp = groups.warn, undercurl = true },
		DiagnosticVirtualTextError = { fg = groups.error, bg = groups.error, blend = 10 },
		DiagnosticVirtualTextHint  = { fg = groups.hint, bg = groups.hint, blend = 10 },
		DiagnosticVirtualTextInfo  = { fg = groups.info, bg = groups.info, blend = 10 },
		DiagnosticVirtualTextOk    = { fg = groups.ok, bg = groups.ok, blend = 10 },
		DiagnosticVirtualTextWarn  = { fg = groups.warn, bg = groups.warn, blend = 10 },

		Boolean      = { fg = palette.blush },
		Character    = { fg = palette.silver },
		Comment      = { fg = palette.subtle, italic = styles.italic },
		Conditional  = { fg = palette.champagne },
		Constant     = { fg = palette.blush },
		Debug        = { fg = palette.crimson },
		Define       = { fg = palette.jade },
		Delimiter    = { fg = palette.subtle },
		Error        = { fg = palette.crimson },
		Exception    = { fg = palette.champagne },
		Float        = { fg = palette.blush },
		Function     = { fg = palette.gold },
		Identifier   = { fg = palette.text },
		Include      = { fg = palette.champagne },
		Keyword      = { fg = palette.champagne },
		Label        = { fg = palette.jade },
		LspCodeLens  = { fg = palette.subtle },
		LspCodeLensSeparator = { fg = palette.muted },
		LspInlayHint = { fg = palette.muted, bg = palette.muted, blend = 10 },
		LspReferenceRead  = { bg = palette.highlight_med },
		LspReferenceText  = { bg = palette.highlight_med },
		LspReferenceWrite = { bg = palette.highlight_med },
		Macro        = { fg = palette.jade },
		Number       = { fg = palette.blush },
		Operator     = { fg = palette.subtle },
		PreCondit    = { fg = palette.jade },
		PreProc      = { link = "PreCondit" },
		Repeat       = { fg = palette.champagne },
		Special      = { fg = palette.champagne },
		SpecialChar  = { link = "Special" },
		SpecialComment = { fg = palette.jade },
		Statement    = { fg = palette.champagne, bold = styles.bold },
		StorageClass = { fg = palette.sapphire },
		String       = { fg = palette.jade },
		Structure    = { fg = palette.sapphire },
		Tag          = { fg = palette.gold },
		Todo         = { fg = palette.champagne, bg = palette.champagne, blend = 20 },
		Type         = { fg = palette.sapphire },
		TypeDef      = { link = "Type" },
		Underlined   = { fg = palette.blush, underline = true },

		htmlArg      = { fg = palette.jade },
		htmlBold     = { bold = styles.bold },
		htmlEndTag   = { fg = palette.subtle },
		htmlItalic   = { italic = styles.italic },
		htmlTag      = { fg = palette.subtle },
		htmlTagN     = { fg = palette.text },
		htmlTagName  = { fg = palette.champagne },

		markdownDelimiter = { fg = palette.subtle },
		markdownH1        = { fg = groups.h1, bold = styles.bold },
		markdownH1Delimiter = { link = "markdownH1" },
		markdownH2        = { fg = groups.h2, bold = styles.bold },
		markdownH2Delimiter = { link = "markdownH2" },
		markdownH3        = { fg = groups.h3, bold = styles.bold },
		markdownH3Delimiter = { link = "markdownH3" },
		markdownH4        = { fg = groups.h4, bold = styles.bold },
		markdownH4Delimiter = { link = "markdownH4" },
		markdownH5        = { fg = groups.h5, bold = styles.bold },
		markdownH5Delimiter = { link = "markdownH5" },
		markdownH6        = { fg = groups.h6, bold = styles.bold },
		markdownH6Delimiter = { link = "markdownH6" },
		markdownLinkText  = { link = "markdownUrl" },
		markdownUrl       = { fg = groups.link, sp = groups.link, underline = true },

		["@variable"]                   = { fg = palette.text, italic = styles.italic },
		["@variable.builtin"]           = { fg = palette.crimson, italic = styles.italic, bold = styles.bold },
		["@variable.parameter"]         = { fg = palette.jade, italic = styles.italic },
		["@variable.parameter.builtin"] = { fg = palette.jade, italic = styles.italic, bold = styles.bold },
		["@variable.member"]            = { fg = palette.silver },

		["@constant"]         = { fg = palette.blush },
		["@constant.builtin"] = { fg = palette.blush, bold = styles.bold },
		["@constant.macro"]   = { fg = palette.blush },

		["@module"]         = { fg = palette.text },
		["@module.builtin"] = { fg = palette.text, bold = styles.bold },
		["@label"]          = { link = "Label" },

		["@string"]                = { link = "String" },
		["@string.regexp"]         = { fg = palette.jade },
		["@string.escape"]         = { fg = palette.blush },
		["@string.special"]        = { link = "String" },
		["@string.special.symbol"] = { link = "Identifier" },
		["@string.special.url"]    = { fg = groups.link },

		["@character"]         = { link = "Character" },
		["@character.special"] = { link = "Character" },

		["@boolean"]      = { link = "Boolean" },
		["@number"]       = { link = "Number" },
		["@number.float"] = { link = "Number" },
		["@float"]        = { link = "Number" },

		["@type"]         = { fg = palette.sapphire },
		["@type.builtin"] = { fg = palette.sapphire, bold = styles.bold },

		["@attribute"]         = { fg = palette.jade },
		["@attribute.builtin"] = { fg = palette.jade, bold = styles.bold },
		["@property"]          = { fg = palette.silver, italic = styles.italic },

		["@function"]             = { fg = palette.gold },
		["@function.builtin"]     = { fg = palette.gold, bold = styles.bold },
		["@function.macro"]       = { link = "Function" },
		["@function.method"]      = { fg = palette.gold },
		["@function.method.call"] = { fg = palette.gold },

		["@constructor"] = { fg = palette.gold },
		["@operator"]    = { link = "Operator" },

		["@keyword"]                     = { link = "Keyword" },
		["@keyword.operator"]            = { fg = palette.subtle },
		["@keyword.import"]              = { fg = palette.champagne },
		["@keyword.storage"]             = { fg = palette.sapphire },
		["@keyword.repeat"]              = { fg = palette.champagne },
		["@keyword.return"]              = { fg = palette.blush },
		["@keyword.debug"]               = { fg = palette.blush },
		["@keyword.exception"]           = { fg = palette.champagne },
		["@keyword.conditional"]         = { fg = palette.champagne },
		["@keyword.conditional.ternary"] = { fg = palette.champagne },
		["@keyword.directive"]           = { fg = palette.jade },
		["@keyword.directive.define"]    = { fg = palette.jade },

		["@punctuation.delimiter"] = { fg = palette.subtle },
		["@punctuation.bracket"]   = { fg = palette.subtle },
		["@punctuation.special"]   = { fg = palette.subtle },

		["@comment"]         = { link = "Comment" },
		["@comment.error"]   = { fg = groups.error },
		["@comment.warning"] = { fg = groups.warn },
		["@comment.todo"]    = { fg = groups.todo, bg = groups.todo, blend = 15 },
		["@comment.hint"]    = { fg = groups.hint, bg = groups.hint, blend = 15 },
		["@comment.info"]    = { fg = groups.info, bg = groups.info, blend = 15 },
		["@comment.note"]    = { fg = groups.note, bg = groups.note, blend = 15 },

		["@markup.strong"]        = { bold = styles.bold },
		["@markup.italic"]        = { italic = styles.italic },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"]     = { underline = true },
		["@markup.heading"]       = { fg = palette.gold, bold = styles.bold },
		["@markup.quote"]         = { fg = palette.text },
		["@markup.link.url"]      = { fg = groups.link },
		["@markup.list"]          = { fg = palette.gold },
		["@markup.list.checked"]   = { fg = palette.jade, bg = palette.jade, blend = 10 },
		["@markup.list.unchecked"] = { fg = palette.text },
		["@markup.heading.1.markdown"] = { link = "markdownH1" },
		["@markup.heading.2.markdown"] = { link = "markdownH2" },
		["@markup.heading.3.markdown"] = { link = "markdownH3" },
		["@markup.heading.4.markdown"] = { link = "markdownH4" },
		["@markup.heading.5.markdown"] = { link = "markdownH5" },
		["@markup.heading.6.markdown"] = { link = "markdownH6" },

		["@diff.plus"]  = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		["@diff.minus"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		["@diff.delta"] = { bg = groups.git_change, blend = 20 },

		["@tag"]           = { link = "Tag" },
		["@tag.attribute"] = { fg = palette.jade },
		["@tag.delimiter"] = { fg = palette.subtle },

		["@lsp.type.comment"]          = {},
		["@lsp.type.enum"]             = { link = "@type" },
		["@lsp.type.keyword"]          = { link = "@keyword" },
		["@lsp.type.namespace"]        = { link = "@module" },
		["@lsp.type.namespace.python"] = { link = "@variable" },
		["@lsp.type.parameter"]        = { link = "@variable.parameter" },
		["@lsp.type.property"]         = { link = "@property" },
		["@lsp.type.variable"]         = {},
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"]       = { link = "@operator" },
		["@lsp.typemod.string.injected"]         = { link = "@string" },
		["@lsp.typemod.variable.constant"]       = { link = "@constant" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"]       = { link = "@variable" },

		-- GitSigns
		GitSignsAdd    = { fg = groups.git_add, bg = "NONE" },
		GitSignsChange = { fg = groups.git_change, bg = "NONE" },
		GitSignsDelete = { fg = groups.git_delete, bg = "NONE" },

		-- Telescope
		TelescopeBorder       = make_border(),
		TelescopeMatching     = { fg = palette.gold },
		TelescopeNormal       = { link = "NormalFloat" },
		TelescopePromptNormal = { link = "TelescopeNormal" },
		TelescopePromptPrefix = { fg = palette.subtle },
		TelescopeSelection    = { fg = palette.text, bg = palette.overlay },
		TelescopeSelectionCaret = { fg = palette.champagne, bg = palette.overlay },
		TelescopeTitle        = { fg = palette.champagne, bold = styles.bold },

		-- WhichKey
		WhichKey          = { fg = palette.jade },
		WhichKeyBorder    = make_border(),
		WhichKeyDesc      = { fg = palette.champagne },
		WhichKeyFloat     = { bg = groups.panel },
		WhichKeyGroup     = { fg = palette.gold },
		WhichKeyNormal    = { link = "NormalFloat" },
		WhichKeySeparator = { fg = palette.subtle },
		WhichKeyTitle     = { link = "FloatTitle" },
		WhichKeyValue     = { fg = palette.blush },

		-- indent-blankline
		IblIndent     = { fg = palette.overlay },
		IblScope      = { fg = palette.gold },
		IblWhitespace = { fg = palette.overlay },

		-- nvim-cmp
		CmpItemAbbr           = { fg = palette.subtle },
		CmpItemAbbrDeprecated = { fg = palette.subtle, strikethrough = true },
		CmpItemAbbrMatch      = { fg = palette.text, bold = styles.bold },
		CmpItemAbbrMatchFuzzy = { fg = palette.text, bold = styles.bold },
		CmpItemKind           = { fg = palette.subtle },
		CmpItemKindClass      = { link = "StorageClass" },
		CmpItemKindFunction   = { link = "Function" },
		CmpItemKindInterface  = { link = "Type" },
		CmpItemKindMethod     = { link = "PreProc" },
		CmpItemKindSnippet    = { link = "String" },
		CmpItemKindVariable   = { link = "Identifier" },
	}

	local transparency_highlights = {
		FloatBorder  = { fg = palette.muted, bg = "NONE" },
		FloatTitle   = { fg = palette.gold, bg = "NONE", bold = styles.bold },
		Folded       = { fg = palette.text, bg = "NONE" },
		NormalFloat  = { bg = "NONE" },
		Normal       = { fg = palette.text, bg = "NONE" },
		NormalNC     = { fg = palette.text, bg = config.options.dim_inactive_windows and palette._nc or "NONE" },
		Pmenu        = { fg = palette.subtle, bg = "NONE" },
		PmenuKind    = { fg = palette.gold, bg = "NONE" },
		SignColumn   = { fg = palette.text, bg = "NONE" },
		StatusLine   = { fg = palette.subtle, bg = "NONE" },
		StatusLineNC = { fg = palette.muted, bg = "NONE" },
		TabLine      = { bg = "NONE", fg = palette.subtle },
		TabLineFill  = { bg = "NONE" },
		TabLineSel   = { fg = palette.text, bg = "NONE", bold = styles.bold },
		TelescopeNormal       = { fg = palette.subtle, bg = "NONE" },
		TelescopePromptNormal = { fg = palette.text, bg = "NONE" },
		TelescopeSelection    = { fg = palette.text, bg = "NONE", bold = styles.bold },
		TelescopeSelectionCaret = { fg = palette.gold },
		IblIndent     = { fg = palette.overlay, bg = "NONE" },
		IblScope      = { fg = palette.gold, bg = "NONE" },
		IblWhitespace = { fg = palette.overlay, bg = "NONE" },
		WhichKeyFloat  = { bg = "NONE" },
		WhichKeyNormal = { bg = "NONE" },
	}

	if config.options.enable.legacy_highlights then
		for group, highlight in pairs(legacy_highlights) do
			highlights[group] = highlight
		end
	end
	for group, highlight in pairs(default_highlights) do
		highlights[group] = highlight
	end
	if styles.transparency then
		for group, highlight in pairs(transparency_highlights) do
			highlights[group] = highlight
		end
	end

	if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
		for group, highlight in pairs(config.options.highlight_groups) do
			local existing = highlights[group] or {}
			while existing.link ~= nil do
				existing = highlights[existing.link] or {}
			end
			local parsed = vim.tbl_extend("force", {}, highlight)
			if highlight.fg ~= nil then parsed.fg = utilities.parse_color(highlight.fg) or highlight.fg end
			if highlight.bg ~= nil then parsed.bg = utilities.parse_color(highlight.bg) or highlight.bg end
			if highlight.sp ~= nil then parsed.sp = utilities.parse_color(highlight.sp) or highlight.sp end
			if (highlight.inherit == nil or highlight.inherit) and existing ~= nil then
				parsed.inherit = nil
				highlights[group] = vim.tbl_extend("force", existing, parsed)
			else
				parsed.inherit = nil
				highlights[group] = parsed
			end
		end
	end

	for group, highlight in pairs(highlights) do
		if config.options.before_highlight ~= nil then
			config.options.before_highlight(group, highlight, palette)
		end
		if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
			highlight.bg = utilities.blend(highlight.bg, highlight.blend_on or palette.base, highlight.blend / 100)
		end
		highlight.blend = nil
		highlight.blend_on = nil
		vim.api.nvim_set_hl(0, group, highlight)
	end

	if config.options.enable.terminal then
		vim.g.terminal_color_0  = palette.overlay     -- black
		vim.g.terminal_color_8  = palette.subtle       -- bright black
		vim.g.terminal_color_1  = palette.crimson      -- red
		vim.g.terminal_color_9  = palette.crimson      -- bright red
		vim.g.terminal_color_2  = palette.jade         -- green
		vim.g.terminal_color_10 = palette.jade         -- bright green
		vim.g.terminal_color_3  = palette.gold         -- yellow
		vim.g.terminal_color_11 = palette.gold         -- bright yellow
		vim.g.terminal_color_4  = palette.sapphire     -- blue
		vim.g.terminal_color_12 = palette.sapphire     -- bright blue
		vim.g.terminal_color_5  = palette.blush        -- magenta
		vim.g.terminal_color_13 = palette.blush        -- bright magenta
		vim.g.terminal_color_6  = palette.champagne    -- cyan (orange stand-in)
		vim.g.terminal_color_14 = palette.champagne    -- bright cyan
		vim.g.terminal_color_7  = palette.text         -- white
		vim.g.terminal_color_15 = palette.text         -- bright white

		local group = vim.api.nvim_create_augroup("gilded", { clear = true })
		vim.api.nvim_create_autocmd("ColorSchemePre", {
			group = group,
			callback = function()
				vim.api.nvim_del_augroup_by_name("gilded")
			end,
		})
	end
end

function M.colorscheme(variant)
	config.extend_options({ variant = variant })
	vim.opt.termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "gilded"
	vim.o.background = "dark"
	set_highlights()
end

function M.setup(options)
	config.extend_options(options or {})
end

return M
