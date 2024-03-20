return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
         autoinstall = true,
         ensure_installed = {"markdown", "lua", "haskell", "javascript", "python", "c", "rust" },
         highlight = { enable = true },
         indent = { enable = true },
      })
   end,
}
