local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = 'auto'
opt.laststatus = 2
opt.showcmd = true
opt.winborder = 'none'
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.smoothscroll = true
opt.encoding = 'utf-8'

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = -1
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = 'split'

opt.wildmode = 'longest:full,full'
opt.wildoptions = 'fuzzy,pum,tagfile'
opt.wildignorecase = true
opt.completeopt = { 'fuzzy', 'menuone', 'noselect', 'noinsert', 'popup' }

opt.splitright = true
opt.splitbelow = true
opt.splitkeep = 'screen'
opt.switchbuf = 'useopen,usetab'
opt.hidden = true

opt.confirm = true
opt.autoread = true
opt.writebackup = true
opt.swapfile = true
opt.updatetime = 300
opt.clipboard = 'unnamedplus'
-- opt.cmdheight = 0

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
vim.cmd('silent detach!')

vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

vim.diagnostic.config({
    signs = true,
    underline = true,
    severity_sort = true,
    float = { wrap = true, scope = 'cursor', focusable = true }
})

vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' }
})

opt.background = 'dark'
opt.termguicolors = true
vim.cmd.colorscheme('default')

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.emmyrc.json',
        '.luacheckrc',
        'stylua.toml',
        '.stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
    },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
            }
        }
    }
})

vim.lsp.config('clangd', {
    cmd = {
        'clangd',
        '--background-index',
        '--background-index-priority=normal',
        '--clang-tidy',
        '--pch-storage=memory',
        '--fallback-style=Google',
        '--completion-style=detailed',
        '--header-insertion=iwyu',
        '--header-insertion-decorators',
        '--experimental-modules-support'
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_markers = {  
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        '.git'
    }
})

vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        'pyrightconfig.json',
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        '.git'
    }
})

vim.lsp.config('jsonls', {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json', 'jsonc' },
    root_markers = {
        'package.json',
        'tsconfig.json',
        '.editorconfig',
        '.git'
    },
    init_options = { provideFormatter = true },
    settings = {
        json = {
            format = { enable = true },
            validate = { enable = true }
        }
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
            autotrigger = true,
        })
    --     vim.lsp.inlay_hint.enable(true, {
    --         bufnr = ev.buf,
    --         client_id = ev.data.client_id,
    --     })
    end
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('jsonls')

require('vim._core.ui2').enable({
    enable = true, -- Whether to enable or disable the UI.
    msg = { -- Options related to the message module.
        targets = 'cmd',
        timeout = 4000
        }
    })

    require('nvim-treesitter').setup({
        install_dir = vim.fn.stdpath('data') .. '/site'
    })
    require('nvim-treesitter').install({
        'c',
        'cpp',
        'objc',
        'lua',
        'python',
        'vim',
        'vimdoc',
        'json',
        'json5'
    })

    vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('ts_highlight', { clear = true }),
        callback = function(ev)
            pcall(vim.treesitter.start, ev.buf)
        end,
    })

    vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('google_cpp_style', { clear = true }),
        pattern = { 'c', 'cpp', 'objc', 'objcpp' },
        callback = function()
            vim.opt_local.expandtab = true
            vim.opt_local.tabstop = 2
            vim.opt_local.shiftwidth = 2
            vim.opt_local.softtabstop = 2
            vim.opt_local.textwidth = 80
            vim.opt_local.formatexpr = "v:lua.vim.lsp.formatexpr()"
        end,
    })
