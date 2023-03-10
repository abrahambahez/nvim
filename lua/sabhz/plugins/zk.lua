local zk_setup, zk = pcall(require, "zk")
if not zk_setup then
    return
end

zk.setup({
    picker = "telescope",
    lsp = {
    -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
        cmd = { "zk", "lsp" },
        name = "zk",
        -- on_attach = ...
        -- etc, see `:h vim.lsp.start_client()`
    },
    
    -- automatically attach buffers in a zk notebook that match the given filetypes
    auto_attach = {
        enabled = true,
        filetypes = { "markdown" },
    },
  },
})
