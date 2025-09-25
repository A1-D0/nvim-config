require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",          -- Python
    "clangd",           -- C/C++
    "jdtls",            -- Java
    "ts_ls",            -- JavaScript/TypeScript
    "sqlls",            -- SQL (see note below)
    "bashls",           -- Bash
    "lua_ls",           -- Lua
    "rust_analyzer",    -- Rust
  }
})
