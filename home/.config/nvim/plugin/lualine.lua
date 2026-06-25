vim.pack.add({{
	name = "devicons.nvim",
	src = "https://github.com/nvim-tree/nvim-web-devicons",
}, {
	name = "lualine.nvim",
	src = "https://github.com/nvim-lualine/lualine.nvim",
}})

require("lualine").setup({
	options = {
		component_separators = { left = " ", right = " " },
		secton_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "", right = "" } } },
		lualine_b = { { "branch", "diff", "diagnostics", separator = { right = "" } } },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = { { "progress", separator = { left = "" } } },
		lualine_z = { { "location", separator = { left = "", right = "" } } },
	},
})
