local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- prev sugestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next sugestion
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion sugestion
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window 
        ["<CR>"] = cmp.mapping.confirm({ select = false}), -- select

    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- lsp
        { name = 'buffer' }, -- text within current buffer
        { name = "path" } -- file system paths
  })
})


