local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = { 
        "python",
        "javascript",
        "bash",
        "json",
        "yaml",
        "markdown",
        "html",
        "css",
        "bibtex",
    }, -- "all", "maintained" or a list of languages
    sync_install = false, -- install languages syncronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- list of parsers to ignore installing
    hightlight = {
        enable = true, -- false disable the whole extension
        disable = { "" }, -- list of languages disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
})
