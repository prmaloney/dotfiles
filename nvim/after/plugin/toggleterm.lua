require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  direction = "vertical",
  size = 60,
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<esc>', '<c-\\><c-n>', { noremap = true, silent = true })
  end
}
local nnoremap = require('prmaloney.keymap').nnoremap
local Terminal = require('toggleterm.terminal').Terminal

nnoremap('<C-|>', '<cmd>ToggleTermToggleAll<CR>')
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

require('prmaloney.keymap').nnoremap("<leader>gg", "<cmd>lua _lazygit_toggle()<CR>")
