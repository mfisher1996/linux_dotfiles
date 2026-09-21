local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local function ikeymap(key, cmd, pts)
    keymap("i", key, cmd, pts)
end

local function nokeymap(key, cmd, pts)
    keymap("n", key, cmd, pts)
end

local function vikeymap(key, cmd, pts)
    keymap("v", key, cmd, pts)
end

local function vxkeymap(key, cmd, pts)
    keymap("x", key, cmd, pts)
end

keymap("", "<Space>", "<Nop>", opts)
ikeymap('jk', '<Esc>', opts)

nokeymap("<A-h>", "<C-w>h", opts)
nokeymap("<A-j>", "<C-w>j", opts)
nokeymap("<A-k>", "<C-w>k", opts)
nokeymap("<A-l>", "<C-w>l", opts)

nokeymap("<leader>e", ":Explore<CR>", opts)

nokeymap("<leader>y", '"+y', opts)
vikeymap("<leader>y", '"+y', opts)
nokeymap("<leader>Y", '"+Y', opts)
nokeymap("<leader>d", '"_d', opts)
nokeymap("<leader>D", '"_D', opts)

--nokeymap("<leader>cs", "<cmd>Telescope colorscheme<CR><cmd>highlight Normal guibg=none<CR><cmd>highlight NonText guibg=none<CR>", opts)
--nokeymap("<leader>ct", "<cmd>highlight Normal guibg=none<CR><cmd>highlight NonText guibg=none<CR>", opts)

nokeymap("<C-Up>", ':resize -2<CR>', opts)
nokeymap("<C-Down>", ':resize +2<CR>', opts)
nokeymap("<C-Left>", ':vertical resize -2<CR>', opts)
nokeymap("<C-Right>", ':vertical resize +2<CR>', opts)

vikeymap('<', '<gv', opts)
vikeymap('>', '>gv', opts)

vikeymap('p', '"_dP', opts)

vxkeymap('J', ":m '>+1<CR>gv-gv", opts)
vxkeymap('K', ":m '<-2<CR>gv-gv", opts)

nokeymap("<leader>cc", ":CodeCompanionChat toggle<CR>", opts)
--local codium_ok, _ = pcall(require, 'codeium')
--
--if not codium_ok then
--vim.notify('Codeium not installed')
--else
--vim.keymap.set('i','<C-s>',function () return vim.fn['codeium#Complete']() end, {expr = true})
--vim.keymap.set('i','<Right>',function () return vim.fn['codeium#Accept']() end, {expr = true})
--vim.keymap.set('i','<Left>',function () return vim.fn['codeium#CycleCompletions'](1) end, {expr = true})
--end

--local harp_ok, _ = pcall(require, 'harpoon')
--
--if not harp_ok then
--vim.notify('Harpoon not installed')
--else
--nokeymap('<leader>m',':lua require("harpoon.mark").add_file()<CR>',opts)
--nokeymap('<leader>h',':lua require("harpoon.ui").toggle_quick_menu()<CR>',opts)
--nokeymap('<C-k>',':lua require("harpoon.ui").nav_next()<CR>',opts)
--nokeymap('<C-j>',':lua require("harpoon.ui").nav_prev()<CR>',opts)
--nokeymap('<leader>b',':lua require("harpoon.tmux").gotoTerminal(1)<CR>',opts)
--end

--lsp maps

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('MasonfGroup', {}),
    callback = function(e)
        vim.bo[e.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local options = { buffer = e.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, options)
        vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, options)
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, options)
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, options)
        vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, options)
        vim.keymap.set('n', '<C-l>', vim.diagnostic.open_float, options)
        vim.keymap.set('n', '<leader>fm', function()
            vim.lsp.buf.format { async = true }
        end, options)
    end
})
