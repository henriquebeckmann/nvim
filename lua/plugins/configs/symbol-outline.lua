vim.g.symbols_outline = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = false,
	position = "right",
	width = 50,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = " ", hl = "CmpItemKindFile" },
		Module = { icon = " ", hl = "CmpItemKindModule" },
		Namespace = { icon = " ", hl = "CmpItemKindModule" },
		Package = { icon = " ", hl = "CmpItemKindModule" },
		Class = { icon = " ", hl = "CmpItemKindClass" },
		Method = { icon = " ", hl = "CmpItemKindMethod" },
		Property = { icon = " ", hl = "CmpItemKindProperty" },
		Field = { icon = " ", hl = "CmpItemKindField" },
		Constructor = { icon = " ", hl = "CmpItemKindConstructor" },
		Enum = { icon = " ", hl = "CmpItemKindEnum" },
		Interface = { icon = " ", hl = "CmpItemKindInterface" },
		Function = { icon = " ", hl = "CmpItemKindFunction" },
		Variable = { icon = " ", hl = "CmpItemKindVariable" },
		Constant = { icon = " ", hl = "CmpItemKindConstant" },
		String = { icon = " ", hl = "TSString" },
		Number = { icon = " ", hl = "TSNumber" },
		Boolean = { icon = " ", hl = "TSBoolean" },
		Array = { icon = " ", hl = "TSKeyword" },
		Object = { icon = " ", hl = "TSKeyword" },
		Key = { icon = " ", hl = "CmpItemKeyword" },
		Null = { icon = "NULL", hl = "TSKeyword" },
		EnumMember = { icon = " ", hl = "CmpItemKindEnumMember" },
		Struct = { icon = " ", hl = "CmpItemKindStruct" },
		Event = { icon = " ", hl = "CmpItemKindEvent" },
		Operator = { icon = " ", hl = "CmpItemKindOperator" },
		TypeParameter = { icon = " ", hl = "CmpItemKindTypeParameter" },
	},
}

vim.cmd("highlight FocusedSymbol gui='bold'")