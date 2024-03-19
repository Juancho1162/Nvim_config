vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.g.mapleader = " "
vim.opt.termguicolors = true

local clip_path = '/mnt/c/Windows/System32/clip.exe'
if vim.fn.executable(clip_path) == 1 then
   vim.cmd([[
    augroup WSLYank
      autocmd!
      autocmd TextYankPost * call system(']] .. clip_path .. [[', @0)
    augroup END
  ]])
end
