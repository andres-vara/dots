return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").setup({})
		local builtin = require("telescope.builtin")
		local set = vim.keymap.set

		set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
		set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		set(
			"n",
			"<leader>f.",
			"<cmd>Telescope find_files hidden=true no_ignore=true<CR>",
			{ desc = "[F]ind Hiden files" }
		)

		set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}
