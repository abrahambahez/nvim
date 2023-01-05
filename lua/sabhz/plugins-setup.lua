-- Autocommands to install and setupa packer from dotfiles
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- end of snippet 👆🏽

local status, packer = pcall(require, "packer")
if not status then 
    return
end

return packer.startup(function(use)

    use("wbthomason/packer.nvim") -- packer automanages itself
    -- colors
    use("bluz71/vim-nightfly-guicolors")
    -- essentials
    use("tpope/vim-surround")
        -- ys motion character
    use("vim-scripts/ReplaceWithRegister")
        -- word
    use("nvim-lua/plenary.nvim")
    -- Config Nvim LSP
    -- lsp servers
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim") 
    -- lsp config
    use 'neovim/nvim-lspconfig' 
    use("hrsh7th/cmp-nvim-lsp")
    -- completion 
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    -- typescript server
    use("jose-elias-alvarez/typescript.nvim")
    -- file explorer
    use("nvim-tree/nvim-tree.lua")
    -- fuzzy finding
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
    -- tree sitter for better syntax highlighting
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })
    --auto closing
    use("windwp/nvim-autopairs")
    if packer_bootstrap then
        require("packer").sync()
    end
end)
