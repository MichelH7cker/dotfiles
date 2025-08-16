-- ~/.config/nvim/after/plugin/lsp.lua (VERSÃO SEGURA E FINAL)

-- Adicionamos esta verificação de segurança.
-- Tenta carregar os plugins necessários de forma segura. Se falhar, o arquivo para de ser executado.
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then
  return
end

local status_ok, lspkind = pcall(require, "lspkind")
if not status_ok then
  return
end

-- A partir daqui, temos certeza que 'cmp', 'lsp-zero' e 'lspkind' existem.

-- Configuração do lsp-zero (agora sem o autocomplete, como no nosso workaround)
lsp_zero.preset('recommended')

vim.diagnostic.config({
    virtual_text = true,
})

lsp_zero.setup()

-- Carrega a biblioteca de snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Configuração do nvim-cmp (com a fonte 'nvim_lsp' desativada para evitar o bug original)
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require('luasnip').expand_or_jumpable() then
                require('luasnip').expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require('luasnip').jumpable(-1) then
                require('luasnip').jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    
    -- Usando a configuração de segurança que evita o bug do 'bufnr'
    sources = cmp.config.sources({
        -- { name = 'nvim_lsp' }, -- <<-- MANTEMOS DESATIVADO POR ENQUANTO
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    }),
})
