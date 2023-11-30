function edit_directory()
    local dir = vim.fn.expand('%:h')
    if dir == "" then
        dir = '.'
    end
    vim.api.nvim_command('edit ' .. dir)
end

-- expand '%%' to current directory
vim.keymap.set('c', '%%', 'expand("%:h") .. "/"', { expr = true, noremap = true })
-- map 'C-b' to Left in Command mode
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
-- map 'C-f' to Right in Command mode
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
-- map 'C-]' to gC-]
vim.keymap.set('n', '<C-]>', 'g<C-]>', { noremap = true })
-- map '-' to edit current directory
vim.keymap.set('n', '-', '<cmd>lua edit_directory()<CR>', { noremap = true })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})