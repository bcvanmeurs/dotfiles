local opt = vim.opt -- for conciseness

-- highlight line width
opt.colorcolumn = "100"

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.scrolloff = 15

opt.iskeyword:append("-") -- consider string-string as whole word
