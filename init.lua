local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = 'auto'
opt.termguicolors = true
opt.background = "dark"
vim.cmd.colorscheme('habamax')
opt.wrap = true
opt.startofline = true

opt.tabstop = 8
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.laststatus = 3
opt.linebreak = true
opt.breakindent = true
opt.showcmd = true
opt.wildmenu = true
opt.wildmode = 'longest:full,full'
opt.wildignorecase = true
opt.wildoptions = "pum,fuzzy"
opt.hidden = true
opt.autoread = true

opt.splitright = true
opt.splitbelow = true

opt.clipboard = 'unnamedplus'
opt.mouse = ''
opt.updatetime = 300
opt.ttimeoutlen = 50

opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'preview' }

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

vim.g.coc_global_extensions = {
    'coc-snippets',
    'coc-prettier',
    'coc-marketplace',
    'coc-lists',
    'coc-highlight',
    'coc-git',
    'coc-explorer',
    'coc-eslint',
    'coc-tsserver',
    'coc-sh',
    'coc-rust-analyzer',
    'coc-pyright',
    'coc-json',
    'coc-cmake',
    'coc-clangd',
    '@yaegassy/coc-volar',
    'coc-lua',
    'coc-yaml',
    'coc-pairs',
    'coc-sql',
}

vim.pack.add({
    { src = "https://github.com/neoclide/coc.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/mks-h/treesitter-autoinstall.nvim" },
    { src = "https://github.com/google/vim-maktaba.git" },
    { src = "https://github.com/google/vim-glaive.git" },
    { src = "https://github.com/google/vim-codefmt.git" },
})

require('nvim-treesitter').setup()
require("treesitter-autoinstall").setup()
require('nvim-treesitter').install({})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

local coc_cfg = vim.fn.stdpath('config') .. '/coc-settings.json'
if vim.fn.filereadable(coc_cfg) == 0 then
    local f = io.open(coc_cfg, 'w')
    if f then
        f:write(vim.fn.json_encode({
            ['suggest.noselect'] = true,
            ['suggest.triggerAfterInsertEnter'] = true,
            ['sumneko-lua.enableNvimLuaDev'] = true,
            ['Lua.diagnostics.globals'] = { 'vim' },
            ['Lua.runtime.version'] = 'LuaJIT',
             ['clangd.arguments'] = {
                '--background-index',
                '--clang-tidy',
                '--completion-style=detailed',
                '--header-insertion=iwyu',
                '--pch-storage=memory',
            },
        }))
        f:close()
    end
end

vim.g.glaive_codefmt_plugin_mappings = true

vim.api.nvim_create_augroup("c_settings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "c_settings",
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.cindent = true
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.textwidth = 80
  end,
})
