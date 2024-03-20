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
         local capabilities = require("cmp_nvim_lsp").default_capabilities()

         local lspconfig = require("lspconfig", "tsserver", "pyright", "hls")
         lspconfig.lua_ls.setup({
            capabilities = capabilites,
         })
         lspconfig.tsserver.setup({
            capabilities = capabilities,
         })
         lspconfig.pyright.setup({
            capabilities = capabilities,
         })
         lspconfig.hls.setup({})

         -- QUARTO configuration
         local function get_quarto_resource_path()
            local function strsplit(s, delimiter)
               local result = {}
               for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
                  table.insert(result, match)
               end
               return result
            end

            local f = assert(io.popen("quarto --paths", "r"))
            local s = assert(f:read("*a"))
            f:close()
            return strsplit(s, "\n")[2]
         end

         local lua_library_files = vim.api.nvim_get_runtime_file("", true)
         local lua_plugin_paths = {}
         local resource_path = get_quarto_resource_path()
         if resource_path == nil then
            vim.notify_once("quarto not found, lua library files not loaded")
         else
            table.insert(lua_library_files, resource_path .. "/lua-types")
            table.insert(lua_plugin_paths, resource_path .. "/lua-plugin/plugin.lua")
         end
         -- End QUARTO configuration

         vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
         vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
         vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      end,
   },
}
