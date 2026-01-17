hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "tokyonight-storm"
set background=dark
if exists("+termguicolors")
  set termguicolors
endif

let s:none = "NONE"
let s:bg = "#24283b"
let s:bg_dark = "#1f2335"
let s:bg_highlight = "#292e42"
let s:black = "#1d202f"
let s:fg = "#c0caf5"
let s:fg_dark = "#a9b1d6"
let s:fg_gutter = "#3b4261"
let s:comment = "#565f89"
let s:blue = "#7aa2f7"
let s:blue0 = "#3d59a1"
let s:blue1 = "#2ac3de"
let s:blue2 = "#0db9d7"
let s:blue5 = "#89ddff"
let s:cyan = "#7dcfff"
let s:green = "#9ece6a"
let s:teal = "#1abc9c"
let s:magenta = "#bb9af7"
let s:orange = "#ff9e64"
let s:red = "#f7768e"
let s:red1 = "#db4b4b"
let s:yellow = "#e0af68"
let s:dark3 = "#545c7e"
let s:dark5 = "#737aa2"
let s:purple = "#9d7cd8"
let s:terminal_black = "#414868"
let s:border_highlight = "#29a4bd"
let s:bg_visual = "#2e3c64"
let s:bg_search = "#3d59a1"
let s:pmenu_sel = "#363d59"
let s:pmenu_sbar = "#272b3f"
let s:diff_add = "#2b485a"
let s:diff_change = "#272d43"
let s:diff_delete = "#52313f"
let s:diff_text = "#394b70"
let s:diag_error_bg = "#362c3d"
let s:diag_warn_bg = "#373640"
let s:diag_info_bg = "#22374b"
let s:diag_hint_bg = "#233745"
let s:lsp_inlay_bg = "#262c40"
let s:lsp_sig_bg = "#28304b"

function! s:hi(group, fg, bg, attr, sp) abort
  let l:cmd = "hi " . a:group
  if a:fg !=# ""
    let l:cmd .= " guifg=" . a:fg
  endif
  if a:bg !=# ""
    let l:cmd .= " guibg=" . a:bg
  endif
  if a:attr !=# ""
    let l:cmd .= " gui=" . a:attr
  endif
  if a:sp !=# ""
    let l:cmd .= " guisp=" . a:sp
  endif
  execute l:cmd
endfunction

call s:hi("Normal", s:fg, s:bg, "", "")
call s:hi("NormalNC", s:fg, s:bg, "", "")
call s:hi("NormalFloat", s:fg, s:bg_dark, "", "")
call s:hi("NormalSB", s:fg_dark, s:bg_dark, "", "")

call s:hi("Cursor", s:bg, s:fg, "", "")
call s:hi("lCursor", s:bg, s:fg, "", "")
call s:hi("CursorIM", s:bg, s:fg, "", "")
call s:hi("CursorLine", s:none, s:bg_highlight, "", "")
call s:hi("CursorColumn", s:none, s:bg_highlight, "", "")
call s:hi("ColorColumn", s:none, s:black, "", "")

call s:hi("LineNr", s:fg_gutter, s:none, "", "")
call s:hi("LineNrAbove", s:fg_gutter, s:none, "", "")
call s:hi("LineNrBelow", s:fg_gutter, s:none, "", "")
call s:hi("CursorLineNr", s:orange, s:none, "bold", "")

call s:hi("SignColumn", s:fg_gutter, s:bg, "", "")
call s:hi("FoldColumn", s:comment, s:bg, "", "")
call s:hi("Folded", s:blue, s:fg_gutter, "", "")
call s:hi("EndOfBuffer", s:bg, s:none, "", "")

call s:hi("VertSplit", s:black, s:none, "", "")
call s:hi("WinSeparator", s:black, s:none, "bold", "")

call s:hi("StatusLine", s:fg_dark, s:bg_dark, "", "")
call s:hi("StatusLineNC", s:fg_gutter, s:bg_dark, "", "")
hi! link WinBar StatusLine
hi! link WinBarNC StatusLineNC

call s:hi("TabLine", s:fg_gutter, s:bg_dark, "", "")
call s:hi("TabLineFill", s:none, s:black, "", "")
call s:hi("TabLineSel", s:black, s:blue, "", "")

call s:hi("Pmenu", s:fg, s:bg_dark, "", "")
call s:hi("PmenuSel", s:fg, s:pmenu_sel, "", "")
call s:hi("PmenuSbar", s:none, s:pmenu_sbar, "", "")
call s:hi("PmenuThumb", s:none, s:fg_gutter, "", "")
call s:hi("PmenuMatch", s:blue1, s:bg_dark, "", "")
call s:hi("PmenuMatchSel", s:blue1, s:pmenu_sel, "", "")

call s:hi("FloatBorder", s:border_highlight, s:bg_dark, "", "")
call s:hi("FloatTitle", s:border_highlight, s:bg_dark, "bold", "")

call s:hi("Visual", s:none, s:bg_visual, "", "")
call s:hi("VisualNOS", s:none, s:bg_visual, "", "")
call s:hi("Search", s:fg, s:bg_search, "", "")
call s:hi("IncSearch", s:black, s:orange, "", "")
hi! link CurSearch IncSearch
call s:hi("MatchParen", s:orange, s:none, "bold", "")

