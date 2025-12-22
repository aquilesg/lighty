local lush = require("lush")
local hsl = lush.hsl

---@diagnostic disable: undefined-global

-- ╭──────────────────────────────────────────────────────────╮
-- │                     Color Palette                        │
-- ╰──────────────────────────────────────────────────────────╯

local palette = {
	-- Base colors
	white_gray = hsl("#E0DCD3"),
	green = hsl("#B7C1B4"),
	forest_green = hsl("#688483"),
	teal = hsl("#47666E"),
	blue = hsl("#2F4858"),
	red = hsl("#914B63"),
	orange = hsl("#812B00"),
}

-- ╭──────────────────────────────────────────────────────────╮
-- │                   Semantic Colors                        │
-- ╰──────────────────────────────────────────────────────────╯
-- Derived colors with semantic meaning for consistent usage

local p = palette -- shorthand

local colors = {
	-- Backgrounds
	bg = p.white_gray.li(20),
	bg_dark = p.white_gray.da(10),
	bg_darker = p.white_gray.da(20),
	bg_highlight = p.blue.li(40),
	bg_visual = p.blue,
	bg_search = p.forest_green.da(20),
	bg_popup = p.teal.ro(20).li(50),

	-- Foregrounds
	fg = p.blue.da(30),
	fg_dark = p.blue.da(20),
	fg_light = p.blue.li(20),
	fg_muted = p.white_gray.da(50),
	fg_comment = p.forest_green,

	-- UI elements
	border = p.orange,
	cursor = p.forest_green,
	selection = p.blue.li(75),
	line_nr = p.forest_green,
	line_nr_cursor = p.blue.li(20),

	-- Syntax - Primary
	keyword = p.blue.li(20),
	func = p.forest_green.li(20),
	variable = p.blue.li(20),
	constant = p.teal,
	string = p.red.li(20),
	number = p.orange,
	boolean = p.orange.li(20),
	operator = p.red,
	type = p.blue,
	comment = p.forest_green,

	-- Syntax - Secondary
	parameter = p.blue.li(10),
	field = p.blue.li(10),
	property = p.blue.li(10),
	namespace = p.blue.li(10),
	preproc = p.teal.li(20),
	include = p.teal.li(10),
	macro = p.forest_green.li(20),
	define = p.forest_green.li(10),
	conditional = p.teal.li(10),
	loop = p.teal,
	label = p.blue.li(10),
	exception = p.red.li(10),
	special = p.orange,
	special_char = p.orange.li(10),
	delimiter = p.blue.da(20),
	tag = p.red,

	-- Diagnostics
	error = p.red,
	warning = p.orange,
	info = p.teal,
	hint = p.teal,
	ok = p.forest_green,

	-- Diff
	diff_add = p.teal.li(40),
	diff_change = p.white_gray.da(20),
	diff_delete = p.red.li(10),
	diff_text = p.forest_green.li(40),

	-- Git
	git_add = p.forest_green,
	git_change = p.orange,
	git_delete = p.red,
}

local c = colors -- shorthand

-- ╭──────────────────────────────────────────────────────────╮
-- │                      Theme Definition                    │
-- ╰──────────────────────────────────────────────────────────╯

