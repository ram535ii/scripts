vim.notify("Welcome to your ridiculously bespoke neovim setup 😎", vim.log.levels.INFO)
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/legacy-init.vim')
