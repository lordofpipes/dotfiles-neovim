-- get rid of visual line navigation, use real line navigation
vim.keymap.del({ "n", "x" }, "j")
vim.keymap.del({ "n", "x" }, "<Down>")
vim.keymap.del({ "n", "x" }, "k")
vim.keymap.del({ "n", "x" }, "<Up>")

-- allow ctrl+left and ctrl+right to work
vim.keymap.del("n", "<C-Left>")
vim.keymap.del("n", "<C-Right>")

-- toggle lsp lines diagnostics
local lsplines_toggle = {
  name = "LSP Diagnostics",
  get = function()
    return not vim.g.lsplines_toggle_off
  end,
  set = function(state)
    vim.g.lsplines_toggle_off = not state
    vim.diagnostic.config({ virtual_lines = not vim.g.lsplines_toggle_off, underline = not vim.g.lsplines_toggle_off })
  end,
}

LazyVim.toggle.map("<c-k>", lsplines_toggle)
LazyVim.toggle.map("<leader>ud", lsplines_toggle)

-- get rid of lazygit, keep up to date with upstream
vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gb")
vim.keymap.del("n", "<leader>gB")
vim.keymap.del("n", "<leader>gf")
vim.keymap.del("n", "<leader>gl")
vim.keymap.del("n", "<leader>gL")