call s:hi("Directory", s:blue, s:none, "", "")
call s:hi("NonText", s:dark3, s:none, "", "")
call s:hi("Whitespace", s:fg_gutter, s:none, "", "")
call s:hi("SpecialKey", s:dark3, s:none, "", "")
call s:hi("Conceal", s:dark5, s:none, "", "")
call s:hi("ErrorMsg", s:red1, s:none, "", "")
call s:hi("WarningMsg", s:yellow, s:none, "", "")
call s:hi("MoreMsg", s:blue, s:none, "", "")
call s:hi("ModeMsg", s:fg_dark, s:none, "bold", "")
call s:hi("MsgArea", s:fg_dark, s:none, "", "")
call s:hi("Question", s:blue, s:none, "", "")
call s:hi("Title", s:blue, s:none, "bold", "")
call s:hi("WildMenu", s:none, s:bg_visual, "", "")
call s:hi("QuickFixLine", s:none, s:bg_visual, "bold", "")

call s:hi("DiffAdd", s:none, s:diff_add, "", "")
call s:hi("DiffChange", s:none, s:diff_change, "", "")
call s:hi("DiffDelete", s:none, s:diff_delete, "", "")
call s:hi("DiffText", s:none, s:diff_text, "", "")

call s:hi("SpellBad", s:none, s:none, "undercurl", s:red1)
call s:hi("SpellCap", s:none, s:none, "undercurl", s:yellow)
call s:hi("SpellLocal", s:none, s:none, "undercurl", s:blue2)
call s:hi("SpellRare", s:none, s:none, "undercurl", s:teal)

call s:hi("Comment", s:comment, s:none, "italic", "")
call s:hi("Constant", s:orange, s:none, "", "")
call s:hi("String", s:green, s:none, "", "")
call s:hi("Character", s:green, s:none, "", "")
call s:hi("Number", s:orange, s:none, "", "")
call s:hi("Boolean", s:orange, s:none, "", "")
call s:hi("Float", s:orange, s:none, "", "")
call s:hi("Identifier", s:magenta, s:none, "", "")
call s:hi("Function", s:blue, s:none, "", "")
call s:hi("Statement", s:magenta, s:none, "", "")
call s:hi("Conditional", s:magenta, s:none, "", "")
call s:hi("Repeat", s:magenta, s:none, "", "")
call s:hi("Label", s:magenta, s:none, "", "")
call s:hi("Keyword", s:cyan, s:none, "italic", "")
call s:hi("Exception", s:magenta, s:none, "", "")
call s:hi("Operator", s:blue5, s:none, "", "")
call s:hi("PreProc", s:cyan, s:none, "", "")
call s:hi("Include", s:cyan, s:none, "", "")
call s:hi("Define", s:cyan, s:none, "", "")
call s:hi("Macro", s:cyan, s:none, "", "")
call s:hi("PreCondit", s:cyan, s:none, "", "")
call s:hi("Type", s:blue1, s:none, "", "")
call s:hi("StorageClass", s:blue1, s:none, "", "")
call s:hi("Structure", s:blue1, s:none, "", "")
call s:hi("Typedef", s:blue1, s:none, "", "")
call s:hi("Special", s:blue1, s:none, "", "")
call s:hi("SpecialChar", s:blue1, s:none, "", "")
call s:hi("Tag", s:blue1, s:none, "", "")
call s:hi("Delimiter", s:blue5, s:none, "", "")
call s:hi("SpecialComment", s:comment, s:none, "", "")
call s:hi("Debug", s:orange, s:none, "", "")
call s:hi("Underlined", s:none, s:none, "underline", "")
call s:hi("Ignore", s:dark3, s:none, "", "")
call s:hi("Error", s:red1, s:none, "", "")
call s:hi("Todo", s:bg, s:yellow, "", "")
call s:hi("Bold", s:fg, s:none, "bold", "")
call s:hi("Italic", s:fg, s:none, "italic", "")

call s:hi("DiagnosticError", s:red1, s:none, "", "")
call s:hi("DiagnosticWarn", s:yellow, s:none, "", "")
call s:hi("DiagnosticInfo", s:blue2, s:none, "", "")
call s:hi("DiagnosticHint", s:teal, s:none, "", "")
call s:hi("DiagnosticUnnecessary", s:terminal_black, s:none, "", "")
call s:hi("DiagnosticVirtualTextError", s:red1, s:diag_error_bg, "", "")
call s:hi("DiagnosticVirtualTextWarn", s:yellow, s:diag_warn_bg, "", "")
call s:hi("DiagnosticVirtualTextInfo", s:blue2, s:diag_info_bg, "", "")
call s:hi("DiagnosticVirtualTextHint", s:teal, s:diag_hint_bg, "", "")
call s:hi("DiagnosticUnderlineError", s:none, s:none, "undercurl", s:red1)
call s:hi("DiagnosticUnderlineWarn", s:none, s:none, "undercurl", s:yellow)
call s:hi("DiagnosticUnderlineInfo", s:none, s:none, "undercurl", s:blue2)
call s:hi("DiagnosticUnderlineHint", s:none, s:none, "undercurl", s:teal)

call s:hi("LspReferenceText", s:none, s:fg_gutter, "", "")
call s:hi("LspReferenceRead", s:none, s:fg_gutter, "", "")
call s:hi("LspReferenceWrite", s:none, s:fg_gutter, "", "")
call s:hi("LspInlayHint", s:dark3, s:lsp_inlay_bg, "", "")
call s:hi("LspCodeLens", s:comment, s:none, "", "")
call s:hi("LspSignatureActiveParameter", s:none, s:lsp_sig_bg, "bold", "")
hi! link LspInfoBorder FloatBorder

if has("nvim")
  hi! link @comment Comment
  hi! link @constant Constant
  hi! link @string String
  hi! link @string.escape SpecialChar
  hi! link @number Number
  hi! link @boolean Boolean
  hi! link @function Function
  hi! link @variable Identifier
  hi! link @field Identifier
  hi! link @property Identifier
  hi! link @type Type
  hi! link @keyword Keyword
  hi! link @operator Operator
  hi! link @punctuation.delimiter Delimiter
  hi! link @punctuation.bracket Delimiter
endif
