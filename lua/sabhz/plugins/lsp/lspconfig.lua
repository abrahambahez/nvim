local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["html"].setup({
    capabilities = capabilities
})

lspconfig["pyright"].setup({
    capabilities = capabilities
})

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
