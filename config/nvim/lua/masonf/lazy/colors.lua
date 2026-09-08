return {
    {
        'folke/tokyonight.nvim',
    },
    {
        "jamesGadoury/neon-ghost-theme",
        name = "neon-ghost",
        lazy = false,
        priority = 1000,
        config = function()
            require("neon-ghost").setup({
                transparent = true,
            })
            vim.cmd.colorscheme("neon-ghost")
        
        end,
    },
    {
        'ellisonleao/gruvbox.nvim',
    },
    {
        'shaunsingh/nord.nvim',
    },
    {
        'AlexvZyl/nordic.nvim',
    },
    {
        'sainnhe/everforest',
    },
    {
        'oxfist/night-owl.nvim',
    },
    {
        'EdenEast/nightfox.nvim',
    },
    {
        'xero/evangelion.nvim',
    },
    {
        'rebelot/kanagawa.nvim',
    },
}
