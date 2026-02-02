vim.env.LAZY_STDPATH = ".repro"
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

require("lazy.minit").repro({
	spec = {
		{ "folke/snacks.nvim", opts = {} },
		{ "nvim-tree/nvim-tree.lua", opts = {} },
		{
			"neovim/nvim-lspconfig",
			opts = {},
			dependencies = {
				{ "mason-org/mason.nvim", opts = {} },
				{
					"mason-org/mason-lspconfig.nvim",
					opts = {
						ensure_installed = { "vtsls" },
					},
				},
			},
		},
	},
})

-- nvim-tree + snacks.rename integration (from snacks docs)
local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
vim.api.nvim_create_autocmd("User", {
	pattern = "NvimTreeSetup",
	callback = function()
		local events = require("nvim-tree.api").events
		events.subscribe(events.Event.NodeRenamed, function(data)
			if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
				prev = data
				Snacks.rename.on_rename_file(data.old_name, data.new_name)
			end
		end)
	end,
})
