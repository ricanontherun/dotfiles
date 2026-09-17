vim.wo.number = true
vim.o.spell = true
vim.o.spelllang = 'en_us'
vim.opt.swapfile = true
vim.opt.backupdir = '~/vimtmp//,.'
vim.opt.directory = '~/vimtmp//,.'
vim.g.markdown_fenced_languages = { 'python', 'vim', 'lua', 'go', 'csharp' }

-- Leader
vim.g.mapleader = "\\"

-- Movement remapping
vim.keymap.set('n', 'j', 'h')
vim.keymap.set('n', 'k', 'j')
vim.keymap.set('n', 'l', 'k')
vim.keymap.set('n', ';', 'l')
vim.keymap.set('v', 'j', 'h')
vim.keymap.set('v', 'k', 'j')
vim.keymap.set('v', 'l', 'k')
vim.keymap.set('v', ';', 'l')

-- configuration management
vim.keymap.set('n', '<Leader>oc', '<cmd>tabe $MYVIMRC<cr>', {noremap = true})
vim.keymap.set('n', '<Leader>rc', '<cmd>source $MYVIMRC<cr><cmd>echo "reloaded init.lua"<cr>', {noremap = true})

-- Save current buffer switch to normal mode
vim.keymap.set('i', '<c-s>', '<cmd>write<cr><esc>', {desc = "save buffer", noremap = true})
vim.keymap.set('n', '<c-s>', '<cmd>write<cr><esc>', {desc = "save buffer", noremap = true})

vim.keymap.set('n', 'q', '<cmd>q<cr>', {noremap = true})

-- Split management and navigation
vim.keymap.set('n', '<Leader>vs', '<cmd>vsplit<cr>', {noremap = true})
vim.keymap.set('n', '<Leader>hs', '<cmd>split<cr>', {noremap = true})
vim.keymap.set('n', 'f;', '<cmd>wincmd l<cr>', {noremap = true})
vim.keymap.set('n', 'fj', '<cmd>wincmd h<cr>', {noremap = true})
vim.keymap.set('n', 'fl', '<cmd>wincmd k<cr>', {noremap = true})
vim.keymap.set('n', 'fk', '<cmd>wincmd j<cr>', {noremap = true})

vim.keymap.set('n', '<Leader>e', '<cmd>Explore<cr>', {noremap = true})

vim.keymap.set('n', '<Leader>t', '<cmd>tabe<cr>', {noremap = true})
vim.keymap.set('n', '<Leader>ft', '<cmd>tabe<cr><cmd>Explore<cr>', {noremap = true})
vim.keymap.set('n', 'g;', '<cmd>tabn<cr>', {noremap = true})
vim.keymap.set('n', 'gj', '<cmd>tabp<cr>', {noremap = true})

-- Markdown stuff
vim.keymap.set('n', '<Leader>1', 'i# ', {noremap=true})
vim.keymap.set('n', '<Leader>2', 'i## ', {noremap=true})
vim.keymap.set('n', '<Leader>3', 'i### ', {noremap=true})
