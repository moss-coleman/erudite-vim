local explorer = {
	name = "+explorer",
	n = { ":enew | startinsert <CR>", "create new file" },
	e = { ":NvimTreeToggle<CR>", "open explorer" },
	t = { ":TransparentToggle<CR>", "toggle transparency" }, -- you need exa or just edit it to use ls
	h = { ":Telescope oldfiles<CR>", "recently opened files" },
	b = { ":Telsecope marks<CR>", "marks" },
	f = { ":cd $PWD | Telsecope find_files <CR>", "search files" },
	s = { ":SidebarNvimToggle <CR>", "open sidebar" },
	c = { ":Telescope colorscheme <CR>", "select colorscheme" },
	m = { ":MinimapToggle <CR>", "toggle code minimap" },
}

return explorer
