local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'nvim-lualine/lualine.nvim',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'ojroques/nvim-osc52',
    'folke/tokyonight.nvim',
    'ellisonleao/gruvbox.nvim',
    'stevearc/oil.nvim',
    'numToStr/FTerm.nvim',
})

require('lualine').setup {
    options = { theme = 'gruvbox' }
}
require('telescope').setup()
require('oil').setup()
require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})
