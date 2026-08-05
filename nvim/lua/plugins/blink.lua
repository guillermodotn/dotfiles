-- Autocompletion popup (LSP completions, path completions, signature help)
return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		"folke/lazydev.nvim",
	},
	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {
		keymap = {
			-- 'default' (recommended) for mappings similar to built-in completions
			--   <c-y> to accept ([y]es) the completion.
			--    This will auto-import if your LSP supports it.
			--    This will expand snippets if the LSP sent a snippet.
			-- 'super-tab' for tab to accept
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- For an understanding of why the 'default' preset is recommended,
			-- you will need to read `:help ins-completion`
			--
			-- All presets have the following mappings:
			-- <tab>/<s-tab>: move to right/left of your snippet expansion
			-- <c-space>: Open menu or open docs if already open
			-- <c-n>/<c-p> or <up>/<down>: Select next/previous item
			-- <c-e>: Hide menu
			-- <c-k>: Toggle signature help
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			preset = "default",
		},

		appearance = {
			-- Use Nerd Font icons if available, otherwise use text kind labels
			use_nvim_cmp_as_default = not vim.g.have_nerd_font,
			nerd_font_variant = vim.g.have_nerd_font and "mono" or "normal",
			kind_icons = not vim.g.have_nerd_font and {
				Text = "txt",
				Method = "mth",
				Function = "fn",
				Constructor = "new",
				Field = ".f",
				Variable = "var",
				Class = "cls",
				Interface = "if",
				Module = "mod",
				Property = ".p",
				Unit = "u",
				Value = "val",
				Enum = "enm",
				Keyword = "kw",
				Snippet = "snp",
				Color = "clr",
				File = "fil",
				Reference = "ref",
				Folder = "dir",
				EnumMember = "em",
				Constant = "con",
				Struct = "st",
				Event = "ev",
				Operator = "op",
				TypeParameter = "tp",
			} or nil,
		},

		completion = {
			-- By default, you may press `<c-space>` to show the documentation.
			-- Optionally, set `auto_show = true` to show the documentation after a delay.
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},

		sources = {
			default = { "lsp", "path", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},

		-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
		-- which automatically downloads a prebuilt binary when enabled.
		--
		-- By default, we use the Lua implementation instead, but you may enable
		-- the rust implementation via `'prefer_rust_with_warning'`
		--
		-- See :h blink-cmp-config-fuzzy for more information
		fuzzy = { implementation = "lua" },

		-- Shows a signature help window while you type arguments for a function
		signature = { enabled = true },
	},
}
