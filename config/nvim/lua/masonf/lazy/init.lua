return {
    "nvim-lua/popup.nvim",
    "linrongbin16/lsp-progress.nvim",
    {
        "olimorris/codecompanion.nvim",
        version = "^19.0.0",
        opts = function()
            local function get_system_prompt()
                local path = vim.fn.expand("~/.prompts/outputfile")
                local file = io.open(path, "r")
                if not file then
                    return "<|think|>You are an expert software developer."
                end
                local content = file:read("*a")
                file:close()
                return vim.trim(content)
            end

            local prompt_content = get_system_prompt()

            return {
                adapters = {
                    http = {
                        llama_server = function()
                            -- Inherit from the native deepseek template to unlock its build-in UI thinking blocks
                            return require("codecompanion.adapters").extend("openai_compatible", {
                                name = "llama-server",
                                env = {
                                    url = "http://127.0.0.1:11434",
                                    api_key = "local-stub-value",
                                },
                                schema = {
                                    model = {
                                        default = "gemma-4",
                                    },
                                },
                                handlers = {
                                    parse_message_meta = function(self, data)
                                        local extra = data.extra
                                        if extra and extra.reasoning_content then
                                            data.output.reasoning = { content = extra.reasoning_content }
                                            if data.output.content == "" then
                                                data.output.content = nil
                                            end
                                        end
                                        return data
                                    end,
                                }
                            })
                        end,
                    }
                },
                strategies = {
                    chat = {
                        adapter = "llama_server",
                        roles = {
                            llm = "CodeCompanion (llama-server)",
                            user = "Mason",
                        },
                        opts = {
                            system_prompt = prompt_content,
                            send_code = false, -- FIXED: Placed inside chat strategies to disable auto-buffer dumps
                        },
                    },
                    inline = {
                        adapter = "llama_server",
                        opts = {
                            -- Hard boundaries to prevent inline operations from analyzing the entire file
                            max_lines_before = 100,
                            max_lines_after = 100,
                        }
                    },
                    agent = { adapter = "llama_server" },
                },
                -- FIXED: Moved to top level so CodeCompanion's router registers visual mode selections
                keymaps = {
                    add_to_chat = {
                        modes = { v = "<leader>aa" },
                        callback = "add_to_chat",
                        description = "Add selected code block to chat context",
                    },
                },
                interactions = {
                    chat = {
                        adapter = "llama_server",
                        opts = { system_prompt = prompt_content }
                    },
                    inline = { adapter = "llama_server" },
                    cmd = { adapter = "llama_server" },
                    background = { adapter = "llama_server" },
                },
                display = {
                    action_palette = {
                        width = 95,
                        height = 10,
                        prompt = "Prompt ",
                        provider = "telescope",
                        opts = {
                            show_preset_actions = true,
                            show_preset_prompts = true,
                            title = "CodeCompanion actions",
                        },
                    },
                },
            }
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "ravitemer/mcphub.nvim"
        },
    },
    "hiphish/rainbow-delimiters.nvim",
    {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" }
    },
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fs", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help" },
            { "<leader>fg", "<cmd>Telescope git_files<cr>",  desc = "Git Files" },
            {
                "<leader>cs",
                function()
                    require('telescope.builtin').colorscheme({})
                end,
                { desc = "Select Colorscheme (Telescope)" }
            },
        },
        dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-tree/nvim-web-devicons" },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                pickers = {
                    colorscheme = {
                        enable_preview = true
                    }
                },
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_next,
                            ["<C-j>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                },
            })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    "lewis6991/gitsigns.nvim",
    "windwp/nvim-autopairs",
    "norcalli/nvim-colorizer.lua",
    "brenoprata10/nvim-highlight-colors",
    {
        "ThePrimeagen/harpoon",
        keys = {
            { '<leader>m', ':lua require("harpoon.mark").add_file()<CR>',        desc = 'Add harpoon file' },
            { '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = 'open harpoon' },
            { '<C-k>',     ':lua require("harpoon.ui").nav_next()<CR>',          desc = 'Next File' },
            { '<C-j>',     ':lua require("harpoon.ui").nav_prev()<CR>',          desc = 'Previous File' },
            { '<leader>b', ':lua require("harpoon.tmux").gotoTerminal(1)<CR>',   desc = 'tmux' },
        },
    },
    "tpope/vim-fugitive",
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
        },
    },
    {
        "folke/trouble.nvim",
        keys = {
            {
                "<leader>tt",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Open Trouble",
            },
        },
        opts = {},
    },
    --{
    --    'Exafunction/codeium.vim',
    --    config = function()
    --        -- Change '<C-g>' here to any keycode you like.
    --        vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    --        vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
    --            { expr = true, silent = true })
    --        vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
    --            { expr = true, silent = true })
    --        vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    --    end,
    --},
    "tpope/vim-fugitive",
    { 'glacambre/firenvim', build = ":call firenvim#install(0)" },

}
