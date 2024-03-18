return  {
   'akinsho/toggleterm.nvim',
   version = "*", 
   config = function()
      require("toggleterm").setup({
         function(term)
            if term.direction == "horizontal" then
               return 15
            elseif term.direction == "vertical" then
               return vim.o.columns * 0.4
            end
         end,
         open_mapping = [[<c-t>]],
         direction = 'float'
      })
   end
}
