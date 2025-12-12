local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- LISTA DE LENGUAJES GESTIONADOS POR MASON
  -- Nota: Hemos quitado 'clangd' y 'hls' porque los tienes por pacman
  ensure_installed = {
      'lua_ls',          
      'jdtls',           
      'pyright',         
      'gopls',           
      'html',            
      'ts_ls',           
      'cssls',           
      'rust_analyzer',   
  }, 
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = { globals = { 'vim' } }
                }
            }
        })
    end,
  },
})

-- ==========================================
-- CONFIGURACIÓN MANUAL (SISTEMA / PACMAN)
-- ==========================================

-- 1. C / C++ (Clangd)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
    callback = function(ev)
        local root_dir = vim.fs.dirname(vim.fs.find({
            'compile_commands.json', '.git', '.clangd'
        }, { upward = true, path = ev.file })[1])

        vim.lsp.start({
            name = 'clangd',
            cmd = { 'clangd', '--background-index' },
            root_dir = root_dir,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
    end,
})

-- 2. HASKELL (HLS) - NUEVO
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "haskell", "lhaskell", "cabal" },
    callback = function(ev)
        -- Buscamos ficheros típicos de proyectos Haskell
        local root_dir = vim.fs.dirname(vim.fs.find({
            'hie.yaml', 'stack.yaml', 'cabal.project', '*.cabal', '.git'
        }, { upward = true, path = ev.file })[1])

        vim.lsp.start({
            name = 'haskell-language-server',
            -- El comando estándar en Arch suele ser el wrapper
            cmd = { 'haskell-language-server-wrapper', '--lsp' },
            root_dir = root_dir,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
    end,
})

-- ==========================================

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), 
    ['<C-Space>'] = cmp.mapping.complete(), 
  }),
})
