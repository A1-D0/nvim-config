-- after/plugin/glance.lua

local ok, glance = pcall(require, "glance")
if not ok then
    return
end

glance.setup({
    hooks = {
        before_open = function(results, open, jump, method)
            -- You can modify results here before the glance window opens
            open(results)
        end,
    },
})

-- Glance.nvim setup for "peek" functionality
-- Global keymaps (no buffer-local opts needed)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "gpd", "<CMD>Glance definitions<CR>", opts)      -- peek definitions
map("n", "gpr", "<CMD>Glance references<CR>", opts)       -- peek references
map("n", "gpi", "<CMD>Glance implementations<CR>", opts)  -- peek implementations
map("n", "gpt", "<CMD>Glance type_definitions<CR>", opts) -- peek type defs

