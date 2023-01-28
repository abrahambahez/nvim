local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

--typescript
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
    return
end

-- typescript keybindings


typescript.setup({
    server = {
        capabilities = capabilities,
        on_attach = on_attach
    }
})

lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["astro"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
--[[
lspconfig.zk.setup {
  capabilities = capabilities
}


configs.zk = {
  default_config = {
    cmd = {'zk', 'lsp', '--log', '/tmp/zk-lsp.log'},
    filetypes = {'markdown'},
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  };
}

lspconfig.zk.setup({ on_attach = function(client, buffer) 
  -- some custom on_attach function for doing keybindings and other things..
  -- see: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
end })

--]]

