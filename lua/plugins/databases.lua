return {
   "tpope/vim-dadbod",
   "kristijanhusak/vim-dadbod-ui",
   "kristijanhusak/vim-dadbod-completion",
   config = function()
      require("dadbod").setup({
         -- Add or remove databases that can be opened
      })
   end,
}
