local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.opt.number = true
vim.opt.linebreak = true
vim.opt.showbreak = '++'
vim.opt.showmatch = true
vim.opt.visualbell = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.ruler = true
vim.opt.hidden = true
vim.o.mouse = 'a'
vim.pumheight = 10
vim.o.relativenumber = true
vim.o.nu = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.clipboard = 'unnamedplus'
vim.o.laststatus = 3
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
vim.opt.termguicolors = true
vim.opt.list = true
vim.o.guifont = "Hack Nerd Font Mono:h6"
--vim.g.neovide_scale_factor = 0.75
require('plugins')
