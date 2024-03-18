return {
   {
      "williamboman/mason.nvim",
      lazy = false,
      config = function()
         require("mason").setup({})
      end,
   },
   {
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
      opts = {
         auto_install = true,
      },
   },
   {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()

         local capabilities = require('cmp_nvim_lsp').default_capabilities()

         local lspconfig = require("lspconfig", "tsserver", "pyright", "hls")
         lspconfig.lua_ls.setup({
            capabilities = capabilites
         })
         lspconfig.tsserver.setup({
            capabilities = capabilities
         })
         lspconfig.pyright.setup({
            capabilities = capabilities
         })
         lspconfig.hls.setup({})

         vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
         vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
         vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      end,
   },
}
