return {
    'nvim-treesitter/nvim-treesitter',
    branch = "main",
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            'lua',
            'html',
            'rust',
            'ocaml',
            'json',
            'fsharp',
            'elixir',
            'eex',
            'heex',
        },
        sync_install = false,
        ignore_install = { "" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
            disable = {}
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.config').setup(opts)
    end
}
