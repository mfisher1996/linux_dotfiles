local function set_transparency_on_colorscheme()
    vim.cmd([[highlight Normal guibg=none ctermbg=none]])
    vim.cmd([[highlight NonText guibg=none ctermbg=none]])
end

local autocmds = vim.api.nvim_create_augroup("TransparentBackground", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
    group = autocmds,
    callback = set_transparency_on_colorscheme,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "elixir", "heex", "eex" },
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang then
            vim.treesitter.start(args.buf, lang)
        end
    end,
})
