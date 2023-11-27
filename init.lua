local set = vim.opt
set.clipboard = "unnamed"
set.softtabstop = 8
set.textwidth = 100
set.cindent = true
set.cinoptions = ":0,l1,t0,g0,(0"
set.grepprg = "rg --vimgrep"
set.grepformat = "%f:%l:%c:%m"
set.laststatus = 1

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_altv = 1

-- jump to last position
local api = vim.api
api.nvim_create_autocmd({ 'BufRead', 'BufReadPost' }, {
    callback = function()
        local row, column = unpack(api.nvim_buf_get_mark(0, '"'))
        local buf_line_count = api.nvim_buf_line_count(0)
        if row >= 1 and row <= buf_line_count then
            api.nvim_win_set_cursor(0, { row, column })
        end
    end,
})

-- tab format for .lua and .cpp file
api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.lua", "*.cpp" },
    callback = function()
        set.shiftwidth = 4
        set.tabstop = 4
        set.softtabstop = 4
        set.expandtab = true
    end,
})

function edit_directory()
    local dir = vim.fn.expand('%:h')
    if dir == "" then
        dir = '.'
    end
    api.nvim_command('edit ' .. dir)
end

-- expand '%%' to current directory
api.nvim_set_keymap('c', '%%', 'expand("%:h") .. "/"', { expr = true, noremap = true })
-- map 'C-b' to Left in Command mode
api.nvim_set_keymap('c', '<C-b>', '<Left>', { noremap = true })
-- map 'C-f' to Right in Command mode
api.nvim_set_keymap('c', '<C-f>', '<Right>', { noremap = true })
-- map 'C-]' to gC-]
api.nvim_set_keymap('n', '<C-]>', 'g<C-]>', { noremap = true })
-- map '-' to edit current directory
api.nvim_set_keymap('n', '-', '<cmd>lua edit_directory()<CR>', { noremap = true })
