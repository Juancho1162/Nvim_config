return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {"pyright"}
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig", "tsserver","pyright", "hls")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.pyright.setup({})
      lspconfig.hls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