local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	return {
		-- ┌────────────────────────────────────────────────────┐
		-- │                    Editor UI                       │
		-- └────────────────────────────────────────────────────┘

		Normal({ bg = c.bg, fg = c.fg }),
		NormalFloat({ bg = c.bg_dark }),
		NormalNC({ Normal }),
		FloatBorder({ fg = c.border }),
		FloatTitle({ FloatBorder }),

		Cursor({ bg = c.cursor }),
		lCursor({ bg = p.blue, fg = p.white_gray }),
		CursorIM({}),
		CursorLine({ bg = c.bg_highlight, fg = p.green.li(20) }),
		CursorColumn({ bg = p.green }),
		CursorLineNr({ fg = c.line_nr_cursor }),
		CursorLineFold({ bg = c.bg_darker }),
		CursorLineSign({ fg = c.line_nr }),

		LineNr({ fg = c.line_nr }),
		LineNrAbove({ LineNr }),
		LineNrBelow({ LineNr }),
		SignColumn({ fg = c.line_nr }),

		ColorColumn({}),
		Conceal({}),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Search & Replace                 │
		-- └────────────────────────────────────────────────────┘

		CurSearch({ bg = c.bg_search, fg = p.forest_green.li(90) }),
		Search({ CurSearch }),
		IncSearch({ bg = p.teal.li(30), fg = p.red.da(20) }),
		Substitute({ CurSearch }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Visual & Selection               │
		-- └────────────────────────────────────────────────────┘

		Visual({ bg = c.bg_visual, fg = c.selection }),
		VisualNOS({ bg = p.red.da(80) }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Popup Menu                       │
		-- └────────────────────────────────────────────────────┘

		Pmenu({ bg = c.bg_popup }),
		PmenuSel({ bg = c.border, fg = p.white_gray.li(10) }),
		PmenuKind({ fg = c.func }),
		PmenuKindSel({ PmenuSel }),
		PmenuExtra({ fg = p.teal.li(10) }),
		PmenuExtraSel({ PmenuSel }),
		PmenuSbar({ bg = c.bg_dark }),
		PmenuThumb({ bg = p.red.ro(20).li(20), fg = p.white_gray }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Diff                             │
		-- └────────────────────────────────────────────────────┘

		DiffAdd({ bg = c.diff_add }),
		DiffChange({ bg = c.diff_change }),
		DiffDelete({ bg = c.diff_delete, fg = p.white_gray }),
		DiffText({ bg = c.diff_text }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Splits & Borders                 │
		-- └────────────────────────────────────────────────────┘

		VertSplit({ fg = p.blue.da(20) }),
		Winseparator({ VertSplit }),
		WinBar({}),
		WinBarNC({}),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Folding                          │
		-- └────────────────────────────────────────────────────┘

		Folded({ bg = c.bg_darker }),
		FoldColumn({ Folded }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Status & Tab Lines               │
		-- └────────────────────────────────────────────────────┘

		StatusLine({ bg = p.blue.li(20), fg = p.white_gray.li(10) }),
		StatusLineNC({ fg = p.teal.li(10) }),
		TabLine({ bg = c.bg_darker, fg = c.border }),
		TabLineFill({ TabLine }),
		TabLineSel({ bg = p.teal, fg = p.white_gray }),
		WildMenu({ bg = p.teal, fg = p.white_gray }),

		-- Lualine
		LualineA_normal({ bg = c.func, fg = p.white_gray.li(20) }),
		LualineB_normal({ bg = p.forest_green.li(20), fg = c.fg_dark }),
		LualineC_normal({ bg = p.white_gray.li(10), fg = p.blue }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Messages                         │
		-- └────────────────────────────────────────────────────┘

		ModeMsg({ fg = p.blue.li(30) }),
		MsgArea({ fg = p.teal }),
		MoreMsg({ fg = p.teal }),
		Question({ fg = p.teal, gui = "bold" }),
		ErrorMsg({ fg = c.error, gui = "bold" }),
		WarningMsg({ fg = c.warning, gui = "bold" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Misc UI                          │
		-- └────────────────────────────────────────────────────┘

		Directory({ fg = p.teal }),
		EndOfBuffer({ fg = p.white_gray.da(40) }),
		NonText({ fg = c.fg_muted }),
		SpecialKey({ fg = p.teal.da(10) }),
		Whitespace({ fg = p.white_gray.da(8) }),
		TermCursor({ bg = p.teal, fg = p.white_gray }),
		TermCursorNC({ bg = c.bg_darker, fg = p.teal }),
		Title({ fg = p.teal.li(20), gui = "bold" }),
		QuickFixLine({ CursorLine }),
		MatchParen({ bg = p.forest_green.li(30), fg = p.blue.da(20), gui = "bold" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Spelling                         │
		-- └────────────────────────────────────────────────────┘

		SpellBad({ bg = p.red.li(30), gui = "underline" }),
		SpellCap({ gui = "underline" }),
		SpellLocal({ fg = c.func, gui = "underline" }),
		SpellRare({ fg = c.func, gui = "underline" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Syntax Highlighting              │
		-- └────────────────────────────────────────────────────┘

		Comment({ fg = c.comment }),

		Constant({ fg = c.constant }),
		String({ fg = c.string }),
		Character({ fg = p.red.li(10) }),
		Number({ fg = c.number }),
		Boolean({ fg = c.boolean }),
		Float({ fg = p.orange.li(10) }),

		Identifier({ fg = c.variable }),
		Function({ fg = c.func }),

		Statement({ fg = p.blue }),
		Conditional({ fg = c.conditional }),
		Repeat({ fg = c.loop }),
		Label({ fg = c.label }),
		Operator({ fg = c.operator }),
		Keyword({ fg = c.keyword }),
		Exception({ fg = c.exception }),

		PreProc({ fg = c.preproc }),
		Include({ fg = c.include }),
		Define({ fg = c.define }),
		Macro({ fg = c.macro }),
		PreCondit({ fg = c.comment }),

		Type({ fg = c.type }),
		StorageClass({ fg = p.blue.li(10) }),
		Structure({ fg = p.blue.li(20) }),
		Typedef({ fg = p.teal }),

		Special({ fg = c.special }),
		SpecialChar({ fg = c.special_char }),
		Tag({ fg = p.green }),
		Delimiter({ fg = c.delimiter }),
		SpecialComment({ fg = p.forest_green.li(20) }),
		Debug({ fg = c.error }),

		Underlined({ gui = "underline" }),
		Ignore({ fg = c.fg_muted }),
		Error({ fg = c.error, gui = "bold" }),
		Todo({ fg = c.warning, gui = "bold" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   LSP Highlights                   │
		-- └────────────────────────────────────────────────────┘

		LspReferenceText({ bg = p.white_gray.da(35) }),
		LspReferenceRead({ bg = p.white_gray.da(35) }),
		LspReferenceWrite({ bg = p.white_gray.da(15) }),
		LspCodeLens({ fg = p.forest_green.da(10) }),
		LspCodeLensSeparator({ fg = p.forest_green.da(20) }),
		LspSignatureActiveParameter({ fg = p.teal, gui = "bold" }),
		LspInlayHint({ fg = p.forest_green.da(10), bg = p.white_gray.da(5) }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Diagnostics                      │
		-- └────────────────────────────────────────────────────┘

		DiagnosticError({ fg = c.error }),
		DiagnosticWarn({ fg = c.warning }),
		DiagnosticInfo({ fg = c.info }),
		DiagnosticHint({ fg = c.hint }),
		DiagnosticOk({ fg = c.ok }),

		DiagnosticVirtualTextError({ fg = p.red.da(20), bg = p.red.li(35) }),
		DiagnosticVirtualTextWarn({ fg = p.orange.da(30), bg = p.orange.li(70) }),
		DiagnosticVirtualTextInfo({ fg = p.teal.da(10), bg = p.forest_green.li(30) }),
		DiagnosticVirtualTextHint({ DiagnosticVirtualTextInfo }),
		DiagnosticVirtualTextOk({ DiagnosticVirtualTextInfo }),

		DiagnosticUnderlineError({ fg = c.error, gui = "undercurl" }),
		DiagnosticUnderlineWarn({ fg = c.warning, gui = "undercurl" }),
		DiagnosticUnderlineInfo({ fg = c.info, gui = "undercurl" }),
		DiagnosticUnderlineHint({ fg = c.hint, gui = "undercurl" }),
		DiagnosticUnderlineOk({ fg = c.ok, gui = "undercurl" }),

		DiagnosticFloatingError({ fg = c.error }),
		DiagnosticFloatingWarn({ fg = c.warning }),
		DiagnosticFloatingInfo({ fg = c.info }),
		DiagnosticFloatingHint({ fg = p.blue }),
		DiagnosticFloatingOk({ fg = c.ok }),

		DiagnosticSignError({ fg = c.error }),
		DiagnosticSignWarn({ fg = c.warning }),
		DiagnosticSignInfo({ fg = c.info }),
		DiagnosticSignHint({ fg = p.blue }),
		DiagnosticSignOk({ fg = c.ok }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Health Check                     │
		-- └────────────────────────────────────────────────────┘

		healthSuccess({ fg = c.ok }),
		healthWarning({ fg = c.warning }),
		healthError({ fg = c.error }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Git Signs                        │
		-- └────────────────────────────────────────────────────┘

		GitSignsAdd({ fg = c.git_add }),
		GitSignsChange({ fg = c.git_change }),
		GitSignsDelete({ fg = c.git_delete }),
		GitSignsAddNr({ fg = c.git_add }),
		GitSignsChangeNr({ fg = c.git_change }),
		GitSignsDeleteNr({ fg = c.git_delete }),
		GitSignsAddLn({ bg = c.diff_add }),
		GitSignsChangeLn({ bg = c.diff_change }),
		GitSignsDeleteLn({ bg = c.diff_delete }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Telescope                        │
		-- └────────────────────────────────────────────────────┘

		TelescopeNormal({ bg = c.bg_dark }),
		TelescopeBorder({ fg = c.border, bg = c.bg_dark }),
		TelescopePromptNormal({ bg = c.bg_darker }),
		TelescopePromptBorder({ fg = c.border, bg = c.bg_darker }),
		TelescopePromptTitle({ fg = c.bg, bg = c.border }),
		TelescopePromptPrefix({ fg = c.border }),
		TelescopePreviewTitle({ fg = c.bg, bg = c.func }),
		TelescopeResultsTitle({ fg = c.bg, bg = p.teal }),
		TelescopeSelection({ bg = c.bg_highlight }),
		TelescopeSelectionCaret({ fg = c.border }),
		TelescopeMatching({ fg = c.border, gui = "bold" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Nvim-cmp                         │
		-- └────────────────────────────────────────────────────┘

		CmpItemAbbr({ fg = c.fg }),
		CmpItemAbbrDeprecated({ fg = c.fg_muted, gui = "strikethrough" }),
		CmpItemAbbrMatch({ fg = c.border, gui = "bold" }),
		CmpItemAbbrMatchFuzzy({ fg = c.border }),
		CmpItemKind({ fg = c.func }),
		CmpItemKindClass({ fg = c.type }),
		CmpItemKindFunction({ fg = c.func }),
		CmpItemKindInterface({ fg = c.type }),
		CmpItemKindMethod({ fg = c.func }),
		CmpItemKindSnippet({ fg = c.special }),
		CmpItemKindVariable({ fg = c.variable }),
		CmpItemKindKeyword({ fg = c.keyword }),
		CmpItemKindText({ fg = c.fg }),
		CmpItemMenu({ fg = c.comment }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Indent Blankline                 │
		-- └────────────────────────────────────────────────────┘

		IndentBlanklineChar({ fg = p.white_gray.da(15) }),
		IndentBlanklineContextChar({ fg = c.border }),
		IblIndent({ fg = p.white_gray.da(15) }),
		IblScope({ fg = c.border }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Which-key                        │
		-- └────────────────────────────────────────────────────┘

		WhichKey({ fg = c.border }),
		WhichKeyGroup({ fg = c.func }),
		WhichKeyDesc({ fg = c.fg }),
		WhichKeySeparator({ fg = c.comment }),
		WhichKeyFloat({ bg = c.bg_dark }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Lazy.nvim                        │
		-- └────────────────────────────────────────────────────┘

		LazyButton({ bg = c.bg_darker }),
		LazyButtonActive({ bg = c.border, fg = c.bg }),
		LazyH1({ fg = c.bg, bg = c.border, gui = "bold" }),
		LazyProgressDone({ fg = c.ok }),
		LazyProgressTodo({ fg = c.fg_muted }),
		LazySpecial({ fg = c.special }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Treesitter                       │
		-- └────────────────────────────────────────────────────┘
		-- See :h treesitter-highlight-groups
		-- Updated for nvim-treesitter main branch (2024+)

		-- ── Identifiers ──────────────────────────────────────────────
		-- Text (legacy - use @markup.* for new code)
		sym("@text.literal")({ fg = c.comment }),
		sym("@text.reference")({ fg = c.field }),
		sym("@text.title")({ fg = p.teal, gui = "bold" }),
		sym("@text.uri")({ fg = p.teal.li(20), gui = "underline" }),
		sym("@text.underline")({ gui = "underline" }),
		sym("@text.todo")({ fg = c.warning, gui = "bold" }),

		-- Comments
		sym("@comment")({ fg = c.comment }),
		sym("@comment.documentation")({ fg = p.forest_green.li(10) }),
		sym("@comment.error")({ fg = c.error, gui = "bold" }),
		sym("@comment.warning")({ fg = c.warning, gui = "bold" }),
		sym("@comment.todo")({ fg = c.warning, gui = "bold" }),
		sym("@comment.note")({ fg = c.info, gui = "bold" }),

		-- Punctuation
		sym("@punctuation")({ fg = c.delimiter }),
		sym("@punctuation.bracket")({ fg = c.delimiter }),
		sym("@punctuation.delimiter")({ fg = c.delimiter }),
		sym("@punctuation.special")({ fg = c.special }),

		-- Constants
		sym("@constant")({ fg = c.constant }),
		sym("@constant.builtin")({ fg = p.teal.li(10) }),
		sym("@constant.macro")({ fg = c.define }),

		-- Preprocessor
		sym("@define")({ fg = c.define }), -- LEGACY: use @keyword.directive.define
		sym("@macro")({ fg = c.macro }), -- LEGACY: use @function.macro
		sym("@preproc")({ fg = c.preproc }), -- LEGACY: use @keyword.directive

		-- Strings & Characters
		sym("@string")({ fg = p.red.da(20) }), -- string literals
		sym("@string.documentation")({ fg = p.forest_green.li(10), gui = "italic" }), -- string documenting code (e.g. Python docstrings)
		sym("@string.regexp")({ fg = c.special }), -- regular expressions
		sym("@string.regex")({ fg = c.special }), -- LEGACY: use @string.regexp
		sym("@string.escape")({ fg = c.special_char }), -- escape sequences
		sym("@string.special")({ fg = c.special_char }), -- other special strings (e.g. dates)
		sym("@string.special.symbol")({ fg = c.special }), -- symbols or atoms
		sym("@string.special.path")({ fg = p.teal }), -- filenames
		sym("@string.special.url")({ fg = p.teal.li(20), gui = "underline" }), -- URIs (e.g. hyperlinks)
		sym("@character")({ fg = p.red.li(10) }), -- character literals
		sym("@character.special")({ fg = c.special_char }), -- special characters (e.g. wildcards)

		-- Numbers
		sym("@number")({ fg = c.number }), -- numeric literals
		sym("@number.float")({ fg = p.orange.li(10) }), -- floating-point number literals
		sym("@float")({ fg = p.orange.li(10) }), -- LEGACY: use @number.float
		sym("@boolean")({ fg = c.boolean }), -- boolean literals

		-- Functions
		sym("@function")({ fg = c.func }),
		sym("@function.builtin")({ fg = c.comment }),
		sym("@function.macro")({ fg = c.macro }),
		sym("@function.call")({ fg = c.func }),
		sym("@function.method")({ fg = c.func }),
		sym("@function.method.call")({ fg = c.func }),

		-- Parameters & Variables
		sym("@parameter")({ fg = c.parameter }), -- LEGACY: use @variable.parameter
		sym("@variable")({ fg = c.variable }), -- various variable names
		sym("@variable.builtin")({ fg = p.teal }), -- built-in variable names (e.g. `this`, `self`)
		sym("@variable.parameter")({ fg = c.parameter }), -- parameters of a function
		sym("@variable.parameter.builtin")({ fg = c.parameter }), -- special parameters (e.g. `_`, `it`)
		sym("@variable.member")({ fg = c.field }), -- object and struct fields

		-- Methods & Fields
		sym("@method")({ fg = c.func }), -- LEGACY: use @function.method
		sym("@method.call")({ fg = c.func }), -- LEGACY: use @function.method.call
		sym("@field")({ fg = c.field }), -- LEGACY: use @variable.member
		sym("@property")({ fg = c.property }), -- similar to `@variable.member`, for properties

		-- Types
		sym("@type")({ fg = c.type }), -- type or class definitions and annotations
		sym("@type.builtin")({ fg = p.blue.li(10) }), -- built-in types
		sym("@type.definition")({ fg = p.teal }), -- identifiers in type definitions
		sym("@type.qualifier")({ fg = c.keyword }), -- type qualifiers

		-- Attributes
		sym("@attribute")({ fg = c.macro }), -- attribute annotations (e.g. Python decorators, Rust attributes)
		sym("@attribute.builtin")({ fg = c.macro }), -- built-in annotations (e.g. `@property` in Python)

		-- Classes & Structures
		sym("@constructor")({ fg = c.constant }), -- constructor calls and definitions
		sym("@storageclass")({ fg = p.blue.li(10) }), -- LEGACY: use @keyword.modifier
		sym("@structure")({ fg = p.blue.li(20) }), -- LEGACY: use @type
		sym("@namespace")({ fg = c.namespace }), -- LEGACY: use @module
		sym("@module")({ fg = c.namespace }), -- modules or namespaces
		sym("@module.builtin")({ fg = p.blue.li(10) }), -- built-in modules or namespaces

		-- Keywords & Control Flow
		sym("@keyword")({ fg = c.keyword }), -- keywords not fitting into specific categories
		sym("@keyword.coroutine")({ fg = c.keyword }), -- keywords related to coroutines (e.g. `async`, `await`)
		sym("@keyword.function")({ fg = c.keyword }), -- keywords that define a function (e.g. `func`, `def`)
		sym("@keyword.operator")({ fg = c.operator }), -- operators that are English words (e.g. `and`, `or`, `not`)
		sym("@keyword.import")({ fg = c.include }), -- keywords for including modules (e.g. `import`, `from`)
		sym("@keyword.type")({ fg = c.type }), -- keywords describing composite types (e.g. `struct`, `enum`)
		sym("@keyword.modifier")({ fg = p.blue.li(10) }), -- keywords modifying other constructs (e.g. `const`, `static`)
		sym("@keyword.repeat")({ fg = c.loop }), -- keywords related to loops (e.g. `for`, `while`)
		sym("@keyword.return")({ fg = c.keyword }), -- keywords like `return` and `yield`
		sym("@keyword.debug")({ fg = c.error }), -- keywords related to debugging
		sym("@keyword.exception")({ fg = c.exception }), -- keywords related to exceptions (e.g. `throw`, `catch`)
		sym("@keyword.conditional")({ fg = c.conditional }), -- keywords related to conditionals (e.g. `if`, `else`)
		sym("@keyword.conditional.ternary")({ fg = c.conditional }), -- ternary operator (e.g. `?`, `:`)
		sym("@keyword.directive")({ fg = c.preproc }), -- various preprocessor directives and shebangs
		sym("@keyword.directive.define")({ fg = c.define }), -- preprocessor definition directives

		sym("@conditional")({ fg = c.conditional }),
		sym("@repeat")({ fg = c.loop }),
		sym("@label")({ fg = c.label }),
		sym("@operator")({ fg = c.operator }),
		sym("@exception")({ fg = c.exception }),
		sym("@include")({ fg = c.include }),

		-- Tags & Attributes (HTML/JSX)
		sym("@tag")({ fg = c.tag, bg = p.forest_green.li(55) }), -- XML-style tag names (e.g. in HTML, JSX)
		sym("@tag.builtin")({ fg = c.tag }), -- builtin tag names (e.g. HTML5 tags)
		sym("@tag.attribute")({ fg = c.property }), -- attributes (e.g. `id`, `class`)
		sym("@tag.delimiter")({ fg = c.delimiter }), -- tag delimiters (e.g. `<`, `>`, `/`)

		-- Debug
		sym("@debug")({ fg = c.error }), -- LEGACY: use @keyword.debug

		-- Markup (Markdown, etc.)
		sym("@markup")({ fg = c.fg }),
		sym("@markup.heading")({ fg = p.teal, gui = "bold" }),
		sym("@markup.heading.1")({ fg = p.teal, gui = "bold" }),
		sym("@markup.heading.2")({ fg = p.teal.li(10), gui = "bold" }),
		sym("@markup.heading.3")({ fg = p.teal.li(20), gui = "bold" }),
		sym("@markup.heading.4")({ fg = c.func, gui = "bold" }),
		sym("@markup.heading.5")({ fg = c.func }),
		sym("@markup.heading.6")({ fg = c.comment }),
		sym("@markup.strong")({ fg = p.orange.li(10), gui = "bold" }),
		sym("@markup.italic")({ gui = "italic" }),
		sym("@markup.strikethrough")({ gui = "strikethrough" }),
		sym("@markup.underline")({ gui = "underline" }),
		sym("@markup.quote")({ fg = c.comment, gui = "italic" }),
		sym("@markup.math")({ fg = c.number }),
		sym("@markup.link")({ fg = p.teal, gui = "underline" }),
		sym("@markup.link.label")({ fg = c.include }),
		sym("@markup.link.label.markdown_inline")({ fg = c.include }),
		sym("@markup.link.url")({ fg = p.teal.li(20), gui = "underline" }),
		sym("@markup.raw")({ fg = c.string }), -- literal or verbatim text (e.g. inline code)
		sym("@markup.raw.block")({ bg = c.bg_dark }), -- literal or verbatim text as a stand-alone block
		sym("@markup.list")({ fg = c.special }),
		sym("@markup.list.checked")({ fg = c.ok }),
		sym("@markup.list.unchecked")({ fg = c.fg_muted }),

		-- Diff
		sym("@diff.plus")({ fg = c.git_add }), -- added text (for diff files)
		sym("@diff.minus")({ fg = c.git_delete }), -- deleted text
		sym("@diff.delta")({ fg = c.git_change }), -- changed text

		-- ══════════════════════════════════════════════════════════════
		-- LEGACY CAPTURES (for backwards compatibility)
		-- These link to the new standard captures above
		-- Note: Some legacy captures are already defined above, so we only
		-- include ones that weren't already defined
		-- ══════════════════════════════════════════════════════════════

		-- Legacy text/markup captures (renamed to @markup.*)
		-- Note: @text.literal, @text.reference, @text.title, @text.uri, 
		-- @text.underline, and @text.todo are already defined above
		sym("@text")({ fg = c.fg }), -- LEGACY: use Normal or @markup
		sym("@text.strong")({ fg = p.orange.li(10), gui = "bold" }), -- LEGACY: use @markup.strong
		sym("@text.emphasis")({ gui = "italic" }), -- LEGACY: use @markup.italic
		sym("@text.strike")({ gui = "strikethrough" }), -- LEGACY: use @markup.strikethrough
		sym("@text.math")({ fg = c.number }), -- LEGACY: use @markup.math
		sym("@text.environment")({ fg = c.func }), -- LEGACY
		sym("@text.environment.name")({ fg = c.type }), -- LEGACY
		sym("@text.note")({ fg = c.info, gui = "bold" }), -- LEGACY: use @comment.note
		sym("@text.warning")({ fg = c.warning, gui = "bold" }), -- LEGACY: use @comment.warning
		sym("@text.danger")({ fg = c.error, gui = "bold" }), -- LEGACY: use @comment.error
		sym("@text.diff.add")({ fg = c.git_add }), -- LEGACY: use @diff.plus
		sym("@text.diff.delete")({ fg = c.git_delete }), -- LEGACY: use @diff.minus

		-- Note: @punctuation is already defined above

		-- ┌────────────────────────────────────────────────────┐
		-- │                   LSP Semantic Tokens              │
		-- └────────────────────────────────────────────────────┘

		sym("@lsp.type.class")({ fg = c.type }),
		sym("@lsp.type.decorator")({ fg = c.macro }),
		sym("@lsp.type.enum")({ fg = c.type }),
		sym("@lsp.type.enumMember")({ fg = c.constant }),
		sym("@lsp.type.function")({ fg = c.func }),
		sym("@lsp.type.interface")({ fg = c.type }),
		sym("@lsp.type.macro")({ fg = c.macro }),
		sym("@lsp.type.method")({ fg = c.func }),
		sym("@lsp.type.namespace")({ fg = c.namespace }),
		sym("@lsp.type.parameter")({ fg = c.parameter }),
		sym("@lsp.type.property")({ fg = c.property }),
		sym("@lsp.type.struct")({ fg = c.type }),
		sym("@lsp.type.type")({ fg = c.type }),
		sym("@lsp.type.typeParameter")({ fg = c.type }),
		sym("@lsp.type.variable")({ fg = c.variable }),

		sym("@lsp.mod.deprecated")({ gui = "strikethrough" }),
		sym("@lsp.mod.readonly")({ fg = c.constant }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Render Markdown                  │
		-- └────────────────────────────────────────────────────┘

		RenderMarkdownCode({ bg = p.white_gray.da(5) }),
		RenderMarkdownCodeInline({ RenderMarkdownCode }),
		RenderMarkdownH1Bg({ bg = p.teal.li(50) }),
		RenderMarkdownH2Bg({ bg = p.teal.li(55) }),
		RenderMarkdownH3Bg({ bg = p.teal.li(60) }),
		RenderMarkdownH4Bg({ bg = c.bg_darker }),
		RenderMarkdownH5Bg({ bg = c.bg_darker }),
		RenderMarkdownH6Bg({ bg = c.bg_darker }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Blink.cmp                        │
		-- └────────────────────────────────────────────────────┘

		BlinkCmpMenu({ bg = c.bg_dark }),
		BlinkCmpMenuBorder({ fg = c.border, bg = c.bg_dark }),
		BlinkCmpMenuSelection({ bg = c.bg_highlight }),
		BlinkCmpLabel({ fg = c.fg }),
		BlinkCmpLabelDeprecated({ fg = c.fg_muted, gui = "strikethrough" }),
		BlinkCmpLabelMatch({ fg = c.border, gui = "bold" }),
		BlinkCmpKind({ fg = c.func }),
		BlinkCmpKindClass({ fg = c.type }),
		BlinkCmpKindColor({ fg = c.special }),
		BlinkCmpKindConstant({ fg = c.constant }),
		BlinkCmpKindConstructor({ fg = c.constant }),
		BlinkCmpKindEnum({ fg = c.type }),
		BlinkCmpKindEnumMember({ fg = c.constant }),
		BlinkCmpKindEvent({ fg = c.special }),
		BlinkCmpKindField({ fg = c.field }),
		BlinkCmpKindFile({ fg = c.fg }),
		BlinkCmpKindFolder({ fg = p.teal }),
		BlinkCmpKindFunction({ fg = c.func }),
		BlinkCmpKindInterface({ fg = c.type }),
		BlinkCmpKindKeyword({ fg = c.keyword }),
		BlinkCmpKindMethod({ fg = c.func }),
		BlinkCmpKindModule({ fg = c.namespace }),
		BlinkCmpKindOperator({ fg = c.operator }),
		BlinkCmpKindProperty({ fg = c.property }),
		BlinkCmpKindReference({ fg = c.constant }),
		BlinkCmpKindSnippet({ fg = c.special }),
		BlinkCmpKindStruct({ fg = c.type }),
		BlinkCmpKindText({ fg = c.fg }),
		BlinkCmpKindTypeParameter({ fg = c.type }),
		BlinkCmpKindUnit({ fg = c.number }),
		BlinkCmpKindValue({ fg = c.number }),
		BlinkCmpKindVariable({ fg = c.variable }),
		BlinkCmpGhostText({ fg = c.fg_muted }),
		BlinkCmpDoc({ bg = c.bg_dark }),
		BlinkCmpDocBorder({ fg = c.border, bg = c.bg_dark }),
		BlinkCmpDocSeparator({ fg = c.border }),
		BlinkCmpSignatureHelp({ bg = c.bg_dark }),
		BlinkCmpSignatureHelpBorder({ fg = c.border, bg = c.bg_dark }),
		BlinkCmpSignatureHelpActiveParameter({ fg = c.border, gui = "bold" }),

		-- Blink source labels
		BlinkCmpSource({ fg = c.comment }),
		BlinkCmpSourceLSP({ fg = c.func }),
		BlinkCmpSourceBuffer({ fg = c.fg_muted }),
		BlinkCmpSourcePath({ fg = p.teal }),
		BlinkCmpSourceSnippets({ fg = c.special }),
		BlinkCmpSourceCopilot({ fg = p.forest_green }),
		BlinkCmpSourceGit({ fg = c.git_change }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Bufferline                       │
		-- └────────────────────────────────────────────────────┘

		BufferLineFill({ bg = c.bg_darker }),
		BufferLineBackground({ bg = c.bg_darker, fg = c.fg_muted }),
		BufferLineBuffer({ bg = c.bg_darker, fg = c.fg_muted }),
		BufferLineBufferVisible({ bg = c.bg_dark, fg = c.fg }),
		BufferLineBufferSelected({ bg = c.bg, fg = c.fg, gui = "bold" }),
		BufferLineTab({ bg = c.bg_darker, fg = c.fg_muted }),
		BufferLineTabSelected({ bg = c.bg, fg = c.fg, gui = "bold" }),
		BufferLineTabClose({ bg = c.bg_darker, fg = c.error }),
		BufferLineCloseButton({ bg = c.bg_darker, fg = c.fg_muted }),
		BufferLineCloseButtonVisible({ bg = c.bg_dark, fg = c.fg }),
		BufferLineCloseButtonSelected({ bg = c.bg, fg = c.error }),
		BufferLineModified({ bg = c.bg_darker, fg = c.warning }),
		BufferLineModifiedVisible({ bg = c.bg_dark, fg = c.warning }),
		BufferLineModifiedSelected({ bg = c.bg, fg = c.warning }),
		BufferLineDuplicate({ bg = c.bg_darker, fg = c.fg_muted, gui = "italic" }),
		BufferLineDuplicateVisible({ bg = c.bg_dark, fg = c.fg_muted, gui = "italic" }),
		BufferLineDuplicateSelected({ bg = c.bg, fg = c.fg_muted, gui = "italic" }),
		BufferLineSeparator({ bg = c.bg_darker, fg = c.bg_darker }),
		BufferLineSeparatorVisible({ bg = c.bg_dark, fg = c.bg_darker }),
		BufferLineSeparatorSelected({ bg = c.bg, fg = c.bg_darker }),
		BufferLineIndicatorSelected({ bg = c.bg, fg = c.border }),
		BufferLineIndicatorVisible({ bg = c.bg_dark, fg = c.bg_dark }),
		BufferLinePick({ bg = c.bg_darker, fg = c.error, gui = "bold" }),
		BufferLinePickVisible({ bg = c.bg_dark, fg = c.error, gui = "bold" }),
		BufferLinePickSelected({ bg = c.bg, fg = c.error, gui = "bold" }),
		BufferLineError({ bg = c.bg_darker, fg = c.error }),
		BufferLineErrorVisible({ bg = c.bg_dark, fg = c.error }),
		BufferLineErrorSelected({ bg = c.bg, fg = c.error }),
		BufferLineErrorDiagnostic({ bg = c.bg_darker, fg = c.error }),
		BufferLineErrorDiagnosticVisible({ bg = c.bg_dark, fg = c.error }),
		BufferLineErrorDiagnosticSelected({ bg = c.bg, fg = c.error }),
		BufferLineWarning({ bg = c.bg_darker, fg = c.warning }),
		BufferLineWarningVisible({ bg = c.bg_dark, fg = c.warning }),
		BufferLineWarningSelected({ bg = c.bg, fg = c.warning }),
		BufferLineWarningDiagnostic({ bg = c.bg_darker, fg = c.warning }),
		BufferLineWarningDiagnosticVisible({ bg = c.bg_dark, fg = c.warning }),
		BufferLineWarningDiagnosticSelected({ bg = c.bg, fg = c.warning }),
		BufferLineInfo({ bg = c.bg_darker, fg = c.info }),
		BufferLineInfoVisible({ bg = c.bg_dark, fg = c.info }),
		BufferLineInfoSelected({ bg = c.bg, fg = c.info }),
		BufferLineInfoDiagnostic({ bg = c.bg_darker, fg = c.info }),
		BufferLineInfoDiagnosticVisible({ bg = c.bg_dark, fg = c.info }),
		BufferLineInfoDiagnosticSelected({ bg = c.bg, fg = c.info }),
		BufferLineHint({ bg = c.bg_darker, fg = c.hint }),
		BufferLineHintVisible({ bg = c.bg_dark, fg = c.hint }),
		BufferLineHintSelected({ bg = c.bg, fg = c.hint }),
		BufferLineHintDiagnostic({ bg = c.bg_darker, fg = c.hint }),
		BufferLineHintDiagnosticVisible({ bg = c.bg_dark, fg = c.hint }),
		BufferLineHintDiagnosticSelected({ bg = c.bg, fg = c.hint }),
		BufferLineNumbers({ bg = c.bg_darker, fg = c.fg_muted }),
		BufferLineNumbersVisible({ bg = c.bg_dark, fg = c.fg }),
		BufferLineNumbersSelected({ bg = c.bg, fg = c.border, gui = "bold" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Noice.nvim                       │
		-- └────────────────────────────────────────────────────┘

		NoiceCmdline({ bg = c.bg_dark }),
		NoiceCmdlineIcon({ fg = c.border }),
		NoiceCmdlineIconSearch({ fg = c.warning }),
		NoiceCmdlinePopup({ bg = c.bg_dark }),
		NoiceCmdlinePopupBorder({ fg = c.border }),
		NoiceCmdlinePopupBorderSearch({ fg = c.warning }),
		NoiceCmdlinePopupTitle({ fg = c.border }),
		NoiceConfirm({ bg = c.bg_dark }),
		NoiceConfirmBorder({ fg = c.border }),
		NoiceFormatConfirm({ bg = c.border, fg = c.bg }),
		NoiceFormatConfirmDefault({ bg = c.func, fg = c.bg }),
		NoiceMini({ bg = c.bg_dark }),
		NoicePopup({ bg = c.bg_dark }),
		NoicePopupBorder({ fg = c.border }),
		NoicePopupmenu({ bg = c.bg_popup }),
		NoicePopupmenuBorder({ fg = c.border }),
		NoicePopupmenuMatch({ fg = c.border, gui = "bold" }),
		NoicePopupmenuSelected({ bg = c.bg_highlight }),
		NoiceScrollbar({ bg = c.bg_dark }),
		NoiceScrollbarThumb({ bg = c.border }),
		NoiceSplit({ bg = c.bg_dark }),
		NoiceSplitBorder({ fg = c.border }),
		NoiceVirtualText({ fg = c.comment }),
		NoiceFormatProgressDone({ bg = c.func, fg = c.bg }),
		NoiceFormatProgressTodo({ bg = c.bg_darker, fg = c.fg_muted }),
		NoiceLspProgressClient({ fg = c.func }),
		NoiceLspProgressSpinner({ fg = c.border }),
		NoiceLspProgressTitle({ fg = c.fg }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Nvim-notify                      │
		-- └────────────────────────────────────────────────────┘

		NotifyERRORBorder({ fg = c.error }),
		NotifyERRORIcon({ fg = c.error }),
		NotifyERRORTitle({ fg = c.error }),
		NotifyERRORBody({ fg = c.fg }),
		NotifyWARNBorder({ fg = c.warning }),
		NotifyWARNIcon({ fg = c.warning }),
		NotifyWARNTitle({ fg = c.warning }),
		NotifyWARNBody({ fg = c.fg }),
		NotifyINFOBorder({ fg = c.info }),
		NotifyINFOIcon({ fg = c.info }),
		NotifyINFOTitle({ fg = c.info }),
		NotifyINFOBody({ fg = c.fg }),
		NotifyDEBUGBorder({ fg = c.comment }),
		NotifyDEBUGIcon({ fg = c.comment }),
		NotifyDEBUGTitle({ fg = c.comment }),
		NotifyDEBUGBody({ fg = c.fg }),
		NotifyTRACEBorder({ fg = c.hint }),
		NotifyTRACEIcon({ fg = c.hint }),
		NotifyTRACETitle({ fg = c.hint }),
		NotifyTRACEBody({ fg = c.fg }),
		NotifyBackground({ bg = c.bg_dark }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   LspSaga                          │
		-- └────────────────────────────────────────────────────┘

		SagaNormal({ bg = c.bg_dark }),
		SagaBorder({ fg = c.border }),
		SagaExpand({ fg = c.border }),
		SagaCollapse({ fg = c.border }),
		SagaBeacon({ bg = c.border }),
		SagaCount({ bg = c.border, fg = c.bg }),
		SagaVirtLine({ fg = c.comment }),
		SagaSpinnerTitle({ fg = c.func }),
		SagaSpinner({ fg = c.border }),
		SagaText({ fg = c.fg }),
		SagaSelect({ fg = c.border }),
		SagaSearch({ bg = c.border, fg = c.bg }),
		SagaFinderFname({ fg = c.fg }),
		SagaDetail({ fg = c.comment }),
		SagaInCurrent({ fg = c.border }),
		SagaFileName({ fg = c.fg, gui = "underline" }),
		SagaFolderName({ fg = p.teal }),
		SagaFolder({ fg = p.teal }),
		SagaTitle({ fg = c.border, gui = "bold" }),
		SagaToggle({ fg = c.border }),
		SagaConstant({ fg = c.constant }),
		SagaImpIcon({ fg = c.warning }),
		SagaWinbarSep({ fg = c.comment }),
		SagaWinbarFileName({ fg = c.fg }),
		SagaWinbarFolderName({ fg = p.teal }),
		SagaWinbarFolder({ fg = p.teal }),
		SagaLightBulb({ fg = c.warning }),

		-- Saga action kinds
		ActionPreviewNormal({ bg = c.bg_dark }),
		ActionPreviewBorder({ fg = c.border }),
		ActionPreviewTitle({ fg = c.border, gui = "bold" }),

		-- Code action
		CodeActionText({ fg = c.fg }),
		CodeActionNumber({ fg = c.number }),

		-- Finder
		FinderSelection({ fg = c.border, gui = "bold" }),
		FinderFileName({ fg = c.fg }),
		FinderCount({ fg = c.comment }),
		FinderIcon({ fg = c.border }),
		FinderType({ fg = c.type }),

		-- Definition/Reference
		DefinitionBorder({ fg = c.border }),
		DefinitionFile({ fg = c.fg }),
		DefinitionCount({ fg = c.comment }),
		ReferencesCount({ fg = c.comment }),
		ReferencesIcon({ fg = c.border }),

		-- Hover
		HoverNormal({ bg = c.bg_dark }),
		HoverBorder({ fg = c.border }),

		-- Rename
		RenameBorder({ fg = c.border }),
		RenameNormal({ bg = c.bg_dark }),
		RenameMatch({ bg = c.bg_search, fg = c.fg }),

		-- Diagnostic
		DiagnosticBorder({ fg = c.border }),
		DiagnosticNormal({ bg = c.bg_dark }),
		DiagnosticText({ fg = c.fg }),
		DiagnosticShowNormal({ bg = c.bg_dark }),
		DiagnosticShowBorder({ fg = c.border }),

		-- Outline
		OutlineIndent({ fg = c.comment }),
		OutlineFoldPrefix({ fg = c.border }),
		OutlineDetail({ fg = c.comment }),

		-- Callhierarchy
		CallHierarchyNormal({ bg = c.bg_dark }),
		CallHierarchyBorder({ fg = c.border }),
		CallHierarchyIcon({ fg = c.func }),
		CallHierarchyTitle({ fg = c.border, gui = "bold" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Todo-comments                    │
		-- └────────────────────────────────────────────────────┘

		TodoBgFIX({ bg = c.error, fg = c.bg, gui = "bold" }),
		TodoBgHACK({ bg = c.warning, fg = c.bg, gui = "bold" }),
		TodoBgNOTE({ bg = c.info, fg = c.bg, gui = "bold" }),
		TodoBgPERF({ bg = p.forest_green, fg = c.bg, gui = "bold" }),
		TodoBgTODO({ bg = c.border, fg = c.bg, gui = "bold" }),
		TodoBgWARN({ bg = c.warning, fg = c.bg, gui = "bold" }),
		TodoFgFIX({ fg = c.error }),
		TodoFgHACK({ fg = c.warning }),
		TodoFgNOTE({ fg = c.info }),
		TodoFgPERF({ fg = p.forest_green }),
		TodoFgTODO({ fg = c.border }),
		TodoFgWARN({ fg = c.warning }),
		TodoSignFIX({ fg = c.error }),
		TodoSignHACK({ fg = c.warning }),
		TodoSignNOTE({ fg = c.info }),
		TodoSignPERF({ fg = p.forest_green }),
		TodoSignTODO({ fg = c.border }),
		TodoSignWARN({ fg = c.warning }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Trouble.nvim                     │
		-- └────────────────────────────────────────────────────┘

		TroubleNormal({ bg = c.bg_dark }),
		TroubleNormalNC({ bg = c.bg_dark }),
		TroubleCount({ fg = c.border, gui = "bold" }),
		TroubleCode({ fg = c.comment }),
		TroubleError({ fg = c.error }),
		TroubleWarning({ fg = c.warning }),
		TroubleInformation({ fg = c.info }),
		TroubleHint({ fg = c.hint }),
		TroubleFile({ fg = c.fg }),
		TroubleFoldIcon({ fg = c.border }),
		TroubleLocation({ fg = c.comment }),
		TroublePreview({ bg = c.bg_highlight }),
		TroubleSource({ fg = c.comment }),
		TroubleText({ fg = c.fg }),
		TroubleTextError({ fg = c.error }),
		TroubleTextWarning({ fg = c.warning }),
		TroubleTextInformation({ fg = c.info }),
		TroubleTextHint({ fg = c.hint }),
		TroubleIndent({ fg = c.comment }),
		TroubleIndentFoldClosed({ fg = c.border }),
		TroubleIndentFoldOpen({ fg = c.border }),
		TroubleIndentLast({ fg = c.comment }),
		TroubleIndentMiddle({ fg = c.comment }),
		TroubleIndentTop({ fg = c.comment }),
		TroubleIndentWs({ fg = c.comment }),
		TroublePos({ fg = c.comment }),
		TroubleSignError({ fg = c.error }),
		TroubleSignWarning({ fg = c.warning }),
		TroubleSignInformation({ fg = c.info }),
		TroubleSignHint({ fg = c.hint }),
		TroubleSignOther({ fg = c.info }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Diffview.nvim                    │
		-- └────────────────────────────────────────────────────┘

		DiffviewNormal({ bg = c.bg_dark }),
		DiffviewFilePanelTitle({ fg = c.border, gui = "bold" }),
		DiffviewFilePanelCounter({ fg = c.func }),
		DiffviewFilePanelFileName({ fg = c.fg }),
		DiffviewFilePanelPath({ fg = c.comment }),
		DiffviewFilePanelRootPath({ fg = c.border }),
		DiffviewFilePanelInsertions({ fg = c.git_add }),
		DiffviewFilePanelDeletions({ fg = c.git_delete }),
		DiffviewFilePanelConflicts({ fg = c.warning }),
		DiffviewFolderName({ fg = p.teal }),
		DiffviewFolderSign({ fg = c.border }),
		DiffviewStatusAdded({ fg = c.git_add }),
		DiffviewStatusModified({ fg = c.git_change }),
		DiffviewStatusRenamed({ fg = c.info }),
		DiffviewStatusCopied({ fg = c.info }),
		DiffviewStatusTypeChange({ fg = c.info }),
		DiffviewStatusUnmerged({ fg = c.warning }),
		DiffviewStatusUnknown({ fg = c.fg_muted }),
		DiffviewStatusDeleted({ fg = c.git_delete }),
		DiffviewStatusBroken({ fg = c.error }),
		DiffviewStatusIgnored({ fg = c.fg_muted }),
		DiffviewDim1({ fg = c.fg_muted }),
		DiffviewReference({ fg = c.func }),
		DiffviewPrimary({ fg = c.border }),
		DiffviewSecondary({ fg = c.func }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Neogit                           │
		-- └────────────────────────────────────────────────────┘

		NeogitBranch({ fg = c.border, gui = "bold" }),
		NeogitRemote({ fg = c.func }),
		NeogitHunkHeader({ bg = c.bg_darker, fg = c.fg }),
		NeogitHunkHeaderHighlight({ bg = c.bg_highlight, fg = c.fg }),
		NeogitDiffContext({ bg = c.bg_dark }),
		NeogitDiffContextHighlight({ bg = c.bg }),
		NeogitDiffAdd({ bg = c.diff_add, fg = c.fg }),
		NeogitDiffAddHighlight({ bg = c.diff_add, fg = c.fg }),
		NeogitDiffDelete({ bg = c.diff_delete, fg = c.fg }),
		NeogitDiffDeleteHighlight({ bg = c.diff_delete, fg = c.fg }),
		NeogitDiffHeader({ bg = c.bg_darker, fg = c.border, gui = "bold" }),
		NeogitDiffHeaderHighlight({ bg = c.bg_highlight, fg = c.border, gui = "bold" }),
		NeogitCommitViewHeader({ bg = c.bg_darker }),
		NeogitFilePath({ fg = c.fg, gui = "italic" }),
		NeogitFold({ fg = c.comment }),
		NeogitGraphAuthor({ fg = c.func }),
		NeogitGraphBlue({ fg = p.blue }),
		NeogitGraphBoldBlue({ fg = p.blue, gui = "bold" }),
		NeogitGraphBoldCyan({ fg = p.teal, gui = "bold" }),
		NeogitGraphBoldGray({ fg = c.fg_muted, gui = "bold" }),
		NeogitGraphBoldGreen({ fg = p.forest_green, gui = "bold" }),
		NeogitGraphBoldOrange({ fg = c.border, gui = "bold" }),
		NeogitGraphBoldPurple({ fg = c.func, gui = "bold" }),
		NeogitGraphBoldRed({ fg = c.error, gui = "bold" }),
		NeogitGraphBoldWhite({ fg = c.fg, gui = "bold" }),
		NeogitGraphBoldYellow({ fg = c.warning, gui = "bold" }),
		NeogitGraphCyan({ fg = p.teal }),
		NeogitGraphGray({ fg = c.fg_muted }),
		NeogitGraphGreen({ fg = p.forest_green }),
		NeogitGraphOrange({ fg = c.border }),
		NeogitGraphPurple({ fg = c.func }),
		NeogitGraphRed({ fg = c.error }),
		NeogitGraphWhite({ fg = c.fg }),
		NeogitGraphYellow({ fg = c.warning }),
		NeogitNotificationError({ fg = c.error }),
		NeogitNotificationInfo({ fg = c.info }),
		NeogitNotificationWarning({ fg = c.warning }),
		NeogitPopupActionKey({ fg = c.border }),
		NeogitPopupBold({ gui = "bold" }),
		NeogitPopupBranchName({ fg = c.func }),
		NeogitPopupConfigEnabled({ fg = c.ok }),
		NeogitPopupConfigDisabled({ fg = c.fg_muted }),
		NeogitPopupOptionKey({ fg = c.border }),
		NeogitPopupSectionTitle({ fg = c.border, gui = "bold" }),
		NeogitPopupSwitchEnabled({ fg = c.ok }),
		NeogitPopupSwitchDisabled({ fg = c.fg_muted }),
		NeogitPopupSwitchKey({ fg = c.border }),
		NeogitRebaseDone({ fg = c.ok }),
		NeogitReverting({ fg = c.warning }),
		NeogitSectionHeader({ fg = c.border, gui = "bold" }),
		NeogitStash({ fg = c.comment }),
		NeogitStatusHEAD({ fg = c.func }),
		NeogitTagDistance({ fg = c.comment }),
		NeogitTagName({ fg = c.warning }),
		NeogitUnmergedInto({ fg = c.func }),
		NeogitUnpulledFrom({ fg = c.func }),
		NeogitUnpushedTo({ fg = c.func }),
		NeogitUntrackedfiles({ fg = c.func }),

		-- Change types
		NeogitChangeAdded({ fg = c.git_add }),
		NeogitChangeBothModified({ fg = c.warning }),
		NeogitChangeCopied({ fg = c.info }),
		NeogitChangeDeleted({ fg = c.git_delete }),
		NeogitChangeModified({ fg = c.git_change }),
		NeogitChangeNewFile({ fg = c.git_add }),
		NeogitChangeRenamed({ fg = c.info }),
		NeogitChangeUpdated({ fg = c.git_change }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Nvim-tree                        │
		-- └────────────────────────────────────────────────────┘

		NvimTreeNormal({ bg = c.bg_dark, fg = c.fg }),
		NvimTreeNormalNC({ NvimTreeNormal }),
		NvimTreeRootFolder({ fg = c.border, gui = "bold" }),
		NvimTreeFolderName({ fg = p.teal }),
		NvimTreeFolderIcon({ fg = c.border }),
		NvimTreeEmptyFolderName({ fg = c.fg_muted }),
		NvimTreeOpenedFolderName({ fg = p.teal, gui = "bold" }),
		NvimTreeSymlinkFolderName({ fg = p.teal }),
		NvimTreeOpenedFile({ fg = c.border }),
		NvimTreeModifiedFile({ fg = c.warning }),
		NvimTreeSpecialFile({ fg = c.special }),
		NvimTreeExecFile({ fg = c.ok }),
		NvimTreeImageFile({ fg = c.func }),
		NvimTreeIndentMarker({ fg = c.comment }),
		NvimTreeSymlink({ fg = c.info }),
		NvimTreeGitDirty({ fg = c.git_change }),
		NvimTreeGitStaged({ fg = c.git_add }),
		NvimTreeGitMerge({ fg = c.warning }),
		NvimTreeGitRenamed({ fg = c.info }),
		NvimTreeGitNew({ fg = c.git_add }),
		NvimTreeGitDeleted({ fg = c.git_delete }),
		NvimTreeGitIgnored({ fg = c.fg_muted }),
		NvimTreeWindowPicker({ bg = c.border, fg = c.bg, gui = "bold" }),
		NvimTreeCursorLine({ bg = c.bg_highlight }),
		NvimTreeWinSeparator({ fg = c.bg_darker, bg = c.bg_dark }),
		NvimTreeCopiedHL({ fg = c.info }),
		NvimTreeCutHL({ fg = c.error }),
		NvimTreeBookmark({ fg = c.border }),
		NvimTreeBookmarkHL({ fg = c.border, gui = "bold" }),
		NvimTreeLiveFilterPrefix({ fg = c.border }),
		NvimTreeLiveFilterValue({ fg = c.fg, gui = "bold" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Obsidian.nvim                    │
		-- └────────────────────────────────────────────────────┘

		ObsidianTodo({ fg = c.border, gui = "bold" }),
		ObsidianDone({ fg = c.ok, gui = "bold" }),
		ObsidianRightArrow({ fg = c.border }),
		ObsidianTilde({ fg = c.error }),
		ObsidianBullet({ fg = c.info }),
		ObsidianRefText({ fg = c.func, gui = "underline" }),
		ObsidianExtLinkIcon({ fg = c.func }),
		ObsidianTag({ fg = c.info, gui = "italic" }),
		ObsidianHighlightText({ bg = c.warning, fg = c.bg }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Neotest                          │
		-- └────────────────────────────────────────────────────┘

		NeotestAdapterName({ fg = c.func, gui = "bold" }),
		NeotestBorder({ fg = c.border }),
		NeotestDir({ fg = p.teal }),
		NeotestExpandMarker({ fg = c.comment }),
		NeotestFailed({ fg = c.error }),
		NeotestFile({ fg = c.fg }),
		NeotestFocused({ gui = "bold,underline" }),
		NeotestIndent({ fg = c.comment }),
		NeotestMarked({ fg = c.border, gui = "bold" }),
		NeotestNamespace({ fg = c.namespace }),
		NeotestPassed({ fg = c.ok }),
		NeotestRunning({ fg = c.warning }),
		NeotestSkipped({ fg = c.info }),
		NeotestTarget({ fg = c.error }),
		NeotestTest({ fg = c.fg }),
		NeotestUnknown({ fg = c.fg_muted }),
		NeotestWatching({ fg = c.warning }),
		NeotestWinSelect({ fg = c.border, gui = "bold" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Nvim-dap                         │
		-- └────────────────────────────────────────────────────┘

		DapBreakpoint({ fg = c.error }),
		DapBreakpointCondition({ fg = c.warning }),
		DapBreakpointRejected({ fg = c.fg_muted }),
		DapLogPoint({ fg = c.info }),
		DapStopped({ fg = c.ok }),
		DapStoppedLine({ bg = c.bg_highlight }),

		-- DAP UI
		DapUIScope({ fg = c.border }),
		DapUIType({ fg = c.type }),
		DapUIValue({ fg = c.fg }),
		DapUIModifiedValue({ fg = c.border, gui = "bold" }),
		DapUIDecoration({ fg = c.border }),
		DapUIThread({ fg = c.ok }),
		DapUIStoppedThread({ fg = c.border }),
		DapUIFrameName({ fg = c.fg }),
		DapUISource({ fg = c.func }),
		DapUILineNumber({ fg = c.line_nr }),
		DapUIFloatNormal({ NormalFloat }),
		DapUIFloatBorder({ fg = c.border }),
		DapUIWatchesEmpty({ fg = c.error }),
		DapUIWatchesValue({ fg = c.ok }),
		DapUIWatchesError({ fg = c.error }),
		DapUIBreakpointsPath({ fg = p.teal }),
		DapUIBreakpointsInfo({ fg = c.info }),
		DapUIBreakpointsCurrentLine({ fg = c.ok, gui = "bold" }),
		DapUIBreakpointsLine({ DapUILineNumber }),
		DapUIBreakpointsDisabledLine({ fg = c.fg_muted }),
		DapUICurrentFrameName({ fg = c.ok, gui = "bold" }),
		DapUIStepOver({ fg = c.info }),
		DapUIStepInto({ fg = c.info }),
		DapUIStepBack({ fg = c.info }),
		DapUIStepOut({ fg = c.info }),
		DapUIStop({ fg = c.error }),
		DapUIPlayPause({ fg = c.ok }),
		DapUIRestart({ fg = c.ok }),
		DapUIUnavailable({ fg = c.fg_muted }),
		DapUIWinSelect({ fg = c.border, gui = "bold" }),
		DapUIEndofBuffer({ fg = c.bg_dark }),
		DapUINormal({ NormalFloat }),
		DapUINormalNC({ NormalFloat }),
		DapUIPlayPauseNC({ fg = c.ok }),
		DapUIRestartNC({ fg = c.ok }),
		DapUIStopNC({ fg = c.error }),
		DapUIStepOverNC({ fg = c.info }),
		DapUIStepIntoNC({ fg = c.info }),
		DapUIStepBackNC({ fg = c.info }),
		DapUIStepOutNC({ fg = c.info }),
		DapUIUnavailableNC({ fg = c.fg_muted }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Octo.nvim                        │
		-- └────────────────────────────────────────────────────┘

		OctoEditable({ bg = c.bg_dark }),
		OctoBubble({ bg = c.bg_darker, fg = c.fg }),
		OctoUser({ fg = c.func }),
		OctoUserViewer({ fg = c.ok }),
		OctoReaction({ fg = c.warning }),
		OctoReactionViewer({ fg = c.ok }),
		OctoPassingTest({ fg = c.ok }),
		OctoFailingTest({ fg = c.error }),
		OctoPullAdditions({ fg = c.git_add }),
		OctoPullDeletions({ fg = c.git_delete }),
		OctoPullModifications({ fg = c.git_change }),
		OctoIssueId({ fg = c.func }),
		OctoIssueTitle({ fg = c.fg, gui = "bold" }),
		OctoEmpty({ fg = c.fg_muted }),
		OctoTimelineItemHeading({ fg = c.border, gui = "bold" }),
		OctoTimelineMarker({ fg = c.border }),
		OctoSymbol({ fg = c.comment }),
		OctoDate({ fg = c.comment }),
		OctoStateOpen({ fg = c.ok }),
		OctoStateClosed({ fg = c.error }),
		OctoStateMerged({ fg = c.func }),
		OctoStatePending({ fg = c.warning }),
		OctoStateApproved({ fg = c.ok }),
		OctoStateChangesRequested({ fg = c.warning }),
		OctoStateCommented({ fg = c.info }),
		OctoStateDismissed({ fg = c.fg_muted }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   ToggleTerm                       │
		-- └────────────────────────────────────────────────────┘

		ToggleTermNormal({ bg = c.bg_dark }),
		ToggleTermNormalFloat({ bg = c.bg_dark }),
		ToggleTermFloatBorder({ fg = c.border, bg = c.bg_dark }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Snacks.nvim                      │
		-- └────────────────────────────────────────────────────┘

		SnacksNormal({ bg = c.bg_dark }),
		SnacksDashboardNormal({ bg = c.bg }),
		SnacksDashboardDesc({ fg = c.fg }),
		SnacksDashboardFile({ fg = c.fg }),
		SnacksDashboardDir({ fg = c.comment }),
		SnacksDashboardFooter({ fg = c.comment }),
		SnacksDashboardHeader({ fg = c.border }),
		SnacksDashboardIcon({ fg = c.border }),
		SnacksDashboardKey({ fg = c.border, gui = "bold" }),
		SnacksDashboardSpecial({ fg = c.special }),
		SnacksDashboardTitle({ fg = c.border, gui = "bold" }),
		SnacksNotifierInfo({ fg = c.info }),
		SnacksNotifierWarn({ fg = c.warning }),
		SnacksNotifierError({ fg = c.error }),
		SnacksNotifierDebug({ fg = c.comment }),
		SnacksNotifierTrace({ fg = c.hint }),
		SnacksNotifierIconInfo({ fg = c.info }),
		SnacksNotifierIconWarn({ fg = c.warning }),
		SnacksNotifierIconError({ fg = c.error }),
		SnacksNotifierIconDebug({ fg = c.comment }),
		SnacksNotifierIconTrace({ fg = c.hint }),
		SnacksNotifierTitleInfo({ fg = c.info, gui = "bold" }),
		SnacksNotifierTitleWarn({ fg = c.warning, gui = "bold" }),
		SnacksNotifierTitleError({ fg = c.error, gui = "bold" }),
		SnacksNotifierTitleDebug({ fg = c.comment, gui = "bold" }),
		SnacksNotifierTitleTrace({ fg = c.hint, gui = "bold" }),
		SnacksNotifierBorderInfo({ fg = c.info }),
		SnacksNotifierBorderWarn({ fg = c.warning }),
		SnacksNotifierBorderError({ fg = c.error }),
		SnacksNotifierBorderDebug({ fg = c.comment }),
		SnacksNotifierBorderTrace({ fg = c.hint }),
		SnacksNotifierFooterInfo({ fg = c.info }),
		SnacksNotifierFooterWarn({ fg = c.warning }),
		SnacksNotifierFooterError({ fg = c.error }),
		SnacksNotifierFooterDebug({ fg = c.comment }),
		SnacksNotifierFooterTrace({ fg = c.hint }),
		SnacksIndent({ fg = p.white_gray.da(15) }),
		SnacksIndentScope({ fg = c.border }),
		SnacksIndentChunk({ fg = c.border }),
		SnacksInputNormal({ bg = c.bg_dark }),
		SnacksInputBorder({ fg = c.border }),
		SnacksInputTitle({ fg = c.border, gui = "bold" }),
		SnacksScratchKey({ fg = c.border }),
		SnacksScratchDesc({ fg = c.fg }),
		SnacksZenIcon({ fg = c.border }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Grug-far.nvim                    │
		-- └────────────────────────────────────────────────────┘

		GrugFarHelpHeader({ fg = c.border, gui = "bold" }),
		GrugFarHelpHeaderKey({ fg = c.border }),
		GrugFarInputLabel({ fg = c.func }),
		GrugFarInputPlaceholder({ fg = c.fg_muted }),
		GrugFarResultsHeader({ fg = c.border, gui = "bold" }),
		GrugFarResultsMatch({ bg = c.bg_search, fg = c.fg }),
		GrugFarResultsStats({ fg = c.comment }),
		GrugFarResultsLineColumn({ fg = c.comment }),
		GrugFarResultsLineNo({ fg = c.line_nr }),
		GrugFarResultsPath({ fg = p.teal }),
		GrugFarResultsChangeIndicator({ fg = c.git_change }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Blame.nvim                       │
		-- └────────────────────────────────────────────────────┘

		BlameDate({ fg = c.comment }),
		BlameBorder({ fg = c.comment }),
		BlameHash({ fg = c.func }),
		BlameAuthor({ fg = c.border }),
		BlameSummary({ fg = c.fg }),
		BlameVirtText({ fg = c.comment }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Helpview.nvim                    │
		-- └────────────────────────────────────────────────────┘

		HelpviewCode({ bg = c.bg_dark }),
		HelpviewCodeLanguage({ fg = c.comment }),
		HelpviewInlineCode({ bg = c.bg_dark }),
		HelpviewHeading1({ fg = p.teal, gui = "bold" }),
		HelpviewHeading2({ fg = p.teal.li(10), gui = "bold" }),
		HelpviewHeading3({ fg = p.teal.li(20), gui = "bold" }),
		HelpviewHeading4({ fg = c.func, gui = "bold" }),
		HelpviewTaglink({ fg = c.func, gui = "underline" }),
		HelpviewOptionlink({ fg = c.func }),
		HelpviewMentionlink({ fg = c.info }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Markdown.nvim                    │
		-- └────────────────────────────────────────────────────┘

		MarkdownHeading1({ fg = p.teal, gui = "bold" }),
		MarkdownHeading2({ fg = p.teal.li(10), gui = "bold" }),
		MarkdownHeading3({ fg = p.teal.li(20), gui = "bold" }),
		MarkdownHeading4({ fg = c.func, gui = "bold" }),
		MarkdownHeading5({ fg = c.func }),
		MarkdownHeading6({ fg = c.comment }),
		MarkdownCode({ bg = c.bg_dark }),
		MarkdownCodeBlock({ bg = c.bg_dark }),
		MarkdownQuote({ fg = c.comment, gui = "italic" }),
		MarkdownListMarker({ fg = c.special }),
		MarkdownOrderedListMarker({ fg = c.special }),
		MarkdownRule({ fg = c.comment }),
		MarkdownLink({ fg = c.func, gui = "underline" }),
		MarkdownLinkText({ fg = c.include }),
		MarkdownUrl({ fg = p.teal.li(20), gui = "underline" }),
		MarkdownImage({ fg = c.func }),
		MarkdownImageLink({ fg = c.func }),
		MarkdownBold({ gui = "bold" }),
		MarkdownItalic({ gui = "italic" }),
		MarkdownStrikethrough({ gui = "strikethrough" }),
		MarkdownFootnote({ fg = c.info }),
		MarkdownFootnoteDefinition({ fg = c.info }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Mason.nvim                       │
		-- └────────────────────────────────────────────────────┘

		MasonNormal({ bg = c.bg_dark }),
		MasonHeader({ bg = c.border, fg = c.bg, gui = "bold" }),
		MasonHeaderSecondary({ bg = c.func, fg = c.bg, gui = "bold" }),
		MasonHighlight({ fg = c.func }),
		MasonHighlightBlock({ bg = c.func, fg = c.bg }),
		MasonHighlightBlockBold({ bg = c.func, fg = c.bg, gui = "bold" }),
		MasonHighlightSecondary({ fg = c.border }),
		MasonHighlightBlockSecondary({ bg = c.border, fg = c.bg }),
		MasonHighlightBlockBoldSecondary({ bg = c.border, fg = c.bg, gui = "bold" }),
		MasonMuted({ fg = c.fg_muted }),
		MasonMutedBlock({ bg = c.bg_darker, fg = c.fg_muted }),
		MasonMutedBlockBold({ bg = c.bg_darker, fg = c.fg_muted, gui = "bold" }),
		MasonError({ fg = c.error }),
		MasonWarning({ fg = c.warning }),
		MasonHeading({ fg = c.border, gui = "bold" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Nvim-highlight-colors            │
		-- └────────────────────────────────────────────────────┘
		-- This plugin creates dynamic highlight groups, so we just need
		-- to ensure the base groups look good

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Range-highlight.nvim             │
		-- └────────────────────────────────────────────────────┘

		RangeHighlight({ bg = c.bg_highlight }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Actions-preview.nvim             │
		-- └────────────────────────────────────────────────────┘
		-- Uses telescope highlights mostly, but adding specific ones

		ActionsPreviewNormal({ bg = c.bg_dark }),
		ActionsPreviewBorder({ fg = c.border }),
		ActionsPreviewTitle({ fg = c.border, gui = "bold" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   CodeCompanion                    │
		-- └────────────────────────────────────────────────────┘

		CodeCompanionChatHeader({ fg = c.border, gui = "bold" }),
		CodeCompanionChatSeparator({ fg = c.comment }),
		CodeCompanionChatTokens({ fg = c.comment }),
		CodeCompanionChatTool({ fg = c.func }),
		CodeCompanionChatVariable({ fg = c.variable }),
		CodeCompanionVirtualText({ fg = c.comment, gui = "italic" }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Image.nvim                       │
		-- └────────────────────────────────────────────────────┘
		-- This plugin renders images, minimal highlight needs

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Markdown-preview.nvim            │
		-- └────────────────────────────────────────────────────┘
		-- This plugin opens in browser, no neovim highlights needed

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Nvim-metals (Scala)              │
		-- └────────────────────────────────────────────────────┘

		MetalsStatus({ fg = c.comment }),
		MetalsStatusWarn({ fg = c.warning }),
		MetalsStatusError({ fg = c.error }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   Copilot                          │
		-- └────────────────────────────────────────────────────┘

		CopilotSuggestion({ fg = c.fg_muted }),
		CopilotAnnotation({ fg = c.fg_muted }),

		-- ┌────────────────────────────────────────────────────┐
		-- │                   No-neck-pain.nvim                │
		-- └────────────────────────────────────────────────────┘

		NoNeckPain({ bg = c.bg }),
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
