-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt -- for conciseness

-- highlight line width
opt.colorcolumn = "100"

-- line numbers
opt.scrolloff = 15

opt.iskeyword:append("-") -- consider string-string as whole word

-- Python settings. Important for fast opening of python files,
-- otherwise there is a delay of 3 seconds
-- vim.g.loaded_python3_provider = 0 -- disable python provider
vim.g.python3_host_prog = "~/.pyenv/versions/neovim/bin/python"
