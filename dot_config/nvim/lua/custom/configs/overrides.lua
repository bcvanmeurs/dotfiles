-- overriding default plugin configs!

local M = {}

M.treesitter = {
	ensure_installed = {
		-- defaults
		"vim",
		"lua",
		"bash",

		-- web dev
		"html",
		"css",
		"javascript",
		"typescript",
		"json",
		"yaml",
		-- "vue", "svelte",

		-- programming
		"python",
		"rust",

		-- text files
		"toml",
		"markdown",
		"markdown_inline",
	},
}

M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
				folder_arrow = false,
			},
		},
		indent_markers = {
			enable = true,
		},
	},
}

M.mason = {
	ensure_installed = {
		-- general
		"prettierd",
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- python
		"pyright",
		"black",
		"mypy",
		"ruff",
		"debugpy",

		-- rust
		"rust-analyzer",

		-- shell
		"shfmt",
		"shellcheck",
		"bash-language-server",

		-- web dev
		-- "css-lsp",
		-- "html-lsp",
		-- "typescript-language-server",
		-- "deno",
		-- -- "emmet-ls",
		-- "json-lsp",
		-- "tailwindcss-language-server",
	},
}

return M
