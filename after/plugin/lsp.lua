-- nvim-cmp capabilities for better completion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP-related keymaps for all servers
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
  end,
})

local lspconfig = require("lspconfig")

-- Python
lspconfig.pyright.setup{
    capabilities = capabilities,
    settings = {
        pyright = {
            disableOrganizeImports = false,
        },
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",

                -- Prevent Pyright from indexing huge or useless dirs
                exclude = {
                    "**/__pycache__",
                    "**/.git",
                    "**/.mypy_cache",
                    "**/.pytest_cache",
                    "**/node_modules",
                    "venv",
                    ".venv",
                    "dist",
                    "build"
                }
            }
        }
    }
}

-- C/C++
lspconfig.clangd.setup{
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
}

-- Java (Note: jdtls sometimes needs extra setup for projects)
lspconfig.jdtls.setup{
  capabilities = capabilities,
}

-- JavaScript/TypeScript (see new server name)
lspconfig.ts_ls.setup{   -- CHANGED from tsserver to ts_ls
  capabilities = capabilities,
}

-- SQL (using sqlls, adjust if you use sqls)
lspconfig.sqlls.setup{
  capabilities = capabilities,
  -- Add extra configuration if needed for your SQL dialects/workflow
}

-- Bash
lspconfig.bashls.setup{
  capabilities = capabilities,
}

-- Lua
lspconfig.lua_ls.setup{
  capabilities = capabilities,
}

-- Rust
lspconfig.rust_analyzer.setup{
  capabilities = capabilities,
}

-- nvim-cmp setup (for completion, with optional snippet support)
local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    -- { name = 'luasnip' }, -- Uncomment if you use snippets
  },
  snippet = {
    expand = function(args)
      -- Uncomment one line depending on your snippet engine
      -- require('luasnip').lsp_expand(args.body) -- LuaSnip
      vim.snippet.expand(args.body) -- Neovim 0.10+ native snippets
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

-- Optionally, reserve the sign column to avoid layout shifts
vim.opt.signcolumn = 'yes'
