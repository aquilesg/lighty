local lush = require("lush")
local hsl = lush.hsl

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	local white_gray = hsl("#E0DCD3")
	local green = hsl("#B7C1B4")
	local forest_green = hsl("#688483")
	local teal = hsl("#47666E")
	local blue = hsl("#2F4858")
	local red = hsl("#914B63")
	local orange = hsl("#812B00")
	return {
		ColorColumn({}), -- Columns set with 'colorcolumn'
		Conceal({}), -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ bg = forest_green }), -- Character under the cursor
		CurSearch({ bg = forest_green.da(20), fg = forest_green.li(90) }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor({ bg = blue, fg = white_gray }), -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM({}), -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn({ bg = green }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine({ bg = blue.li(40), fg = green.li(20) }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.

		Directory({ fg = teal }), -- Directory names (and other special names in listings)
		DiffAdd({ bg = teal.li(40) }), -- Diff mode: Added line |diff.txt|
		DiffChange({ bg = white_gray.da(20) }), -- Diff mode: Changed line |diff.txt|
		DiffDelete({ bg = red.li(10), fg = white_gray }), -- Diff mode: Deleted line |diff.txt|
		DiffText({ bg = forest_green.li(40) }), -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer({ fg = white_gray.da(10) }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor({ bg = teal, fg = white_gray }), -- Cursor in a focused terminal
		TermCursorNC({ bg = white_gray.da(20), fg = teal }), -- Cursor in an unfocused terminal
		ErrorMsg({ fg = red, gui = "bold" }), -- Error messages on the command line
		VertSplit({ fg = blue.da(20) }), -- Column separating vertically split windows
		IncSearch({ bg = teal.li(30), fg = red.da(20) }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Folded({ bg = white_gray.da(20) }), -- Line used for closed folds
		FoldColumn({ Folded }), -- 'foldcolumn'
		SignColumn({ fg = forest_green }), -- Column where |signs| are displayed
		Substitute({ CurSearch }), -- |:substitute| replacement text highlighting
		LineNr({ fg = blue.da(40) }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove({ LineNr }), -- Reusing LineNr theme for lines above
		LineNrBelow({ LineNr }), -- Reusing LineNr theme for lines below
		CursorLineNr({ fg = blue.li(20) }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold({ Folded }), -- Reusing Folded theme
		CursorLineSign({ SignColumn }), -- Reusing SignColumn theme
		ModeMsg({ fg = blue.li(30) }), -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea({ fg = green }), -- Area for messages and cmdline
		MoreMsg({ fg = teal }), -- |more-prompt|
		NonText({ fg = white_gray.da(50) }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text
		Normal({ bg = white_gray.li(20), fg = forest_green.da(30) }), -- Normal text
		NormalFloat({ Normal }), -- Normal text in floating windows.
		FloatBorder({ fg = orange }), -- Border of floating windows.
		FloatTitle({ FloatBorder }), -- Title of floating windows.
		NormalNC({ Normal }), -- normal text in non-current windows - same as Normal for now
		Pmenu({ bg = teal.ro(20).li(50) }), -- Popup menu: Normal item.
		PmenuSel({ bg = orange, fg = white_gray.li(10) }), -- Popup menu: Selected item.
		PmenuKind({ fg = forest_green }), -- Popup menu: Normal item "kind"
		PmenuKindSel({ PmenuSel }), -- Popup menu: Selected item "kind"
		PmenuExtra({ fg = teal.li(10) }), -- Popup menu: Normal item "extra text"
		PmenuExtraSel({ PmenuSel }), -- Popup menu: Selected item "extra text"
		PmenuSbar({ bg = white_gray.da(10) }), -- Popup menu: Scrollbar.
		PmenuThumb({ bg = red.ro(20).li(20), fg = white_gray }), -- Popup menu: Thumb of the scrollbar.
		Question({ fg = teal, gui = "bold" }), -- |hit-enter| prompt and yes/no questions
		QuickFixLine({ CursorLine }), -- Current |quickfix| item in the quickfix window.
		Search({ CurSearch }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey({ fg = teal.da(10) }), -- Unprintable characters: text displayed differently from what it really is
		SpellBad({ bg = red.li(30), gui = "underline" }), -- Word that is not recognized by the spellchecker. |spell|
		SpellCap({ gui = "underline" }), -- Word that should start with a capital
		SpellLocal({ fg = green, gui = "underline" }), -- Word recognized as locally correct
		SpellRare({ fg = green, gui = "underline" }), -- Word that is hardly ever used
		StatusLine({ bg = blue.li(20), fg = white_gray.li(10) }), -- Status line of current window
		StatusLineNC({ fg = teal.li(10) }), -- Status lines of not-current windows
		-- Lualine specific groups
		LualineA_normal({ bg = forest_green, fg = white_gray.li(20) }),
		LualineB_normal({ bg = forest_green.li(20), fg = blue.da(20) }),
		LualineC_normal({ bg = white_gray.li(10), fg = blue }),
		TabLine({ bg = white_gray.da(20), fg = green }), -- Tab pages line, not active tab page label
		TabLineFill({ TabLine }), -- Tab pages line, where there are no labels
		TabLineSel({ bg = teal, fg = white_gray }), -- Tab pages line, active tab page label
		Title({ fg = teal.li(20), gui = "bold" }), -- Titles for output from ":set all", ":autocmd" etc.
		Visual({ bg = blue, fg = blue.li(75) }), -- Visual mode selection
		VisualNOS({ bg = red.da(80) }), -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = orange, gui = "bold" }), -- Warning messages
		Whitespace({ fg = white_gray.da(8) }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator({ VertSplit }), -- Separator between window splits. Inherits from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu({ bg = green.li(20), fg = white_gray }), -- Current match in 'wildmenu' completion
		WinBar({}), -- Window bar of current window
		WinBarNC({}), -- Window bar of not-current windows

		Comment({ fg = forest_green }), -- Any comment

		Constant({ fg = teal }), -- (*) Any constant
		String({ fg = red.li(20) }), --   A string constant: "this is a string"
		Character({ fg = red.li(10) }), --   A character constant: 'c', '\n'
		Number({ fg = orange }), --   A number constant: 234, 0xff
		Boolean({ fg = orange.li(20) }), --   A boolean constant: TRUE, false
		Float({ fg = orange.li(10) }), --   A floating point constant: 2.3e10

		Identifier({ fg = blue.li(20) }), -- (*) Any variable name
		Function({ fg = forest_green.li(20) }), --   Function name (also: methods for classes)

		Statement({ fg = blue }), -- (*) Any statement
		Conditional({ fg = teal.li(10) }), --   if, then, else, endif, switch, etc.
		Repeat({ fg = teal }), --   for, do, while, etc.
		Label({ fg = blue.li(10) }), --   case, default, etc.
		Operator({ fg = red }), --   "sizeof", "+", "*", etc.
		Keyword({ fg = blue.li(20) }), --   any other keyword
		Exception({ fg = red.li(10) }), --   try, catch, throw

		PreProc({ fg = teal.li(20) }), -- (*) Generic Preprocessor
		Include({ fg = teal.li(10) }), --   Preprocessor #include
		Define({ fg = forest_green.li(10) }), --   Preprocessor #define
		Macro({ fg = forest_green.li(20) }), --   Same as Define
		PreCondit({ fg = forest_green }), --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = blue }), -- (*) int, long, char, etc.
		StorageClass({ fg = blue.li(10) }), --   static, register, volatile, etc.
		Structure({ fg = blue.li(20) }), --   struct, union, enum, etc.
		Typedef({ fg = teal }), --   A typedef

		Special({ fg = orange }), -- (*) Any special symbol
		SpecialChar({ fg = orange.li(10) }), --   Special character in a constant
		Tag({ fg = green }), --   You can use CTRL-] on this
		Delimiter({ fg = blue.da(20) }), --   Character that needs attention
		SpecialComment({ fg = forest_green.li(20) }), --   Special things inside a comment (e.g. '\n')
		Debug({ fg = red }), --   Debugging statements

		Underlined({ gui = "underline" }), -- Text that stands out, HTML links
		Ignore({ fg = white_gray.da(50) }), -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ fg = red, gui = "bold" }), -- Any erroneous construct
		Todo({ fg = orange, gui = "bold" }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		LspReferenceText({ bg = white_gray.da(15) }), -- Used for highlighting "text" references
		LspReferenceRead({ bg = white_gray.da(15) }), -- Used for highlighting "read" references
		LspReferenceWrite({ bg = white_gray.da(15) }), -- Used for highlighting "write" references
		LspCodeLens({ fg = forest_green.da(10) }), -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		LspCodeLensSeparator({ fg = forest_green.da(20) }), -- Used to color the seperator between two or more code lens.
		LspSignatureActiveParameter({ fg = teal, gui = "bold" }), -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = red }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = orange }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ fg = teal }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = green }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ fg = forest_green }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticVirtualTextError({ fg = red.da(10), bg = red.da(80) }), -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn({ fg = orange.da(10), bg = orange.da(80) }), -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo({ fg = teal.da(10), bg = teal.da(80) }), -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint({ fg = green.da(10), bg = green.da(80) }), -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk({ fg = forest_green.da(10), bg = forest_green.da(80) }), -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError({ fg = red, gui = "undercurl" }), -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn({ fg = orange, gui = "undercurl" }), -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo({ fg = teal, gui = "undercurl" }), -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint({ fg = green, gui = "undercurl" }), -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk({ fg = forest_green, gui = "undercurl" }), -- Used to underline "Ok" diagnostics.
		DiagnosticFloatingError({ fg = red }), -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		DiagnosticFloatingWarn({ fg = orange }), -- Used to color "Warn" diagnostic messages in diagnostics float.
		DiagnosticFloatingInfo({ fg = teal }), -- Used to color "Info" diagnostic messages in diagnostics float.
		DiagnosticFloatingHint({ fg = green }), -- Used to color "Hint" diagnostic messages in diagnostics float.
		DiagnosticFloatingOk({ fg = forest_green }), -- Used to color "Ok" diagnostic messages in diagnostics float.
		DiagnosticSignError({ fg = red }), -- Used for "Error" signs in sign column.
		DiagnosticSignWarn({ fg = orange }), -- Used for "Warn" signs in sign column.
		DiagnosticSignInfo({ fg = teal }), -- Used for "Info" signs in sign column.
		DiagnosticSignHint({ fg = green }), -- Used for "Hint" signs in sign column.
		DiagnosticSignOk({ fg = forest_green }), -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		sym("@text.literal")({ fg = forest_green }), -- Comment
		sym("@text.reference")({ fg = blue.li(10) }), -- Identifier
		sym("@text.title")({ fg = teal, gui = "bold" }), -- Title
		sym("@text.uri")({ fg = teal.li(20), gui = "underline" }), -- Underlined
		sym("@text.underline")({ gui = "underline" }), -- Underlined
		sym("@text.todo")({ fg = orange, gui = "bold" }), -- Todo
		sym("@comment")({ fg = forest_green }), -- Comment
		sym("@punctuation")({ fg = blue.da(20) }), -- Delimiter
		sym("@constant")({ fg = teal }), -- Constant
		sym("@constant.builtin")({ fg = teal.li(10) }), -- Special
		sym("@constant.macro")({ fg = forest_green.li(10) }), -- Define
		sym("@define")({ fg = forest_green.li(10) }), -- Define
		sym("@macro")({ fg = forest_green.li(20) }), -- Macro
		sym("@string")({ fg = red.da(20) }), -- String
		sym("@string.escape")({ fg = orange.li(10) }), -- SpecialChar
		sym("@string.special")({ fg = orange.li(10) }), -- SpecialChar
		sym("@character")({ fg = red.li(10) }), -- Character
		sym("@character.special")({ fg = orange.li(10) }), -- SpecialChar
		sym("@number")({ fg = orange }), -- Number
		sym("@boolean")({ fg = orange.li(20) }), -- Boolean
		sym("@float")({ fg = orange.li(10) }), -- Float
		sym("@function")({ fg = forest_green.li(20) }), -- Function
		sym("@function.builtin")({ fg = forest_green }), -- Special
		sym("@function.macro")({ fg = forest_green.li(20) }), -- Macro
		sym("@parameter")({ fg = blue.li(10) }), -- Identifier
		sym("@method")({ fg = forest_green.li(20) }), -- Function
		sym("@field")({ fg = blue.li(10) }), -- Identifier
		sym("@property")({ fg = blue.li(10) }), -- Identifier
		sym("@constructor")({ fg = teal }), -- Special
		sym("@conditional")({ fg = teal.li(10) }), -- Conditional
		sym("@repeat")({ fg = teal }), -- Repeat
		sym("@label")({ fg = blue.li(10) }), -- Label
		sym("@operator")({ fg = red }), -- Operator
		sym("@keyword")({ fg = blue.li(20) }), -- Keyword
		sym("@exception")({ fg = red.li(10) }), -- Exception
		sym("@variable")({ fg = blue.li(20) }), -- Identifier
		sym("@type")({ fg = blue }), -- Type
		sym("@type.definition")({ fg = teal }), -- Typedef
		sym("@storageclass")({ fg = blue.li(10) }), -- StorageClass
		sym("@structure")({ fg = blue.li(20) }), -- Structure
		sym("@namespace")({ fg = blue.li(10) }), -- Identifier
		sym("@include")({ fg = teal.li(10) }), -- Include
		sym("@preproc")({ fg = teal.li(20) }), -- PreProc
		sym("@debug")({ fg = red }), -- Debug
		sym("@tag")({ fg = green }), -- Tag
		sym("@markup.link.label.markdown_inline")({ fg = teal.li(10) }),

		-- Render Markdown Highlights
		RenderMarkdownCode({ bg = white_gray.da(5) }),
		RenderMarkdownCodeInline({ RenderMarkdownCode }),
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
