return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            -- 1. Fetch the default template using table index notation
            local tw_config = vim.lsp.config.tailwindcss

            if tw_config then
                -- Deep copy the default filetypes array to avoid the index-merge trap
                local filetypes = vim.deepcopy(tw_config.filetypes or {})
                if not vim.tbl_contains(filetypes, "rust") then
                    table.insert(filetypes, "rust")
                end

                -- 2. Apply modifications using the function setter signature
                vim.lsp.config("tailwindcss", {
                    cmd = { "bun", "run", "--bun", "tailwindcss-language-server", "--stdio" },
                    filetypes = filetypes,
                    init_options = {
                        userLanguages = {
                            rust = "html",
                            elixir = "html-eex",
                            eelixir = "html-eex",
                            heex = "html-eex",
                        },
                    },
                    settings = {
                        tailwindCSS = {
                            includeLanguages = {
                                rust = "html",
                                elixir = "html-eex",
                                eelixir = "html-eex",
                                heex = "html-eex",
                            },
                            experimental = {
                                classRegex = {
                                    [[class= "([^"]*)]],
                                    [[class: "([^"]*)]],
                                    '~H""".*class="([^"]*)".*"""',
                                    { [[view!\s*\{([^}]*)\}]],  [[class\s*=\s*"([^"]*)"]] },
                                    { [[class\s*=\s*"([^"]*)"]] }
                                },
                            },
                        },
                    },
                })
            end

            -- Configure elixirls template
            vim.lsp.config("elixirls", {
                cmd = { "/home/masonf/.local/share/nvim/elixir/language_server.sh" },
            })

            -- 3. Initialize Mason infrastructure
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls",
                    "elixirls",
                    "rust_analyzer",
                    "tailwindcss",
                    "fsautocomplete",
                },
            })
        end
    }
}
