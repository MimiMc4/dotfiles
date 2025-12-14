vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n","<leader>pv", ":NvimTreeToggle<CR>", { silent = true })
