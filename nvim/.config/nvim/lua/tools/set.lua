vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2  
vim.opt.softtabstop = 2 
vim.opt.shiftwidth = 2 
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- allow clipboard inside and outside nvim
vim.opt.clipboard="unnamedplus"


-- change colors of comments and lines
vim.cmd('highlight Comment guifg=#778899')
vim.cmd('highlight LineNr guifg=#778899')

vim.opt.hlsearch = true
