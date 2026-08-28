local git_branch = ''

local function update_git_branch()
  local dir = vim.fn.expand('%:p:h')
  if dir == '' then dir = vim.fn.getcwd() end
  local branch = vim.fn.system('git -C ' .. vim.fn.shellescape(dir) .. ' rev-parse --abbrev-ref HEAD 2>/dev/null'):gsub('\n', '')
  git_branch = branch ~= '' and ' [' .. branch .. ']' or ''
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'DirChanged' }, {
  callback = update_git_branch,
})

local function statusline()
  local mode_map = {
    ['n']  = 'NORMAL', ['i']  = 'INSERT', ['v']  = 'VISUAL',
    ['V']  = 'V-LINE', ['\22'] = 'V-BLOCK', ['c'] = 'COMMAND',
    ['R']  = 'REPLACE', ['t'] = 'TERMINAL', ['s'] = 'SELECT',
    ['S']  = 'S-LINE', ['\19'] = 'S-BLOCK',
  }
  local mode = mode_map[vim.fn.mode()] or vim.fn.mode()

  local filename = vim.fn.expand('%:t')
  if filename == '' then filename = '[No Name]' end

  local modified = vim.bo.modified and ' [+]' or ''
  local readonly = vim.bo.readonly and ' [RO]' or ''
  local ft = vim.bo.filetype ~= '' and vim.bo.filetype or ''
  local line = vim.fn.line('.')
  local col = vim.fn.col('.')
  local total = vim.fn.line('$')

  return table.concat({
    ' ', mode,
    git_branch,
    ' ', filename, modified, readonly,
    '%=',
    ft,
    '  ', line, ':', col, '/', total, ' ',
  })
end

_G.Statusline = statusline
vim.opt.statusline = '%!v:lua.Statusline()'
