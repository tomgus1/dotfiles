return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local eslint_d = require("none-ls.diagnostics.eslint_d")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

				eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({
							".eslintrc",
							".eslintrc.js",
							".eslintrc.json",
							".eslint.config.js",
							"package.json",
						})
					end,
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
