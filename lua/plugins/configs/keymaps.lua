local opts = { noremap=true, silent=true }

function _G.closeBuffer()
  local treeView = require('nvim-tree.view')
  local bufferline = require('bufferline')
  local explorerWindow = treeView.get_winnr()
  local wasExplorerOpen = vim.api.nvim_win_is_valid(explorerWindow)
  local bufferToDelete = vim.api.nvim_get_current_buf()

  if (wasExplorerOpen) then
    bufferline.cycle(-1)
  end
  vim.cmd('bdelete! ' .. bufferToDelete)
end

vim.api.nvim_set_keymap('n', '<Tab>',  [[<Cmd>BufferLineCycleNext<cr>]], opts)
vim.api.nvim_set_keymap('n', '<S-Tab>',  [[<Cmd>BufferLineCyclePrev<cr>]], opts)
vim.api.nvim_set_keymap('', '<Leader>v',  [[<Cmd>Neotree toggle<cr>]], opts)
vim.api.nvim_set_keymap('n', ';', '<C-w>', opts )
vim.api.nvim_set_keymap('n', '<S-CR>', '<m-enter>', opts )
vim.api.nvim_set_keymap('n', '<Leader>q',':<C-U>bprevious <bar> bdelete # <cr>', opts)

-- moving between panels with alt+hjkl
vim.api.nvim_set_keymap('t', '<A-h>',[[<C-\><C-n><C-w>h]], opts)
vim.api.nvim_set_keymap('t', '<A-j>',[[<C-\><C-n><C-w>j]], opts)
vim.api.nvim_set_keymap('t', '<A-k>',[[<C-\><C-n><C-w>k]], opts)
vim.api.nvim_set_keymap('t', '<A-l>',[[<C-\><C-n><C-w>l]], opts)

vim.api.nvim_set_keymap('n', '<A-h>',[[<C-w>h]], opts)
vim.api.nvim_set_keymap('n', '<A-j>',[[<C-w>j]], opts)
vim.api.nvim_set_keymap('n', '<A-k>',[[<C-w>k]], opts)
vim.api.nvim_set_keymap('n', '<A-l>',[[<C-w>l]], opts)


vim.api.nvim_set_keymap('n', '<Leader>ar',  [[<Cmd>lua vim.lsp.buf.code_action()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<Leader>af',  [[<Cmd>CodeActionMenu<cr>]], opts)

-- Format

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
