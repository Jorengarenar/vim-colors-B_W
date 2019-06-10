" Name:       black_and_white.vim
" Version:    0.2.0
" License:    The MIT License (MIT)
"
" A colorscheme meant to look like a more pleasant version of syntax off
"
"""

" SETUP ------------------------------------------------------------------------

" Set background to dark
set background=dark

" Reset syntax highlighting
hi clear
if exists('syntax on')
    syntax reset
endif

" Declare theme name
let g:colors_name='black_and_white'


" DEFINE REUSABLE COLORS -------------------------------------------------------

let s:almost_black    = { "gui": "#303030", "cterm": "234" }
let s:black           = { "gui": "#000000", "cterm": "16"   }
let s:blue            = { "gui": "#20BBFC", "cterm": "12"  }
let s:dark_blue       = { "gui": "#008EC4", "cterm": "4"   }
let s:dark_cyan       = { "gui": "#20A5BA", "cterm": "6"   }
let s:dark_green      = { "gui": "#10A778", "cterm": "2"   }
let s:dark_grey       = { "gui": "#1c1c1c", "cterm": "236" }
let s:dark_red        = { "gui": "#C30771", "cterm": "1"   }
let s:dark_yellow     = { "gui": "#A89C14", "cterm": "3"   }
let s:darker_blue     = { "gui": "#005F87", "cterm": "18"  }
let s:grey            = { "gui": "#424242", "cterm": "8"   }
let s:light_green     = { "gui": "#5FD7A7", "cterm": "10"  }
let s:light_grey      = { "gui": "#B2B2B2", "cterm": "249" }
let s:medium_grey     = { "gui": "#767676", "cterm": "243" }
let s:red             = { "gui": "#fb007a", "cterm": "9"   }
let s:white           = { "gui": "#FFFFFF", "cterm": "15"  }
let s:yellow          = { "gui": "#F3E430", "cterm": "11"  }

let s:bg              = s:black
let s:bg_inverted     = s:light_grey
let s:faint           = s:almost_black
let s:norm            = s:light_grey
let s:norm_inverted   = s:dark_grey
let s:subtle          = s:grey


" UTILITY FUNCTION (https://github.com/noahfrederick/vim-hemisu) ---------------

function! s:h(group, style)
    execute "highlight" a:group
                \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
                \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
                \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
                \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
                \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
                \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
                \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
endfunction


" HIGHLIGHTING -----------------------------------------------------------------

" Text
call s:h("Comment",       {"fg": s:subtle, "gui": "italic"})
call s:h("DiffAdd",       {"fg": s:light_green})
call s:h("DiffChange",    {"fg": s:dark_yellow})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffText",      {"fg": s:light_grey})
call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("Title",         {"cterm": "bold"})
call s:h("Todo",          {"fg": s:norm_inverted, "bg": s:bg_inverted})

" In-text
call s:h("ColorColumn",   {"bg": s:faint})
call s:h("CursorColumn",  {"bg": s:faint})
call s:h("CursorLine",    {"cterm" : "none"})
call s:h("Folded",        {"fg": s:medium_grey})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:grey})
call s:h("MatchParen",    {"fg": s:norm, "bg": s:subtle})
call s:h("NonText",       {"fg": s:medium_grey})
call s:h("Search",        {"bg": s:subtle, "fg": s:norm})
call s:h("Visual",        {"bg": s:grey})

" UI
call s:h("CursorLineNr",  {"fg": s:bg_inverted})
call s:h("FoldColumn",    {"fg": s:subtle})
call s:h("LineNr",        {"fg": s:subtle})
call s:h("MoreMsg",       {"fg": s:medium_grey, "cterm": "bold", "gui": "bold"})
call s:h("Pmenu",         {"fg": s:norm, "bg": s:subtle})
call s:h("PmenuSel",      {"fg": s:norm, "bg": s:blue})
call s:h("Question",      {"fg": s:red})
call s:h("SignColumn",    {"bg": s:bg})
call s:h("StatusLine",    {"bg": s:bg_inverted, "fg": s:norm_inverted})
call s:h("StatusLineNC",  {"bg": s:faint})
call s:h("TabLine",       {"fg": s:norm, "bg": s:faint})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:faint})
call s:h("TabLineSel",    {"fg": s:norm_inverted, "bg": s:subtle, "gui": "bold", "cterm": "bold"})
call s:h("VertSplit",     {"bg": s:faint, "fg": s:faint})
call s:h("WarningMsg",    {"fg": s:red})
call s:h("WildMenu",      {"fg": s:bg_inverted, "bg": s:norm_inverted})


" LINKING ----------------------------------------------------------------------

hi!  link  VimCommentString  Comment

hi!  link  Constant          Normal
hi!  link  Identifier        Normal
hi!  link  Statement         Normal
hi!  link  PreProc           Normal
hi!  link  Type              Normal
hi!  link  Special           Normal

hi!  link  ModeMsg           MoreMsg
