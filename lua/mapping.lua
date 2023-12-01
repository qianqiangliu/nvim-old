-- expand '%%' to current directory
vim.keymap.set('c', '%%', 'expand("%:h") .. "/"', { expr = true, noremap = true })
-- map 'C-b' to Left in Command mode
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
-- map 'C-f' to Right in Command mode
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
-- map 'C-]' to gC-]
vim.keymap.set('n', '<C-]>', 'g<C-]>', { noremap = true })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

-- nvim-osc52
vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>yy', '<leader>c_', {remap = true})
vim.keymap.set('v', '<leader>y', require('osc52').copy_visual)

-- FTerm
vim.keymap.set('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
