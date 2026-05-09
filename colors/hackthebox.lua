-- hackthebox colorscheme
-- ported from https://github.com/audibleblink/hackthebox.vim
-- Set `vim.g.hackthebox_transparent = false` before `:colorscheme hackthebox`
-- to use a solid background. Toggle at runtime with `:HackTheBoxToggle`.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "hackthebox"

local c = {
	red          = "#ff8484",
	dark_red     = "#ff3e3e",
	green        = "#c5f467",
	yellow       = "#ffcc5c",
	dark_yellow  = "#ffaf00",
	blue         = "#5cb2ff",
	purple       = "#c16cfa",
	cyan         = "#5cecc6",
	white        = "#ffffff",
	black        = "#141d2b",
	comment_grey = "#5c6370",
	gutter_grey  = "#636d83",
	cursor_grey  = "#2c323c",
	visual_grey  = "#3e4452",
	special_grey = "#3b4048",
	vertsplit    = "#181a1f",
}

local hl = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

local function apply(transparent)
	local bg = transparent and "NONE" or c.black

	local groups = {
		-- Syntax
		Comment        = { fg = c.comment_grey, italic = true },
		Constant       = { fg = c.cyan },
		String         = { fg = c.green },
		Character      = { fg = c.green },
		Number         = { fg = c.dark_yellow },
		Boolean        = { fg = c.dark_yellow },
		Float          = { fg = c.dark_yellow },
		Identifier     = { fg = c.red },
		Function       = { fg = c.blue },
		Statement      = { fg = c.purple },
		Conditional    = { fg = c.purple },
		Repeat         = { fg = c.purple },
		Label          = { fg = c.purple },
		Operator       = {},
		Keyword        = { fg = c.red },
		Exception      = { fg = c.purple },
		PreProc        = { fg = c.yellow },
		Include        = { fg = c.blue },
		Define         = { fg = c.purple },
		Macro          = { fg = c.purple },
		PreCondit      = { fg = c.yellow },
		Type           = { fg = c.yellow },
		StorageClass   = { fg = c.yellow },
		Structure      = { fg = c.yellow },
		Typedef        = { fg = c.yellow },
		Special        = { fg = c.blue },
		SpecialChar    = {},
		Tag            = {},
		Delimiter      = {},
		SpecialComment = {},
		Debug          = {},
		Underlined     = {},
		Ignore         = {},
		Error          = { fg = c.red },
		Todo           = { fg = c.purple },

		-- UI
		ColorColumn    = { bg = c.cursor_grey },
		Conceal        = {},
		Cursor         = { fg = c.black, bg = c.blue },
		CursorIM       = {},
		CursorColumn   = { bg = c.cursor_grey },
		CursorLine     = { bg = c.cursor_grey },
		Directory      = { fg = c.blue },
		DiffAdd        = { fg = c.green },
		DiffChange     = { fg = c.dark_yellow },
		DiffDelete     = { fg = c.red },
		DiffText       = { fg = c.blue },
		ErrorMsg       = { fg = c.red },
		VertSplit      = { fg = c.vertsplit, bg = bg },
		WinSeparator   = { fg = c.vertsplit, bg = bg },
		Folded         = { fg = c.comment_grey, bg = bg },
		FoldColumn     = { bg = bg },
		SignColumn     = { bg = bg },
		IncSearch      = { fg = c.black, bg = c.yellow },
		CurSearch      = { fg = c.black, bg = c.yellow },
		LineNr         = { fg = c.gutter_grey, bg = bg },
		LineNrAbove    = { fg = c.gutter_grey, bg = bg },
		LineNrBelow    = { fg = c.gutter_grey, bg = bg },
		CursorLineNr   = { fg = c.yellow, bg = bg, bold = true },
		MatchParen     = { fg = c.blue, underline = true },
		ModeMsg        = {},
		MoreMsg        = { fg = c.green },
		MsgArea        = { bg = bg },
		MsgSeparator   = { fg = c.vertsplit, bg = bg },
		NonText        = { fg = c.special_grey },
		Normal         = { fg = c.white, bg = bg },
		NormalNC       = { fg = c.white, bg = bg },
		NormalFloat    = { fg = c.white, bg = bg },
		FloatBorder    = { fg = c.comment_grey, bg = bg },
		FloatTitle     = { fg = c.yellow, bg = bg, bold = true },
		FloatFooter    = { fg = c.comment_grey, bg = bg },
		Pmenu          = { fg = c.white, bg = bg },
		PmenuSel       = { fg = c.black, bg = c.blue, bold = true },
		PmenuSbar      = { bg = c.special_grey },
		PmenuThumb     = { bg = c.comment_grey },
		PmenuKind      = { fg = c.yellow, bg = bg },
		PmenuKindSel   = { fg = c.black, bg = c.blue },
		PmenuExtra     = { fg = c.comment_grey, bg = bg },
		PmenuExtraSel  = { fg = c.black, bg = c.blue },
		Question       = { fg = c.purple },
		QuickFixLine   = { bg = c.cursor_grey },
		Search         = { fg = c.black, bg = c.yellow },
		SpecialKey     = { fg = c.special_grey },
		SpellBad       = { sp = c.red, undercurl = true },
		SpellCap       = { sp = c.dark_yellow, undercurl = true },
		SpellLocal     = { sp = c.dark_yellow, undercurl = true },
		SpellRare      = { sp = c.dark_yellow, undercurl = true },
		StatusLine     = { fg = c.white, bg = bg },
		StatusLineNC   = { fg = c.comment_grey, bg = bg },
		TabLine        = { fg = c.comment_grey, bg = bg },
		TabLineFill    = { bg = bg },
		TabLineSel     = { fg = c.white, bg = bg, bold = true },
		Title          = { fg = c.white, bold = true },
		Visual         = { bg = c.visual_grey },
		VisualNOS      = { bg = c.visual_grey },
		WarningMsg     = { fg = c.yellow },
		WildMenu       = { fg = c.black, bg = c.blue },
		Whitespace     = { fg = c.special_grey },
		WinBar         = { fg = c.white, bg = bg },
		WinBarNC       = { fg = c.comment_grey, bg = bg },

		-- LSP / Diagnostics
		LspReferenceText             = { bg = c.visual_grey },
		LspReferenceRead             = { bg = c.visual_grey },
		LspReferenceWrite            = { bg = c.visual_grey },
		LspCodeLens                  = { fg = c.comment_grey },
		LspCodeLensSeparator         = { fg = c.comment_grey },
		LspSignatureActiveParameter  = { fg = c.dark_yellow, bold = true },
		LspInlayHint                 = { fg = c.comment_grey, bg = bg, italic = true },

		DiagnosticError  = { fg = c.dark_red },
		DiagnosticWarn   = { fg = c.yellow },
		DiagnosticInfo   = { fg = c.blue },
		DiagnosticHint   = { fg = c.cyan },
		DiagnosticOk     = { fg = c.green },

		DiagnosticSignError = { fg = c.dark_red, bg = bg },
		DiagnosticSignWarn  = { fg = c.yellow, bg = bg },
		DiagnosticSignInfo  = { fg = c.blue, bg = bg },
		DiagnosticSignHint  = { fg = c.cyan, bg = bg },
		DiagnosticSignOk    = { fg = c.green, bg = bg },

		DiagnosticUnderlineError = { undercurl = true, sp = c.red },
		DiagnosticUnderlineWarn  = { undercurl = true, sp = c.yellow },
		DiagnosticUnderlineInfo  = { undercurl = true, sp = c.blue },
		DiagnosticUnderlineHint  = { undercurl = true, sp = c.cyan },
		DiagnosticUnderlineOk    = { undercurl = true, sp = c.green },

		DiagnosticVirtualTextError = { fg = c.red, bg = bg, italic = true },
		DiagnosticVirtualTextWarn  = { fg = c.yellow, bg = bg, italic = true },
		DiagnosticVirtualTextInfo  = { fg = c.blue, bg = bg, italic = true },
		DiagnosticVirtualTextHint  = { fg = c.cyan, bg = bg, italic = true },
		DiagnosticVirtualTextOk    = { fg = c.green, bg = bg, italic = true },

		DiagnosticFloatingError = { fg = c.dark_red, bg = bg },
		DiagnosticFloatingWarn  = { fg = c.yellow, bg = bg },
		DiagnosticFloatingInfo  = { fg = c.blue, bg = bg },
		DiagnosticFloatingHint  = { fg = c.cyan, bg = bg },
		DiagnosticFloatingOk    = { fg = c.green, bg = bg },

		DiagnosticDeprecated   = { fg = c.comment_grey, strikethrough = true },
		DiagnosticUnnecessary  = { fg = c.comment_grey, italic = true },

		-- Treesitter
		["@comment"]               = { link = "Comment" },
		["@string"]                = { link = "String" },
		["@number"]                = { link = "Number" },
		["@boolean"]               = { link = "Boolean" },
		["@float"]                 = { link = "Float" },
		["@constant"]              = { link = "Constant" },
		["@constant.builtin"]      = { fg = c.dark_yellow },
		["@function"]              = { link = "Function" },
		["@function.builtin"]      = { fg = c.blue },
		["@function.call"]         = { fg = c.blue },
		["@method"]                = { fg = c.blue },
		["@method.call"]           = { fg = c.blue },
		["@keyword"]               = { fg = c.purple },
		["@keyword.return"]        = { fg = c.purple },
		["@keyword.function"]      = { fg = c.purple },
		["@keyword.operator"]      = { fg = c.purple },
		["@conditional"]           = { fg = c.purple },
		["@repeat"]                = { fg = c.purple },
		["@operator"]              = { fg = c.white },
		["@variable"]              = { fg = c.white },
		["@variable.builtin"]      = { fg = c.red },
		["@parameter"]             = { fg = c.red },
		["@field"]                 = { fg = c.red },
		["@property"]              = { fg = c.red },
		["@type"]                  = { fg = c.yellow },
		["@type.builtin"]          = { fg = c.yellow },
		["@constructor"]           = { fg = c.yellow },
		["@punctuation.delimiter"] = { fg = c.white },
		["@punctuation.bracket"]   = { fg = c.white },
		["@tag"]                   = { fg = c.red },
		["@tag.attribute"]         = { fg = c.dark_yellow },
		["@tag.delimiter"]         = { fg = c.white },
		["@string.escape"]         = { fg = c.cyan },
		["@string.regex"]          = { fg = c.cyan },

		-- LSP semantic tokens
		["@lsp.type.class"]         = { link = "@type" },
		["@lsp.type.decorator"]     = { link = "@function" },
		["@lsp.type.enum"]          = { link = "@type" },
		["@lsp.type.enumMember"]    = { link = "@constant" },
		["@lsp.type.function"]      = { link = "@function" },
		["@lsp.type.interface"]     = { link = "@type" },
		["@lsp.type.macro"]         = { link = "@macro" },
		["@lsp.type.method"]        = { link = "@method" },
		["@lsp.type.namespace"]     = { link = "@namespace" },
		["@lsp.type.parameter"]     = { link = "@parameter" },
		["@lsp.type.property"]      = { link = "@property" },
		["@lsp.type.struct"]        = { link = "@type" },
		["@lsp.type.type"]          = { link = "@type" },
		["@lsp.type.typeParameter"] = { link = "@type" },
		["@lsp.type.variable"]      = { link = "@variable" },

		-- Git
		SignifySignAdd    = { fg = c.green, bg = bg },
		SignifySignChange = { fg = c.yellow, bg = bg },
		SignifySignDelete = { fg = c.red, bg = bg },
		GitGutterAdd      = { link = "SignifySignAdd" },
		GitGutterChange   = { link = "SignifySignChange" },
		GitGutterDelete   = { link = "SignifySignDelete" },
		GitSignsAdd       = { fg = c.green, bg = bg },
		GitSignsChange    = { fg = c.yellow, bg = bg },
		GitSignsDelete    = { fg = c.red, bg = bg },
		diffAdded         = { fg = c.green },
		diffRemoved       = { fg = c.red },
		diffChanged       = { fg = c.yellow },
		diffFile          = { fg = c.blue },
		diffNewFile       = { fg = c.green },
		diffOldFile       = { fg = c.red },
		diffLine          = { fg = c.purple },
		diffIndexLine     = { fg = c.cyan },

		-- Markdown
		markdownCode             = { fg = c.green },
		markdownCodeBlock        = { fg = c.green },
		markdownCodeDelimiter    = { fg = c.green },
		markdownHeadingDelimiter = { fg = c.red },
		markdownRule             = { fg = c.comment_grey },
		markdownHeadingRule      = { fg = c.comment_grey },
		markdownH1               = { fg = c.red, bold = true },
		markdownH2               = { fg = c.red, bold = true },
		markdownH3               = { fg = c.red, bold = true },
		markdownH4               = { fg = c.red, bold = true },
		markdownH5               = { fg = c.red, bold = true },
		markdownH6               = { fg = c.red, bold = true },
		markdownBlockquote       = { fg = c.comment_grey },
		markdownItalic           = { fg = c.purple, italic = true },
		markdownBold             = { fg = c.dark_yellow, bold = true },
		markdownListMarker       = { fg = c.red },
		markdownLinkText         = { fg = c.blue, underline = true },
		markdownUrl              = { fg = c.purple, underline = true },

		-- mini.statusline
		MiniStatuslineModeNormal   = { fg = c.black, bg = c.blue, bold = true },
		MiniStatuslineModeInsert   = { fg = c.black, bg = c.green, bold = true },
		MiniStatuslineModeVisual   = { fg = c.black, bg = c.purple, bold = true },
		MiniStatuslineModeReplace  = { fg = c.black, bg = c.red, bold = true },
		MiniStatuslineModeCommand  = { fg = c.black, bg = c.yellow, bold = true },
		MiniStatuslineModeOther    = { fg = c.black, bg = c.cyan, bold = true },
		MiniStatuslineDevinfo      = { fg = c.white, bg = c.cursor_grey },
		MiniStatuslineFilename     = { fg = c.comment_grey, bg = bg },
		MiniStatuslineFileinfo     = { fg = c.white, bg = c.cursor_grey },
		MiniStatuslineInactive     = { fg = c.comment_grey, bg = bg },

		-- mini.tabline
		MiniTablineCurrent         = { fg = c.white, bg = c.cursor_grey, bold = true },
		MiniTablineVisible         = { fg = c.white, bg = bg },
		MiniTablineHidden          = { fg = c.comment_grey, bg = bg },
		MiniTablineModifiedCurrent = { fg = c.yellow, bg = c.cursor_grey, bold = true },
		MiniTablineModifiedVisible = { fg = c.yellow, bg = bg },
		MiniTablineModifiedHidden  = { fg = c.dark_yellow, bg = bg },
		MiniTablineFill            = { bg = bg },
		MiniTablineTabpagesection  = { fg = c.black, bg = c.blue, bold = true },
		MiniTablineTrunc           = { fg = c.comment_grey, bg = bg },

		-- mini.pick
		MiniPickBorder              = { fg = c.comment_grey, bg = bg },
		MiniPickBorderBusy          = { fg = c.yellow, bg = bg },
		MiniPickBorderText          = { fg = c.yellow, bg = bg, bold = true },
		MiniPickHeader              = { fg = c.yellow, bg = bg, bold = true },
		MiniPickIconDirectory       = { fg = c.blue, bg = bg },
		MiniPickIconFile            = { fg = c.white, bg = bg },
		MiniPickMatchCurrent        = { bg = c.cursor_grey },
		MiniPickMatchMarked         = { bg = c.visual_grey },
		MiniPickMatchRanges         = { fg = c.yellow, bg = bg, bold = true },
		MiniPickNormal              = { fg = c.white, bg = bg },
		MiniPickPreviewLine         = { bg = c.cursor_grey },
		MiniPickPreviewRegion       = { bg = c.visual_grey },
		MiniPickPrompt              = { fg = c.purple, bg = bg, bold = true },
		MiniPickPromptCaret         = { fg = c.white, bg = bg },
		MiniPickPromptPrefix        = { fg = c.purple, bg = bg },

		-- mini.notify
		MiniNotifyBorder = { fg = c.comment_grey, bg = bg },
		MiniNotifyNormal = { fg = c.white, bg = bg },
		MiniNotifyTitle  = { fg = c.yellow, bg = bg, bold = true },
		MiniNotifyLvlERROR = { fg = c.dark_red },
		MiniNotifyLvlWARN  = { fg = c.yellow },
		MiniNotifyLvlINFO  = { fg = c.blue },
		MiniNotifyLvlDEBUG = { fg = c.comment_grey },
		MiniNotifyLvlTRACE = { fg = c.purple },
		MiniNotifyLvlOFF   = { fg = c.comment_grey },

		-- mini.completion
		MiniCompletionActiveParameter = { underline = true, bold = true },

		-- mini.icons
		MiniIconsAzure  = { fg = c.cyan },
		MiniIconsBlue   = { fg = c.blue },
		MiniIconsCyan   = { fg = c.cyan },
		MiniIconsGreen  = { fg = c.green },
		MiniIconsGrey   = { fg = c.comment_grey },
		MiniIconsOrange = { fg = c.dark_yellow },
		MiniIconsPurple = { fg = c.purple },
		MiniIconsRed    = { fg = c.red },
		MiniIconsYellow = { fg = c.yellow },

		-- mini.jump2d
		MiniJump2dSpot       = { fg = c.yellow, bg = bg, bold = true, nocombine = true },
		MiniJump2dSpotAhead  = { fg = c.cyan, bg = bg, nocombine = true },
		MiniJump2dSpotUnique = { fg = c.dark_yellow, bg = bg, bold = true, nocombine = true },
		MiniJump2dDim        = { fg = c.comment_grey, nocombine = true },

		-- mini.jump
		MiniJump = { fg = c.black, bg = c.yellow, bold = true },

		-- mini.surround
		MiniSurround = { fg = c.black, bg = c.yellow },

		-- mini.cursorword / mini.indentscope / etc.
		MiniCursorword         = { underline = true },
		MiniCursorwordCurrent  = { underline = true },
		MiniIndentscopeSymbol  = { fg = c.comment_grey, nocombine = true },
		MiniIndentscopePrefix  = { nocombine = true },
		MiniTrailspace         = { bg = c.dark_red },
		MiniHipatternsFixme    = { fg = c.black, bg = c.red, bold = true },
		MiniHipatternsHack     = { fg = c.black, bg = c.yellow, bold = true },
		MiniHipatternsTodo     = { fg = c.black, bg = c.blue, bold = true },
		MiniHipatternsNote     = { fg = c.black, bg = c.cyan, bold = true },

		-- mini.diff
		MiniDiffSignAdd     = { fg = c.green, bg = bg },
		MiniDiffSignChange  = { fg = c.yellow, bg = bg },
		MiniDiffSignDelete  = { fg = c.red, bg = bg },
		MiniDiffOverAdd     = { fg = c.green, bg = bg },
		MiniDiffOverChange  = { fg = c.yellow, bg = bg },
		MiniDiffOverDelete  = { fg = c.red, bg = bg },
		MiniDiffOverContext = { bg = c.cursor_grey },

		-- mini.files
		MiniFilesBorder         = { fg = c.comment_grey, bg = bg },
		MiniFilesBorderModified = { fg = c.yellow, bg = bg },
		MiniFilesCursorLine     = { bg = c.cursor_grey },
		MiniFilesDirectory      = { fg = c.blue },
		MiniFilesFile           = { fg = c.white },
		MiniFilesNormal         = { fg = c.white, bg = bg },
		MiniFilesTitle          = { fg = c.yellow, bg = bg, bold = true },
		MiniFilesTitleFocused   = { fg = c.yellow, bg = bg, bold = true },

		-- oil.nvim
		OilDir            = { fg = c.blue },
		OilDirIcon        = { fg = c.blue },
		OilLink           = { fg = c.cyan },
		OilLinkTarget     = { fg = c.cyan, italic = true },
		OilCopy           = { fg = c.green, bold = true },
		OilMove           = { fg = c.yellow, bold = true },
		OilChange         = { fg = c.purple, bold = true },
		OilCreate         = { fg = c.green, bold = true },
		OilDelete         = { fg = c.red, bold = true },
		OilPermissionNone = { fg = c.comment_grey },
		OilPermissionRead = { fg = c.yellow },
		OilPermissionWrite = { fg = c.red },
		OilPermissionExecute = { fg = c.green },
		OilTypeDir        = { fg = c.blue },
		OilTypeFile       = { fg = c.white },
		OilTypeLink       = { fg = c.cyan },
		OilTypeSocket     = { fg = c.purple },
		OilSize           = { fg = c.dark_yellow },
		OilMtime          = { fg = c.comment_grey },
		OilTrash          = { fg = c.red },
		OilTrashSourcePath = { fg = c.comment_grey, italic = true },
		OilHidden         = { fg = c.comment_grey },
		OilSocket         = { fg = c.purple },

		-- lazygit (terminal)
		LazyGitFloat       = { fg = c.white, bg = bg },
		LazyGitBorder      = { fg = c.comment_grey, bg = bg },

		-- Treesitter context (in case of plugin)
		TreesitterContext           = { bg = c.cursor_grey },
		TreesitterContextLineNumber = { fg = c.gutter_grey, bg = c.cursor_grey },

		-- Health
		healthError   = { fg = c.dark_red },
		healthSuccess = { fg = c.green },
		healthWarning = { fg = c.yellow },
	}

	for group, opts in pairs(groups) do
		hl(group, opts)
	end
end

if vim.g.hackthebox_transparent == nil then
	vim.g.hackthebox_transparent = true
end

apply(vim.g.hackthebox_transparent)

vim.api.nvim_create_user_command("HackTheBoxToggle", function()
	vim.g.hackthebox_transparent = not vim.g.hackthebox_transparent
	apply(vim.g.hackthebox_transparent)
	vim.notify("hackthebox: " .. (vim.g.hackthebox_transparent and "transparent" or "solid"))
end, { desc = "Toggle hackthebox transparent background" })

-- Terminal colors
vim.g.terminal_color_0  = c.black
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.purple
vim.g.terminal_color_6  = c.cyan
vim.g.terminal_color_7  = c.white
vim.g.terminal_color_8  = c.visual_grey
vim.g.terminal_color_9  = c.dark_red
vim.g.terminal_color_10 = c.green
vim.g.terminal_color_11 = c.dark_yellow
vim.g.terminal_color_12 = c.blue
vim.g.terminal_color_13 = c.purple
vim.g.terminal_color_14 = c.cyan
vim.g.terminal_color_15 = c.comment_grey
