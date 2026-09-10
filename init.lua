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

opt.background = 'dark'
vim.cmd('colorscheme habamax')

-- vim-plug：不存在则自动下载（多源容错）
local plug = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'

if vim.fn.filereadable(plug) == 0 then
  for _, url in ipairs({
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
    'https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
    'https://gitee.com/mirrors/vim-plug/raw/master/plug.vim',
  }) do
    vim.fn.system({ 'curl', '-fsLo', plug, '--create-dirs', url })
    if vim.v.shell_error == 0 then break end
  end
end

if vim.fn.filereadable(plug) == 1 then
  vim.cmd('source ' .. vim.fn.fnameescape(plug))
end

-- coc.nvim
vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  call plug#end()
]])

-- coc-settings.json：不存在则写入默认补全设置
local coc_cfg = vim.fn.stdpath('config') .. '/coc-settings.json'
if vim.fn.filereadable(coc_cfg) == 0 then
  local f = io.open(coc_cfg, 'w')
  if f then
    f:write(vim.fn.json_encode({
      ['suggest.autoTrigger'] = 'always',
      ['suggest.noselect'] = false,
      ['suggest.timeout'] = 500,
    }))
    f:close()
  end
end

-- 补全相关选项
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.shortmess:append('c')
opt.updatetime = 300
