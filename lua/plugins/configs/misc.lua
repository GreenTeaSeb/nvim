vim.opt.listchars:append("eol:↴")
require("indent_blankline").setup {
	space_char_blankline = " ",
	show_current_context = true,
	buftype_exclude = {"terminal"},
    filetype_exclude = {"startup","TelescopePrompt"}
}

vim.cmd[[colorscheme abscs]]

require('Comment').setup()

