-- Previous code kept for future reference, just in case
-- local builtin = require('telescope.builtin')
--
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'git file search' })
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

local telescope = require('telescope')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

-- Custom previewer that handles PDF preview via 'pdftotext'
local preview_pdf_or_text = previewers.new_termopen_previewer({
  get_command = function(entry)
    local filepath = entry.path or entry.value or entry.filename
    if not filepath then
      return { "echo", "No file" }
    end

    if filepath:match("%.pdf$") then
      -- Display first page as text in iTerm2
        return { "pdftotext", filepath, "-" }
    else
      return { "bat", "--style=plain", "--color=always", filepath }
    end
  end,
})

-- Setup Telescope (can be mostly empty unless customizing other defaults)
telescope.setup({})

-- Keybindings (same as before, but `find_files` uses custom previewer)
vim.keymap.set('n', '<leader>pf', function()
  builtin.find_files({
    previewer = preview_pdf_or_text,
  })
end, { desc = 'Telescope find files' })

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'git file search' })

vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

