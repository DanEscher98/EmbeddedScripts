local opts = {}
-- re-use common lsp configurations (keybindings, buffer-highlight and cmp integration)
opts = require("lvim.lsp").get_common_opts()
require('lspconfig').julials.setup(opts)
-- https://medium.com/coffee-in-a-klein-bottle/vim-for-julia-another-look-1dc4265bb49b
