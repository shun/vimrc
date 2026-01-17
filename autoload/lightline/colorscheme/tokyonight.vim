let s:black = "#1d202f"
let s:blue = "#7aa2f7"
let s:fg = "#c0caf5"
let s:fg_gutter = "#3b4261"
let s:bg = "#24283b"
let s:bg_dark = "#1f2335"
let s:bg_highlight = "#292e42"
let s:green = "#9ece6a"
let s:magenta = "#bb9af7"
let s:red = "#f7768e"
let s:warning = "#e0af68"
let s:error = "#db4b4b"
let s:dark3 = "#545c7e"

let s:p = {
      \ 'normal': {},
      \ 'insert': {},
      \ 'visual': {},
      \ 'replace': {},
      \ 'inactive': {},
      \ 'tabline': {},
      \ }

let s:p.normal.left = [ [ s:black, s:blue ], [ s:blue, s:fg_gutter ] ]
let s:p.normal.middle = [ [ s:fg, s:bg_dark ] ]
let s:p.normal.right = [ [ s:black, s:blue ], [ s:blue, s:fg_gutter ] ]
let s:p.normal.error = [ [ s:black, s:error ] ]
let s:p.normal.warning = [ [ s:black, s:warning ] ]

let s:p.insert.left = [ [ s:black, s:green ], [ s:blue, s:bg ] ]
let s:p.visual.left = [ [ s:black, s:magenta ], [ s:blue, s:bg ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:blue, s:bg ] ]

let s:p.inactive.left = [ [ s:blue, s:bg_dark ], [ s:dark3, s:bg ] ]
let s:p.inactive.middle = [ [ s:fg_gutter, s:bg_dark ] ]
let s:p.inactive.right = [ [ s:fg_gutter, s:bg_dark ], [ s:dark3, s:bg ] ]

let s:p.tabline.left = [ [ s:dark3, s:bg_highlight ], [ s:dark3, s:bg ] ]
let s:p.tabline.middle = [ [ s:fg_gutter, s:bg_dark ] ]
let s:p.tabline.right = [ [ s:fg_gutter, s:bg_dark ], [ s:dark3, s:bg ] ]
let s:p.tabline.tabsel = [ [ s:blue, s:fg_gutter ], [ s:dark3, s:bg ] ]

let g:lightline#colorscheme#tokyonight#palette = lightline#colorscheme#fill(s:p)
