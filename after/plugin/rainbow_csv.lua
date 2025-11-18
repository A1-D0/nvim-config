vim.keymap.set('n', '<leader>cv', function()
    vim.cmd('CsvViewToggle display_mode=border header_lnum=1')
end, { noremap = true, silent = true, desc = 'Toggle CSV border view' })

