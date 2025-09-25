local api = require('Comment.api')

-- normal mode comments (Note: keymap is CTRL + /)
vim.keymap.set('n', '<C-_>', function()
  api.toggle.linewise.current()
end, { noremap = true, silent = true, desc = 'Comment line (normal)' })

-- visual mode (x mode, in this case) comments
vim.cmd([[
  xnoremap <silent> <C-_> :<C-u>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>
]])

-- insert mode comments
vim.keymap.set('i', '<C-_>', '<C-o><Cmd>lua require("Comment.api").toggle.linewise.current()<CR>', { noremap = true, silent = true, desc = 'Comment line (insert)' })

