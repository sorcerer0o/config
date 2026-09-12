local opt = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

opt.number = true
opt.relativenumber = true
opt.signcolumn = 'auto'
opt.termguicolors = true
opt.wrap = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.clipboard = 'unnamedplus'
opt.mouse = ''

vim.cmd('filetype plugin indent on')
vim.cmd('colorscheme habamax')

vim.pack.add({
  { src = "https://github.com/neoclide/coc.nvim", version = "release" },
})

local coc_cfg = vim.fn.stdpath('config') .. '/coc-settings.json'
if vim.fn.filereadable(coc_cfg) == 0 then
  local f = io.open(coc_cfg, 'w')
  if f then
    f:write(vim.fn.json_encode({
      ['suggest.autoTrigger'] = 'always',
      ['suggest.noselect'] = true,
      ['suggest.timeout'] = 500,
    }))
    f:close()
  end
end

-- 补全相关选项
opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'fuzzy' }
opt.updatetime = 300
